# Program description: Program to concatenate two strings and count vowels and consonents

.data
msg1:      .asciiz     "Enter the first string: "
msg2:       .asciiz     "Enter the second string: "
msg3:       .asciiz     "Combined String: "

newline:    .asciiz     "\n"

str1:    .space      256                                # User inputed str1
str2:    .space      256                                # User inputed str2
concatenatedString:    .space      512                  # str1 = str2

.text

main:
    la      $a0,            msg1                        # Printing msg1
    li      $v0,            4
    syscall 

    la      $a1,            str1                        # str1 buffer address
    jal     userInput
    move    $s0,            $v0                         # str1 in $s0

    la      $a0,            msg2                        # Printing msg2
    li      $v0,            4
    syscall 

    la      $a1,            str2                        # str2 buffer address
    jal     userInput
    move    $s1,            $v0                         # str2 in $s1

    la      $a0,            concatenatedString          # concatenatedString buffer address

    la      $a1,            str1                        # str1 loaded into $a1 and moved to function concatenate
    jal     concatenate                                 # Jump to function concatenate

    la      $a1,            str2                        # str2 loaded into $a1 and moved to function concatenate
    jal     concatenate                                 # Jump to function concatenate

    la      $a0,            msg3                        # Printing msg3
    li      $v0,            4
    syscall 

    j removeNonAlphaCharacters                          # Removing any character that's not a letter

    li      $v0,            4                           # Printing results of concatenate(str1, str2)
    la      $a0,            concatenatedString          # Results stored in concatenateString data value
    syscall 

    li      $v0,            4                           # Printing newline
    la      $a0,            newline
    syscall 

    li      $v0,            4                           # Printing newline
    la      $a0,            newline
    syscall 

    li      $v0,            10                          # Exit program
    syscall 

userInput:
    li      $v0,            8                           # Reading string input
    move    $a0,            $a1                         # Storing in $a0
    li      $a1,            256                         # Setting buffer space for string
    syscall 

    li      $v1,            0x0A                        # Making it's stored on same line

loop:
    lb      $v0,            0($a0)                      # Next char in string
    addi    $a0,            $a0,                1       # Increment the character through string
    beq     $v0,            $v1,                done    # Checking if end of string, if yes jump to done
    bnez    $v0,            loop                        # If not then jump back to loop

done:
    sub     $a0,            $a0,                1       # Inner increment
    sb      $zero,          0($a0)                      # Removing newline so string is printed on same line
    sub     $v0,            $a0,                $a1     # Getting string length
    j       $ra                                         # return

concatenate:
    lb      $v0,            0($a1)                      # Current char at start of string
    beqz    $v0,            concatenateDone             # If there is no char then jump to done method

    sb      $v0,            0($a0)                      # Else store the char in $v0

    addi    $a0,            $a0,                1       # Incrementing to next Char of final concatenatedString
    addi    $a1,            $a1,                1       # Incrementing to next Char of string
    j       concatenate

concatenateDone:
    sb      $zero,          0($a0)                      # Store the concatenatedString
    jr      $ra                                         # return

removeNonAlphaCharacters:

