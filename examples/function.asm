# Illustration of function call and return

.data

Message1:	.asciiz "The sum of two numbers "
Message2:	.asciiz " and "
Message3:	.asciiz " is: "

.text
.globl main
main:

    addi    $s0,    $0,         10      # $s0 represents variable x
    addi    $s1,    $0,         20      # $s1 represents variable y

# Setting up argument registers for function call
    addi    $a0,    $0,         10      # passing x value into argument $a0
    addi    $a1,    $0,         20      # passing y value into argument $a1

    jal     ADD

# copy the result from $v0 to $t0
    add     $t0,    $v0,        $0

# Prompt message Message1
    addi    $v0,    $0,         4
    la      $a0,    Message1
    syscall 

# Display variable x
    addi    $v0,    $0,         1
    add     $a0,    $s0,        $0
    syscall 

# Prompt message Message2
    addi    $v0,    $0,         4
    la      $a0,    Message2
    syscall 

# Display variable y
    addi    $v0,    $0,         1
    add     $a0,    $s1,        $0
    syscall 

# Prompt message Message3
    addi    $v0,    $0,         4
    la      $a0,    Message3
    syscall 

# Display result of addition i.e. variable z
    addi    $v0,    $0,         1
    add     $a0,    $t0,        $0
    syscall 

EXIT:
                                        # Exit program
    addi    $v0,    $0,         10
    syscall 

ADD:
                                        # Add x and y
    add     $v0,    $a0,        $a1

    jr      $ra
