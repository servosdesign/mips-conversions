# Program description: Program to display all prime numbers between two positive numbers

.data
msg1: .asciiz "Please enter the first integer: "
msg2: .asciiz "Please enter the second integer: "
msg3: .asciiz "Prime numbers between are: "
space: .asciiz "   "

.globl main
.text
main:

    la      $a0,                msg1                        # Printing msg1
    li      $v0,                4
    syscall 

    li      $v0,                5                           # Getting n1 integer input
    syscall 
    move    $s0,                $v0                         # Moving n1 to $s0

    la      $a0,                msg2                        # Printing msg2
    li      $v0,                4
    syscall 

    li      $v0,                5                           # Getting n2 integer input
    syscall 
    move    $s1,                $v0                         # Moving n2 to $s1

    la      $a0,                msg3                        # Printing msg3
    li      $v0,                4
    syscall 


if:
    bge     $s0,                $s1,    exit                # If n1 > n2 jump to exit
    move    $a0,                $s0                         # Storing n1 in $a0
    jal     checkPrimeNumber                                # Jumping to the checkPrimeNumber function

    addi    $s0,                $s0,    1                   # n1 = n1 + 1
    j       if                                              # Start loop again

checkPrimeNumber:
    li      $t0,                1                           # Initializing flag to 1
    li      $t1,                2                           # Initializing j to 2

    div     $t2,                $a0,    2                   # n1 / 2

primeInnerLoop:
    bgt     $t1,                $t2,    displayCondition    # j > (n1 / 2)

    div     $a0,                $t1                         # n / j
    mfhi    $t4                                             # Getting high remainder of that division
    beq     $t4,                0,      return              # If remainder is = 0 jump to return

    addi    $t1,                $t1,    1                   # j = j + 1

    j       primeInnerLoop                                  # Loop again

displayCondition:
    beq     $t0,                1,      display             # if flag = 1

display:

    li      $v0,                1                           # Print prime integer
    syscall 

    la      $a0,                space                       # Print a space between prime integers
    li      $v0,                4
    syscall 

    addi    $a1,                $a1,    1                   # i = i + 1

    jr      $ra                                             # Return

return:
    li      $t0,                0                           # flag = 0
    jr      $ra                                             # Return to main

exit:

    li      $v0,                10                          # Exit program
    syscall 

