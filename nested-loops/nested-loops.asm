# Program description: Program to display a pattern

.data
msg1:   .asciiz "Please enter the number of columns: "
space: .asciiz " "
newline: .asciiz "\n"

clear:    .float   0.0
n: .word 0                                              # Storing lowerRange user entered character here

.text
.globl main

main:
    addi    $v0,            $0,         4
    la      $a0,            msg1                        # Prompt message msg1
    syscall 

    li      $v0,            5                           # Taking user input
    syscall 
    move    $t7,            $v0                         # Storing n for first half
    move    $t6,            $v0                         # Storing n for second half

    add     $s1,            $zero,      $t7             # Loop n times

    addi    $t0,            $zero,      0               # i = 0
    addi    $t1,            $zero,      0               # j = 0
    addi    $t3,            $zero,      1               # k = 1

# Printing the upper part of the pattern.

firstLoop:
    blt     $t0,            $t7,        firstInner      # i < n
    j       firstLoop

firstInner:
    blt     $t1,            $t0,        secondInner     # j < i

    la      $a0,            space                       # Printing blank space
    syscall 

    j       firstInner
secondInner:
    sub     $t2,            $t7,        $t0             # n - i
    ble     $t3,            $t2,        exit            # k <= n - i

    li      $v0,            1
    add     $a0,            $t3,        $zero           # Printing k

    j       secondInner

    la      $a0,            newline                     # Printing new line
    syscall 

    addi    $t1,            $t1,        1               # j = j + 1
    addi    $t0,            $t0,        1               # i = i + 1
    addi    $t3,            $t3,        1               # k = k + 1

exit:
    li      $v0,            10
    syscall 
