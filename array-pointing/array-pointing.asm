# Program description: Access Array Elements Using Pointers

.data
        msg1: .asciiz "The array elements are: "
        newLine: .asciiz "\n"

        array: .word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100  # Array data
        length: .word 10                # Array size 

        .globl main
        .text
main:   
        addi    $v0, $0, 4
	      la      $a0, msg1               # Prompt message msg1
	      syscall	

        li      $v0, 4                  # Enter newLine
        la      $a0, newLine
        syscall
        
        lw      $t3, length
        la      $t1, array              # Get array address
        li      $t2, 0                  # Set loop counter

        la      $a0, array              # Load array into $a0

loop:
        beq     $t2, $t3, exit          # Check for array end

        sw      $s0, 0($sp)             # Store $s0 into the stack
        add     $s0, $a0, $0            # Storing array into the stack
        
        lw      $a0, ($t1)              # Print value at the array pointer
        li      $v0, 1                       
        syscall

        li      $v0, 4                  # Enter newLine
        la      $a0, newLine
        syscall

        addi    $t2, $t2, 1             # Increment counter
        addi    $t1, $t1, 4             # Increment array pointer
        j loop                          # Jump back through the loop ubtil $t2 == $t3


exit: 
        li      $v0, 10                 # syscall to end the program
        syscall
		 