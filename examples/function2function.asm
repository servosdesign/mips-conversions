# Illustration of function calling another function and so on..

.data

Message1:	.asciiz "Thank You! "
Message2:	.asciiz "The result is: "

newLine:	.asciiz "\n"

.text
.globl main
main:

# Setting up argument registers for function call
    addi    $a0,        $0,         10      # passing x value into argument $a0
    addi    $a1,        $0,         20      # passing y value into argument $a1

    jal     ADD

# copy the result from $v0 to $t0
    add     $t0,        $v0,        $0

# Enter a new line
    addi    $v0,        $0,         4
    la      $a0,        newLine
    syscall 

# Prompt message Message1
    addi    $v0,        $0,         4
    la      $a0,        Message1
    syscall 

# Exit program
    addi    $v0,        $0,         10
    syscall 


ADD:

# Add x and y
    add     $a0,        $a0,        $a1     # pass the result to function

# save the previous return address in stack
    add     $sp,        $sp,        4
    sw      $ra,        0($sp)

# Call to function DISPLAY
    jal     DISPLAY

# retore the previous return address and stack
    lw      $ra,        0($sp)
    add     $sp,        $sp,        -4

    jr      $ra


DISPLAY:

# Copy the $a0 value into $t0
    add     $t0,        $a0,        $0      # $a0 would be overridden otherwise

# Prompt message Message2
    addi    $v0,        $0,         4
    la      $a0,        Message2
    syscall 

# Display result of addition i.e. variable z
    addi    $v0,        $0,         1
    add     $a0,        $t0,        $0
    syscall 

    jr      $ra