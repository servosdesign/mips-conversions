# Program description: Program to concatenate two strings and count vowels and consonents

.data
msg1:      .asciiz     "Enter the first string: "
msg2:       .asciiz     "Enter the second string: "
msg3:       .asciiz     "Combined String: "
msg4:   .asciiz "String with just alphabets: "
msg5:   .asciiz "Number of Vowels in String: "
msg6:  .asciiz "Number of Consonants in String: "

newline:    .asciiz     "\n"

str1:    .space      256                                                            # User inputed str1
str2:    .space      256                                                            # User inputed str2
concatenatedString:    .space      512                                              # str1 = str2
concatenatedNonAlphaString: .space 512

.text

main:
    la      $a0,                        msg1                                        # Printing msg1
    li      $v0,                        4
    syscall 

    la      $a1,                        str1                                        # str1 buffer address
    jal     userInput
    move    $s0,                        $v0                                         # str1 in $s0

    la      $a0,                        msg2                                        # Printing msg2
    li      $v0,                        4
    syscall 

    la      $a1,                        str2                                        # str2 buffer address
    jal     userInput
    move    $s1,                        $v0                                         # str2 in $s1

    la      $a0,                        concatenatedString                          # concatenatedString buffer address

    la      $t9,                        concatenatedNonAlphaString                  # Where we store our new string after the characters are removed
    move    $t8,                        $t9

    la      $a1,                        str1                                        # str1 loaded into $a1 and moved to function concatenate
    jal     concatenate                                                             # Jump to function concatenate

    la      $a1,                        str2                                        # str2 loaded into $a1 and moved to function concatenate
    jal     concatenate                                                             # Jump to function concatenate

    la      $a0,                        msg3                                        # Printing msg3
    li      $v0,                        4
    syscall 

    li      $v0,                        4                                           # Printing results of concatenate(str1, str2)
    la      $a0,                        concatenatedString                          # Results stored in concatenateString data value
    syscall 

    li      $t2,                        0                                           # initialize the count to zero
    move    $t7,                        $a0
    jal     removeNonAlphaCharacters                                                # Removing any character that's not a letter


    li      $v0,                        4                                           # Printing newline
    la      $a0,                        newline
    syscall 

    li      $v0,                        4                                           # Printing newline
    la      $a0,                        newline
    syscall 

    jal     countVowelConsotant

userInput:
    li      $v0,                        8                                           # Reading string input
    move    $a0,                        $a1                                         # Storing in $a0
    li      $a1,                        256                                         # Setting buffer space for string
    syscall 

    li      $v1,                        0x0A                                        # Making it's stored on same line

loop:
    lb      $v0,                        0($a0)                                      # Next char in string
    addi    $a0,                        $a0,                        1               # Increment the character through string
    beq     $v0,                        $v1,                        done            # Checking if end of string, if yes jump to done
    bnez    $v0,                        loop                                        # If not then jump back to loop

done:
    sub     $a0,                        $a0,                        1               # Inner increment
    sb      $zero,                      0($a0)                                      # Removing newline so string is printed on same line
    sub     $v0,                        $a0,                        $a1             # Getting string length
    j       $ra                                                                     # return

concatenate:
    lb      $v0,                        0($a1)                                      # Current char at start of string
    beqz    $v0,                        concatenateDone                             # If there is no char then jump to done method

    sb      $v0,                        0($a0)                                      # Else store the char in $v0

    addi    $a0,                        $a0,                        1               # Incrementing to next Char of final concatenatedString
    addi    $a1,                        $a1,                        1               # Incrementing to next Char of string
    j       concatenate

concatenateDone:
    sb      $zero,                      0($a0)                                      # Store the concatenatedString
    jr      $ra                                                                     # return

removeNonAlphaCharacters:
    lb      $t1,                        0($t7)
    beqz    $t1,                        print
    li      $t2,                        1
    li      $t3,                        64
    li      $t4,                        96

    slti    $s1,                        $t1,                        91              # check if char is between ascii value 64 and 91
    slt     $s2,                        $t3,                        $t1

    and     $s3,                        $s1,                        $s2

    slti    $s4,                        $t1,                        123             # check if char is between ascii value 96 and 123
    slt     $s5,                        $t4,                        $t1

    and     $s6,                        $s4,                        $s5

    or      $s7,                        $s3,                        $s6             # doing or if char is either between 64,91 and 96,122
    beqz    $s7,                        update
    sb      $t1,                        0($t9)                                      # then store it in char array
    addi    $t9,                        $t9,                        1
    j       update

update: addi $t7, $t7, 1
    j       removeNonAlphaCharacters

print: lb $t1, 0($t8)                                                               # get the bytes from compressed cahr array buffer2
    bgt     $t8,                        $t9,                        nonAlphaReturn  # print the string
    move    $a0,                        $t1

    addi    $t8,                        $t8,                        1
    j       print
nonAlphaReturn:
    jr      $ra

countVowelConsotant:


    la      $a0,                        msg4                                        # Printing msg4
    li      $v0,                        4
    syscall 

    la      $a0,                        concatenatedNonAlphaString                  # Results stored in concatenateString data value, remove non alpha characters
    syscall 

    li      $v0,                        4                                           # Printing newline
    la      $a0,                        newline
    syscall 

    la      $a0,                        msg5                                        # Printing msg5
    li      $v0,                        4
    syscall 

    li      $v0,                        4                                           # Printing newline
    la      $a0,                        newline
    syscall 

    la      $a0,                        msg6                                        # Printing msg6
    li      $v0,                        4
    syscall 

    li      $v0,                        10                                          # Exit program
    syscall 