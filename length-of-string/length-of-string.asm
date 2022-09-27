# Program description: Find the length of a String and the array starting address

.data
        msg1: .asciiz "Please enter a string: "
        msg2: .asciiz "Length of input string: "
        msg3: .asciiz "The array starts at the memory location: "
        newLine: .asciiz "\n"

        array: .asciiz " "

        .globl main
        .text
main:  
        addi    $v0, $0, 4
	      la      $a0, msg1               # Prompt message msg1
	      syscall	

        li      $v0, 4                  # Enter newLine
        la      $a0, newLine
        syscall

        li      $v0, 8                  # User string input
        la      $a0, array
        syscall

        la      $s0, array              # Storing string in stack
        add     $s1, $zero, $zero       # initialize ct, $s1 = 0.

loop: 
        add     $t0, $s0, $s1           # Address of byte to examine next
        lb      $t1, 0($t0)             # Load that byte to get *(s + ct)
        beq     $t1, $zero, exit        # Branch if *(s + ct) == ’\0’
        addi    $s1, $s1, 1             # Increment ct
        j loop

exit: 
        li      $v0, 4                  # Enter newLine
        la      $a0, newLine
        syscall

        addi    $v0, $0, 4
	      la      $a0, msg2               # Prompt message msg2
	      syscall	

        li      $v0, 1                  # Printing iteger assigment
        move    $a0, $s1                # Printing the length of the input string
        syscall
        
        li      $v0, 4                  # Enter newLine
        la      $a0, newLine
        syscall

        addi    $v0, $0, 4
	      la      $a0, msg3               # Prompt message msg3 
	      syscall	

        addi    $v0, $0, 1              # Display the array memory location in integer form
        la      $a0, array
        syscall
  

        li      $v0, 10                 # syscall to end the program
        syscall
		 