# Program description: Access Array Elements Using array index

.data
msg1: .asciiz "The array elements are: "
newLine: .asciiz "\n"

array: .word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100# Array data
length: .word 10                            # Array size 10

.globl main
.text
main:
    addi    $v0,        $0,         4
    la      $a0,        msg1                # Prompt message msg1
    syscall 

    li      $v0,        4                   # Enter newLine
    la      $a0,        newLine
    syscall 

    addi    $sp,        $sp,        -4      # Lower Stack Pointer
    sw      $ra,        0($sp)              # Store return address into memory
    la      $a0,        array               # Load array into $a0
    lw      $a1,        length              # Load length into $a1
    jal     printArray                      # Jump to first conditions to store array and begin index

    lw      $ra,        0($sp)              # Restore return address
    jr      $ra                             # Return

printArray:
    addi    $sp,        $sp,        -4      # Decrease stack pointer
    sw      $s0,        0($sp)              # Store $s0 into the stack
    add     $s0,        $a0,        $0      # Storing array into the stack
    li      $t0,        0                   # Set current index to 0
    j       loop                            # Jump to the loop for printing array

loop:
    sll     $t1,        $t0,        2       # Shift array by 2 to get word length
    add     $t1,        $t1,        $s0     # Offset the array by $t1
    lw      $a0,        0($t1)              # Element at index
    li      $v0,        1                   # Printing integer code 1
    syscall 

    li      $v0,        4                   # Enter newLine
    la      $a0,        newLine
    syscall 

    addi    $t0,        $t0,        1       # Increment the index
    bne     $a1,        $t0,        loop    # Current index != length of array, go back through loop
    lw      $s0,        0($sp)              # Restore $s0
    addi    $sp,        $sp,        4       # Raise the stack pointer
    j       exit                            # Jump to exit program once index equals length of array

exit:
    li      $v0,        10                  # syscall to end the program
    syscall 
