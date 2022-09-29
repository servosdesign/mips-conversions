# Illustration of conditional statement using while loop

.data

Message1:	.asciiz "Please enter a positive integer: "
Message2:	.asciiz "The number is not valid."
Message3:	.asciiz "Please re-enter the positive integer again: "
Message4:	.asciiz "You entered number: "

newLine: 	.asciiz "\n"

.text
.globl main
main:
                                            # Prompt message Message1
    addi    $v0,    $0,         4
    la      $a0,    Message1
    syscall 

# Accept user input
    addi    $v0,    $0,         5
    syscall 
    add     $t0,    $v0,        $0          # move input from $v0 to $t0; variable number

WHILE:
                                            # Compare if number < 0
    slt     $t1,    $t0,        $0          # set $t1 = 1 if number < 0
    beq     $t1,    $0,         WHILE_END   # if $t1 != 0, then go to WHILE_END

# Prompt message Message2
    addi    $v0,    $0,         4
    la      $a0,    Message2
    syscall 

# Insert a new line
    addi    $v0,    $0,         4
    la      $a0,    newLine
    syscall 

# Prompt message Message3
    addi    $v0,    $0,         4
    la      $a0,    Message3
    syscall 

# Accept user input
    addi    $v0,    $0,         5
    syscall 
    add     $t0,    $v0,        $0          # move input from $v0 to $t0; variable number

    j       WHILE                           # jump to WHILE

WHILE_END:
                                            # Prompt message Message4
    addi    $v0,    $0,         4
    la      $a0,    Message4
    syscall 

# Display the entered number
    addi    $v0,    $0,         1
    add     $a0,    $0,         $t0
    syscall 


EXIT:
                                            # Exit program
    addi    $v0,    $0,         10
    syscall 