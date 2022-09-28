# Program description: Program to display a pattern

.data
        msg1:   .asciiz "Please enter the number of columns: "
        space:  .asciiz " "
        newLine: .asciiz "\n"

        n: .word 10                   # Storing lowerRange user entered character here

        .text
        .globl main
main:    
        addi    $v0, $0, 4
	      la      $a0, msg1               # Prompt message msg1
	      syscall	

        lw $s0, n                       # $s0 = n
  
        li      $s3, 0                  # i = 0
        li      $s4, 0                  # j = 0
        li      $s5, 1                  # k = 1
  

loop1:
        

         

exit:
        addi    $v0, $0, 4              # Print newLine
	      la      $a0, newLine               
	      syscall	  

        li $v0, 10                      # Exit program
        syscall