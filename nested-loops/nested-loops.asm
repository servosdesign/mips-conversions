# Program description: Program to display a pattern

.data
msg1:   .asciiz "Please enter the number of columns: "
space: .asciiz " "
newline: .asciiz "\n"

n: .word 0                                  # Storing lowerRange user entered character here

.text
.globl main
main:
    addi    $v0,    $0,         4
    la      $a0,    msg1                    # Prompt message msg1
    syscall 

    li      $v0,    5
    syscall 
    move    $t0,    $v0

    add     $s1,    $zero,      $t0         # loop n times
    addi    $t0,    $zero,      1           # i = 1

outerloop:
    addi    $t1,    $zero,      1           # j = 1

innerloop:
                                            # printing the counter
    add     $a0,    $zero,      $t1         # $a0 = j
    li      $v0,    1
    syscall 

# printing the space
    la      $a0,    space
    li      $v0,    4
    syscall 

# increment j
    addi    $t1,    $t1,        1
                                            # if j <= i, goto innerloop
    ble     $t1,    $t0,        innerloop

# printing the newline
    la      $a0,    newline
    li      $v0,    4
    syscall 

# increment i
    addi    $t0,    $t0,        1
                                            # if i <= 4, goto outerloop
    ble     $t0,    $s1,        outerloop
exit:
    li      $v0,    10
    syscall 