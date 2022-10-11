# Program description: Program to concatenate two strings and count vowels and consonents

.data
msg1:      .asciiz     "Enter the first string: "
msg2:       .asciiz     "Enter the second string: "
msg3:       .asciiz     "Combined String: "
msg4:   .asciiz "String with just alphabets: "
msg5:   .asciiz "Number of Vowels in String: "
msg6:  .asciiz "Number of Consonants in String: "
vowel:      .asciiz     "aeiou"
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

    jal     countVowelConsotant                                                     # Jumping to countVowelConsotant to check how many vowels and consonant in combined string

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
    beqz    $t1,                        inner
    li      $t2,                        1
    li      $t3,                        64
    li      $t4,                        96

    slti    $s1,                        $t1,                        91              # $s1 < ascii value 64 and 91
    slt     $s2,                        $t3,                        $t1

    and     $s3,                        $s1,                        $s2

    slti    $s4,                        $t1,                        123             # $s4 < ascii value 96 and 123
    slt     $s5,                        $t4,                        $t1

    and     $s6,                        $s4,                        $s5

    or      $s7,                        $s3,                        $s6             # if char is either between 64,91 and 96,122
    beqz    $s7,                        update
    sb      $t1,                        0($t9)                                      # Update new results in 0($t9)
    addi    $t9,                        $t9,                        1               # Increment char index
    j       update

update:
    addi    $t7,                        $t7,                        1               # Move to next letter in string
    j       removeNonAlphaCharacters

inner:
    lb      $t1,                        0($t8)
    bgt     $t8,                        $t9,                        nonAlphaReturn  # if > then jump to nonAlphaReturn
    move    $a0,                        $t1                                         # if not then store $t1 in $a0

    addi    $t8,                        $t8,                        1               # Incrementing inner loop
    j       inner

nonAlphaReturn:
    jr      $ra                                                                     # Return

countVowelConsotant:
    la      $a0,                        msg4                                        # Printing msg4
    li      $v0,                        4
    syscall 

    la      $a0,                        concatenatedNonAlphaString                  # Results stored in concatenateString data value, remove non alpha characters
    syscall 

    li      $v0,                        4                                           # Printing newline
    la      $a0,                        newline
    syscall 

    li      $s2,                        0                                           # Vowel counter
    li      $s3,                        0                                           # Consonant counter
    la      $s0,                        concatenatedNonAlphaString                  # Load pointer to the concatenatedNonAlphaString

countInner:
    lb      $t0,                        0($s0)                                      # Setting first string char in $t0 for loop
    addiu   $s0,                        $s0,                        1               # Find next char in string
    beqz    $t0,                        countDone                                   # Once reach end of string branch to

    addi    $s3,                        $s3,                        1               # Increment consonant count
    la      $s1,                        vowel                                       # Set pointer to the aeiou vowels in data

vowelInner:
    lb      $t1,                        0($s1)                                      # Testing first vowel
    beqz    $t1,                        countInner                                  # Looping through the vowels
    addiu   $s1,                        $s1,                        1               # Increment vowels
    bne     $t0,                        $t1,                        vowelInner      # If it's a vowel then jump to vowelInner

    addi    $s2,                        $s2,                        1               # Incremenet vowel counter
    sub     $s3,                        $s3,                        1               # Decriment consonant count
    j       countInner                                                              # Go to next string char

countDone:
    li      $v0,                        4                                           # Printing msg5
    la      $a0,                        msg5
    syscall 

    li      $v0,                        1                                           # Printing vowel count
    move    $a0,                        $s2
    syscall 

    li      $v0,                        4                                           # Printing newline
    la      $a0,                        newline
    syscall 

    li      $v0,                        4                                           # Printing msg6
    la      $a0,                        msg6
    syscall 

    li      $v0,                        1                                           # Printing consonant count
    move    $a0,                        $s3
    syscall 

    li      $v0,                        10                                          # Exit program
    syscall 