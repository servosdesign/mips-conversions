# Illustration of conditional statement using if-else statement

.data

Message1:	.asciiz "Please enter your age: "
Message2:	.asciiz "You are eligible to vote."
Message3:	.asciiz "You are NOT eligible to vote."

.text
.globl main
main:
                                        # Prompt message Message1
    addi    $v0,    $0,         4
    la      $a0,    Message1
    syscall 

# Accept user input age
    addi    $v0,    $0,         5
    syscall 
    add     $t0,    $v0,        $0      # move input from $v0 to $t0; variable age

# Load $t1 with 18 that will be compared against $t0
    addi    $t1,    $0,         18

# Compare if age < 18
    slt     $t2,    $t0,        $t1     # set $t2 = 1 if age < 18
    bne     $t2,    $0,         IF      # if $t2 != 0, then go to IF

# Prompt message Message2
    addi    $v0,    $0,         4
    la      $a0,    Message2
    syscall 

    j       EXIT                        # jump to EXIT

IF:
                                        # Prompt message Message3
    addi    $v0,    $0,         4
    la      $a0,    Message3
    syscall 

EXIT:
                                        # Exit program
    addi    $v0,    $0,         10
    syscall 