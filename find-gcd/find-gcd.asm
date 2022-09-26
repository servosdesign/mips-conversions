# Program description: Find GCD of two whole numbers

.data
        msg1: .asciiz "Enter two whole numbers greater than 0: "
        msg2: .asciiz "G.C.D of "
        msg3: .asciiz " and "
        msg4: .asciiz " is "

        .globl main
        .text
main:

        la      $a0, msg1               # Prompt message msg1
        li      $v0, 4             
        syscall                

        li      $v0, 5                  # Take user integer n1 input
        syscall 
        add     $t0, $0, $v0            # Moving the n1 integer into $t0   

        li      $v0, 5                  # Take user integer n2 input
        syscall                
        add     $t1, $0, $v0            # Moving the n2 integer into $t1

        add     $t3, $t0, 0             # storing n1
        add     $t4, $t1, 0             # storing n2
loop: 
        div     $t0, $t1                # Dividing n1 / n2
        mfhi    $t2                     # Store the hi of remainder in $t2
        add     $t0, $0, $t1            # n1 = n2
        add     $t1, $0, $t2            # n2 = hi of remainder 
        bne     $t1, $0, loop           # if n2 is not equal to 0 branch back up to loop      

        addi    $v0, $0, 4              # Prompt message msg2
	la      $a0, msg2               
	syscall	    
                                       
        li      $v0, 1                  # Printing integer assigment
        move    $a0, $t3                # Printing n1
        syscall

        addi    $v0, $0, 4              # Prompt message msg3
	la      $a0, msg3               
	syscall	    
                                        
        li      $v0, 1                  # Printing iteger assigment
        move    $a0, $t4                # Printing n2
        syscall

        addi    $v0, $0, 4              # Prompt message msg4
	la      $a0, msg4               
	syscall	   
        
        add     $a0, $0, $t0            # Printing the gcd calculated
        li      $v0, 1
        syscall 

        li      $v0, 10                 # syscall to end the program
        syscall




