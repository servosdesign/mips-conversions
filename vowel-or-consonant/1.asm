# Program description: Check whether a character is a vowel or a consonant
#
        .data                           #setting up all string data used in program
msg1:   .asciiz "Enter an alphabet: "    
msg2:   .asciiz " is a vowel."
msg3:   .asciiz " is a consonant."
newLine: .asciiz "\n"

        .text
        .globl main
main:            
                                        # Prompt message msg1
	addi    $v0, $0, 4
	la      $a0, msg1
	syscall	
                                        # Take user alphabet input
        li      $v0, 12                 # read_character
        syscall
        
        addi    $sp, $sp, -4            # Save entered data into the stack 
        sw      $v0, 0($sp)             # Store the entered value (stored in $v0) to the stack pointed by $sp

        li $v0, 10                      # end of label
        syscall

isLowerCase:                            
                                        # Load $t1 with 97 that will be compared against 0($sp)
                                        # Load $t1 with 101 that will be compared against 0($sp)
                                        # Load $t1 with 105 that will be compared against 0($sp)
                                        # Load $t1 with 111  that will be compared against 0($sp)
                                        # Load $t1 with 117 that will be compared against 0($sp)

        li $v0, 10                      # end of label
        syscall

isUpperCase:
      

        li $v0, 4                       # Enter newLine
        la $a0, newLine
        syscall

        li $v0, 4                       # Display user entered alphabet
        la $a0, 0($sp)
        syscall

        li $v0, 4                       # Display is a vowel prompt
        la $a0, msg2
        syscall

        li $v0, 4                       # Enter newLine
        la $a0, newLine
        syscall

        li $v0, 4                       # Display user entered alphabet
        la $a0, 0($sp)
        syscall
                                       
        li $v0, 4                       # Display is a consonant prompt               
        la $a0, msg3
        syscall




        
        



        
        