# Program description: Program to display a pattern

.data
msg1:   .asciiz "Please enter the number of columns: "
space: .asciiz " "
newline: .asciiz "\n"

clear:    .float   0.0
n: .word 0                                          # Storing lowerRange user entered character here

.text
.globl main

main:
    addi    $v0,    $0,         4
    la      $a0,    msg1                            # Prompt message msg1
    syscall 

    li      $v0,    5                               # Taking user input
    syscall 
    move    $t0,    $v0                             # Storing it for first half
    move    $t6,    $t0                             # Storing it for second half

    add     $s1,    $zero,      $t0                 # Loop n times
    addi    $t0,    $zero,      1                   # i = 1

outerloop:
    addi    $t1,    $zero,      1                   # j = 1

innerloop:

    add     $a0,    $zero,      $t1                 # $a0 = j
    li      $v0,    1
    syscall 

    la      $a0,    space                           # Space
    li      $v0,    4
    syscall 

    addi    $t1,    $t1,        1                   # Increment j

    ble     $t1,    $t0,        innerloop           # If j <= i, jump to innerloop

    la      $a0,    newline                         # Newline
    li      $v0,    4
    syscall 

    addi    $t0,    $t0,        1                   # increment i
                                                    # if i <= 4, goto outerloop
    ble     $t0,    $s1,        outerloop

    li      $t3,    0
    li      $t4,    0

SecondOuterLoop:
    addi    $t6,    $zero,      1                   # i = 1

    add     $s1,    $zero,      $t6                 # Loop n times

    addi    $t1,    $zero,      1                   # j = 1

SecondInnerLoop:
    add     $a0,    $zero,      $t1                 # $a0 = j
    li      $v0,    1
    syscall 

    la      $a0,    space                           # Space
    li      $v0,    4
    syscall 

    addi    $t1,    $t1,        1                   # Increment j

    ble     $t1,    $t0,        SecondInnerLoop     # If j <= i, jump to innerloop

    la      $a0,    newline                         # Newline
    li      $v0,    4
    syscall 

    addi    $t6,    $t6,        1                   # increment i
                                                    # if i <= 4, goto outerloop
    ble     $t6,    $s1,        SecondOuterLoop

exit:
    li      $v0,    10
    syscall 