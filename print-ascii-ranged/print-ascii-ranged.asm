# Program description: Print ASCII characters between the given range

.data
        msg1:   .asciiz "Please enter the first character: "    
        msg2:   .asciiz "Please enter the last character: "
        msg3:   .asciiz "The alphabets between "
        msg4:   .asciiz " and "
        msg5:   .asciiz " are: "
        newLine: .asciiz "\n"

        lowerRange: .asciiz " "         # Storing lowerRange user entered character here
        upperRange: .asciiz " "         # Storing upperRange user entered character here
        

        .text
        .globl main
main:    
        addi    $v0, $0, 4
	      la      $a0, msg1               # Prompt message msg1
	      syscall	
                                        # Take user lower range character input
        li      $v0, 12                 # read_character
        syscall

        la      $t0, lowerRange         # Store the lowerRange value in the user data segment
        sb      $v0, 0($t0)

        li      $v0, 4                  # Enter newLine
        la      $a0, newLine
        syscall

        addi    $v0, $0, 4
	      la      $a0, msg2               # Prompt message msg2
	      syscall	
                                        # Take user lowerRange character input
        li      $v0, 12                 # read_character
        syscall

        la      $t0, upperRange         # Store the upperRange value in the user data segment
        sb      $v0, 0($t0)

        li      $v0, 4                  # Enter newLine
        la      $a0, newLine
        syscall

        addi    $v0, $0, 4
	      la      $a0, msg3               # Prompt message msg3
	      syscall	

        li      $v0, 4                  # Display user entered lowerRange character
        la      $a0, lowerRange
        syscall

        addi    $v0, $0, 4
	      la      $a0, msg4               # Prompt message msg4
	      syscall

        li      $v0, 4                  # Display user entered upperRange character
        la      $a0, upperRange
        syscall

        addi    $v0, $0, 4
	      la      $a0, msg5               # Prompt message msg5
	      syscall
      
        lb      $t2, lowerRange         # c = lowerRange 
        addiu   $t2, $t2, 1             # c = lowerRange + 1
        
        lb      $t3, upperRange         # load upperRange into $t1                     

loop: 
        blt     $t2, $t3, inner         # c < upperRange

inner:
        li      $v0, 11                 # code for print char
        move    $a0, $t2                # printing c 
        syscall                         

        addi    $t2, $t2, 1             # c = c + 1
        beq     $t2, $t3, exit          # when c = upperRange go to exit
        j loop

exit: 

        li      $v0, 10                 # syscall to end the program
        syscall
		 