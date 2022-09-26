# Program description: Print ASCII characters between the given range

.data
        msg1:   .asciiz "Enter two whole numbers greater than 0: "  
        msg2:   .asciiz "G.C.D of "
        msg3:   .asciiz " and "
        msg4:   .asciiz " is "

        .text
        .globl main
main:  
        addi    $v0, $0, 4              # Prompt message msg1
	la      $a0, msg1               
	syscall	

        li      $v0, 5                  # Take user integer n1 input
        syscall
        move    $t0, $v0                # Moving the n1 integer into $t0

        li      $v0, 5                  # Read integer n2 input
        syscall
        move    $t1, $v0                # Moving the n2 integer into $t1

        li      $t3, 1                  # i = 1
loop:   
        ble     $t3, $t0, also          # i <= n1
also:
        ble     $t3, $t1, inner         # i <= n2
inner:                                  
        rem     $t4, $t0, $t3           # n1 % i (remainder of n1 / i)
        beq     $t4, 0, innerAlso       # if it equals == 0 go innerAlso
innerAlso:                                        
        rem     $t5, $t1, $t3           # n2 % i remainder of n2 / i)
        beq     $t5, 0, secondInner     # if it equals == 0 go secondInner
secondInner:
                                        # gcd = i
                                        # storing gcd in the stack

        addi    $t3, $t3, 1             # i = i + i
        
        bgt     $t3, $t0, final         # if i > n1 go to final tag
        jr loop
final:
        bgt     $t3, $t1, output        # if i > n2 go to output tag

output:                                   

        addi    $v0, $0, 4              # Prompt message msg2
	la      $a0, msg2               
	syscall	    
                                       
        li      $v0, 1                  # Printing iteger assigment
        move    $a0, $t0                # Printing n1
        syscall

        addi    $v0, $0, 4              # Prompt message msg3
	la      $a0, msg3               
	syscall	    
                                        
        li      $v0, 1                  # Printing iteger assigment
        move    $a0, $t1                # Printing n2
        syscall

        addi    $v0, $0, 4              # Prompt message msg4
	la      $a0, msg4               
	syscall	   
        
                                        # Printing iteger
                                        # bringing gcd out from stack
                                        # printing out gcd
                                        
exit: 

        li      $v0, 10                 # syscall to end the program
        syscall