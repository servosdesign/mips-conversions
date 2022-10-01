# Program description: Program to display a pattern

.data
msg1:   .asciiz "Please enter the number of columns: "
newline: .asciiz "\n"

clear:    .float   0.0
n: .word 0                                                      # Storing lowerRange user entered character here

.text
.globl main

main:
    li      $v0,                4                               # Syscall for printinh string
    la      $a0,                msg1                            # Prompt message msg1
    syscall 

    li      $v0,                5                               # Taking user input
    syscall 
    move    $t7,                $v0                             # Storing n for first half
    move    $t5,                $v0                             # Storing n for second half

    li      $t0,                0                               # i = 0
    li      $t3,                1                               # k = 0
    li      $t1,                0                               # j = 0

# Printing the upper part of the pattern.

firstLoop:
    ble     $t7,                $t0,        startSecond         # i < n


firstInner:
    ble     $t0,                $t1,        secondInner         # j < i

    li      $a0,                32                              # Ascii for blank space
    li      $v0,                11                              # Syscall number for printing character
    syscall 

    addi    $t1,                $t1,        1                   # j = j + 1

    j       firstInner

secondInner:
    sub     $t2,                $t7,        $t0                 # n - i
    blt     $t2,                $t3,        newLine             # k <= n - i

    li      $v0,                1
    add     $a0,                $t3,        $zero               # Printing k
    syscall 

    addi    $t3,                $t3,        1                   # k = k + 1
    j       firstLoop

newLine:
    li      $v0,                4                               # Syscall for printing string
    la      $a0,                newline                         # Printing new line
    syscall 

    li      $t3,                1                               # k = 1
    li      $t1,                0
    addi    $t0,                $t0,        1                   # i = i + 1
    j       firstLoop

# Printing the lower part of the pattern.

startSecond:
    li      $t2,                0                               # Reseting $t2
    li      $t0,                1                               # i = 1
    li      $t3,                1                               # k = 1
    li      $t1,                1                               # j = 1
    li      $t4,                0                               # Where storing output variable

secondFirstLoop:
    ble     $t5,                $t0,        exit                # i < n

secondFirstInner:
    sub     $t2,                $t7,        $t0                 # n - i
    ble     $t2,                $t1,        secondSecondInner   # j < n - i

    li      $a0,                32                              # Ascii for blank space
    li      $v0,                11                              # Syscall number for printing character
    syscall 

    addi    $t1,                $t1,        1                   # j = j + 1
    j       secondFirstInner

secondSecondInner:
    addi    $t6,                $t0,        1                   # i = i + 1
    blt     $t6,                $t3,        secondNewLine       # k <= i + 1

    addi    $t4,                $t0,        2
    sub     $t4,                $t4,        $t3

    li      $v0,                1
    add     $a0,                $t4,        $zero               # Printing $t4
    syscall 

    addi    $t3,                $t3,        1                   # k = k + 1
    j       secondFirstLoop

secondNewLine:
    li      $v0,                4                               # Syscall for printing string
    la      $a0,                newline                         # Printing new line
    syscall 

    li      $t3,                1                               # k = 1
    li      $t1,                1
    addi    $t0,                $t0,        1                   # i = i + 1
    j       secondFirstLoop

exit:
    li      $v0,                10                              # Exit program
    syscall 
