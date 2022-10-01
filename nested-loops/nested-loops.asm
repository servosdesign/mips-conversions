# Program description: Program to display a pattern

.data
msg1:   .asciiz "Please enter the number of columns: "
newline: .asciiz "\n"

clear:    .float   0.0
n: .word 0                                              # Storing lowerRange user entered character here

.text
.globl main

main:

    la      $a0,            msg1                        # Prompt message msg1
    syscall 

    li      $v0,            5                           # Taking user input
    syscall 
    move    $t7,            $v0                         # Storing n for first half

    li      $t0,            0                           # i = 0
    li      $t1,            0                           # j = 0
    li      $t3,            1                           # k = 1

# Printing the upper part of the pattern.

firstLoop:
    blt     $t7,            $t0,        exit      # i < n


    addi    $t0,            $t0,        1               # i = i + 1

    j       firstInner

firstInner:
    blt     $t0,            $t1,        firstLoop     # j < i

    li      $a0,            32                          # ascii for blank space
    li      $v0,            11                          # syscall number for printing character
    syscall 

    addi    $t1,            $t1,        1               # j = j + 1

    j       secondInner
secondInner:
    sub     $t2,            $t7,        $t0             # n - i
    ble     $t2,            $t3,        firstInner            # k <= n - i

    li      $v0,            1
    add     $a0,            $t3,        $zero           # Printing k

    j       firstLoop

    la      $a0,            newline                     # Printing new line
    syscall 

    addi    $t3,            $t3,        1               # k = k + 1

exit:
    li      $v0,            10
    syscall 
