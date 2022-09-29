# Program description: Program to display a pattern

.data
        msg1:   .asciiz "Please enter the number of columns: "
        space:  .asciiz " "
        newLine: .asciiz "\n"

        n: .word 0                   # Storing lowerRange user entered character here
        spacer: .asciiz " "          # Spacer for printing

        .text
        .globl main
main:    
        addi    $v0, $0, 4
	la      $a0, msg1               # Prompt message msg1
	syscall	

        li $v0, 5
        syscall
        move $t0, $v0

         

exit:
        addi    $v0, $0, 4              # Print newLine
	      la      $a0, newLine               
	      syscall	  

        li $v0, 10                      # Exit program
        syscall