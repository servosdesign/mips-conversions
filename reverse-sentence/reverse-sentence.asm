# Program description: Program to reverse a sentence using recursion

.data
input: .space 256
msg1: .asciiz "Enter a sentence: "
output: .space 256
size: .word 49

.text

main:
    addi    $s0,                $zero,                  256     # Setting $s0 to take our input
    addi    $t0,                $zero,                  0

    la      $a0,                msg1                            # Priting msg1
    li      $v0,                4
    syscall 

    la      $a0,                input                           # Where we store our sentence input
    lw      $a1,                size
    li      $v0,                8                               # Reading string input
    syscall 

    jal     setReg                                              # Jump to length

    la      $a0,                input                           # Storing input back in $a0
    move    $a1,                $v0
    add     $a0,                $a0,                    $a1     # Add size to the sentence
    la      $a2,                output

    jal     reverseSentence                                     # Jump to reversal method

    la      $a0,                output                          # Printing the reverse sentence
    li      $v0,                4
    syscall 

    li      $v0,                10                              # Exit program
    syscall 

setReg:
    move    $v0,                $zero                           # Setting $v0 to 0

stringLength:
    lb      $t0,                0($a0)                          # Sentence stored in $a0
    beqz    $t0,                stingLengthEnd                  # If end of string branch
    addi    $v0,                $v0,                    1       # Increment length of sentence counter
    addi    $a0,                $a0,                    1       # Increment sentence char
    j       stringLength

stingLengthEnd:
    sub     $v0,                $v0,                    1
    jr      $ra                                                 # Return length of the input string

reverseSentence:

    addi    $sp,                $sp,                    -4      # Stack operations
    sw      $ra,                0($sp)
    bltz    $a1,                reverseSentenceDone             # If sentence is at the end branch
    lb      $t0,                0($a0)
    sub     $a1,                $a1,                    1       # Going through sentence backwards
    sub     $a0,                $a0,                    1       # Going through sentence backwards
    sb      $t0,                0($a2)                          # Reverse sentence move to $t0
    addi    $a2,                $a2,                    1       # Incrementing backwords through reverse sentence
    jal     reverseSentence

reverseSentenceDone:
    lw      $ra,                0($sp)
    addi    $sp,                $sp,                    4
    jr      $ra                                                 # Return


