# Program description: Check whether a character is a vowel or a consonant

.data                                   #setting up all string data used in program
        msg1:   .asciiz "Enter an alphabet: "    
        msg2:   .asciiz " is a vowel."
        msg3:   .asciiz " is a consonant."
        newLine: .asciiz "\n"

        .text
        .globl main
main:                           
	addi    $v0, $0, 4
	la      $a0, msg1               # Prompt message msg1
	syscall	
                                        # Take user alphabet input
        li      $v0, 12                 # read_character
        syscall
        
        addi    $sp, $sp, -4            # Save entered data into the stack 
        sw      $v0, 0($sp)             # Store the entered value (stored in $v0) to the stack pointed by $sp
                 
        addi $t1, $0, 97                # Load $t1 with 97 that will be compared against 0($sp)
        beq $t1, $v0, isVowel           # Compare if it's = 97, then go to isVowel
        addi $t1, $0, 101               # Load $t1 with 101 that will be compared against 0($sp)
        beq $t1, $v0, isVowel           # Compare if it's = 101, then go to isVowel
        addi $t1, $0, 105               # Load $t1 with 105 that will be compared against 0($sp)
        beq $t1, $v0, isVowel           # Compare if it's = 105, then go to isVowel
        addi $t1, $0, 111               # Load $t1 with 111  that will be compared against 0($sp)
        beq $t1, $v0, isVowel           # Compare if it's = 111, then go to isVowel
        addi $t1, $0, 117               # Load $t1 with 117 that will be compared against 0($sp)
        beq $t1, $v0, isVowel           # Compare if it's = 117, then go to isVowel
       
        addi $t1, $0, 65                # Load $t1 with 65 that will be compared against 0($sp)
        beq $t1, $v0, isVowel           # Compare if it's = 65, then go to isVowel
        addi $t1, $0, 69                # Load $t1 with 69 that will be compared against 0($sp)
        beq $t1, $v0, isVowel           # Compare if it's = 69, then go to isVowel
        addi $t1, $0, 73                # Load $t1 with 73 that will be compared against 0($sp)
        beq $t1, $v0, isVowel           # Compare if it's = 73, then go to isVowel
        addi $t1, $0, 79                # Load $t1 with 79  that will be compared against 0($sp)
        beq $t1, $v0, isVowel           # Compare if it's = 79, then go to isVowel
        addi $t1, $0, 85                # Load $t1 with 85 that will be compared against 0($sp)
        beq $t1, $v0, isVowel           # Compare if it's = 85, then go to isVowel

        bne $t1, $v0, isConsonant       # if all of these aren't true then it's a consonant

isVowel: 
        li $v0, 4                       # Enter newLine
        la $a0, newLine
        syscall

        li $v0, 4                       # Display user entered alphabet
        la $a0, 0($sp)
        syscall

        li $v0, 4                       # Display is a vowel prompt
        la $a0, msg2
        syscall
        
        addi $v0, $0, 10                # Exit program
	syscall
        j exit

isConsonant:
        li $v0, 4                       # Enter newLine
        la $a0, newLine
        syscall

        li $v0, 4                       # Display user entered alphabet
        la $a0, 0($sp)
        syscall
                                       
        li $v0, 4                       # Display is a consonant prompt               
        la $a0, msg3
        syscall

        addi $v0, $0, 10                # Exit program
	syscall
        j exit

exit:
        li      $v0,10                  # syscall to end the program
        syscall
		               




        
        



        
        