# Program description: Program to calculate LCM of two positive numbers

.data
msg1:	.asciiz "Enter the first positive integers:  "
msg2:	.asciiz "Enter the second positive integers: "
msg3:	.asciiz "The LCM of two numbers is: "

.globl main
.text
main:

    la      $a0,            msg1                # Printing msg1
    li      $v0,            4
    syscall 

    li      $v0,            5                   # Getting n1 integer input
    syscall 
    addi    $s0,            $v0,    0           # Storing n1 in $so

    la      $a0,            msg2                # Printing msg2
    li      $v0,            4
    syscall 
    li      $v0,            5                   # Getting n2 integer input
    syscall 
    addi    $s1,            $v0,    0           # Storing n2 in $s1

    jal     while

    la      $a0,            msg3                # Printing msg3
    li      $v0,            4
    syscall 

    addi    $a0,            $s0,    0           # gcd = n1
    addi    $a1,            $s1,    0           # n2Modified = n2

    jal     lcm
    addi    $a0,            $v0,    0           # Storing lcm in $a0 so we can print

    li      $v0,            1                   # Printing lcm
    syscall 

    li      $v0,            10                  # Exit program
    syscall 

while:
    addi    $t2,            $ra,    0           # Saving the value of gcd from it's loops

whileGcd:
    beq     $a1,            $zero,  exit        # When n2Modified = 0 jump to exit
    addi    $t0,            $a1,    0           # Saving n2Modified in $t0

secondInner:
    bgt     $a0,            $zero,  thirdInner  # When gcd > 0 jump to thirdInner
    add     $a0,            $a0,    $t0         # Adding gcd with n1
    j       secondInner

thirdInner:
    blt     $a0,            $t0,    done        # n1 > n2Modified jump to done.
    sub     $a0,            $a0,    $t0         # gcd -= n2Modified
    j       thirdInner

done:
    addi    $a1,            $a0,    0           # n2Modified = gcd
    addi    $a0,            $t0,    0           # gcd = n2Modified
    jal     whileGcd                            # jump back to whileGcd

exit:
    addi    $ra,            $t2,    0           # Return address
    addi    $v0,            $a0,    0           # gcd moved into $v0
    jr      $ra                                 # Return

lcm:
    addi    $s4,            $ra,    0           # Saving the value of lcm from it's function
    addi    $t1,            $a0,    0           # saving n1 in $t1
    addi    $t2,            $a1,    0           # saving n2 in $t2

    mul     $s7,            $t1,    $t2         # n1 * n2

    jal     while                               # Getting gcd value to use in division

    div     $v0,            $s7,    $v0         # (n1 * n2) / gcd
    mflo    $v0                                 # Return answer

    addi    $ra,            $s4,    0           # Recover address.
    jr      $ra