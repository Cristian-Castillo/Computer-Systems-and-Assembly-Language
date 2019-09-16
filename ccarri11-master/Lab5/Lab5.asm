
##########################################################################
# Created by:  Carrillo Castillo, Cristian
#              CruzID: ccarri11
#              March 13, 2019
#
# Assignment:  Lab 05: Subrountines
#              CMPE 012, Computer Systems and Assembly Language
#              UC Santa Cruz, Winter 2019
#
# Description: This program will allow the user to encrypt or decrypt strings 
#	       using a Caesar Cipher.In order to generate the Caesar Cipher 
#	       shift value, the user will also enter a key.The program will 
#	       calculate the checksum of the key, and use that checksum to shifteach 
#  	       letter in the string that should encrypted/decrypted. Then, the encrypted 
#	       and decrypted strings are displayed to the user.
#
# Notes:       This program is intended to be run from the MARS IDE. In addition include* Lab5.asm 
#	       to ensure that when invoked... subroutines function correctly.
#
#########################################################################
#Subroutines
#
#--------------------------------------------------------------------
# give_prompt
#
# This function should print the string in $a0 to the user, store the user’s input in
# an array, and return the address of that array in $v0. Use the prompt number in $a1
# to determine which array to store the user’s input in. ​Include error checking​ for
# the first prompt to see if user input E, D, or X if not print error message and ask# again.
## arguments:  $a0 - address of string prompt to be printed to user
# $a1 - prompt number (0, 1, or 2)
#
# note:
# prompt 0: Do you want to (E)ncrypt, (D)ecrypt, or e(X)it?
# prompt 1: What is the key?
# prompt 2: What is the string?
# Register Comments: $t0-$t2 are used as temp variables; Usage is either counter or place holder 
# for these registers.
# Registers Comments: $s0-$s2 are used sequentially for args $a0,$a1,$a2 to store data for long term
# return:     $v0 - address of the corresponding user input data
.text 
  
   give_prompt: nop				 # Subroutine give_prompt
   		
   		beq $a1 0 argument_one		 # if arg1 contains a1 = 0 go to prompt 0, branch arg 1
   		beq $a1 1 argument_two		 # if arg2 contains a2 = 1 go to prompt 1, branch arg 2
   		beq $a1 2 argument_three	 # if arg3 contains a3 = 2 go to propmt 2, branch arg 3
   		
   					
  argument_one: nop				 # Label
  
		li $v0 4 		 	 # service call #4
		syscall			 	 # print the string from prompt 0
		
		li $v0 12
		syscall
	  
	 retry: nop				 # error message point of return if invalid key input from user
		
						 # Conditionals
		beq $v0 69 go_storeByte		 # check ASCII Value if not equal to E, branch to error_checking
		beq $v0 68 go_storeByte	 	 # check ASCII Value if not equal to D, branch to error_checking
		beq $v0 88 exit 		 # check ASCII Value if equal to X, branch to checkpoint to exit
		bne $v0 68 error_checking	 # if Not equal to 69, invalid entry 
		bne $v0 69 error_checking	 # if Not equal to 68, invalid entry
	          
		check_point:			 # Label return back from j check_point
		jr $ra 			 	 # pc+4, essentially returning us to pc+4 at jal give_prompt
		
  go_storeByte:	nop				 # Lable storeByte responds to branch statement
  		
  		li $t0 0
  		li $t1 8
  		
  loop_userChoice:nop
  		
  	        li $t0 0			 
  	       	la $s0 user_choice($t0)		 # load address at $s0
  	       	sb $v0, ($s0)		 	 # store $v0 into $s0
  	   
  	        li $v0 11			 # print character service call
  	        la $a0 '\n'			 # character to print
  	        syscall				 # execute print character
  	        
  	        move $v0, $s0		 	 # stored the address of $s0 back into $v0 and return value
  	        j check_point    		 # jump back to check point
  	        
  	        li $t0 0			 # used to keep track of memory address location while storing bytes
  argument_two:	nop				 # Label branch if aergument_two
  					
  		li $v0 4			 # service call to print string
  		syscall 			 # execute service call, outputs to console
  		
  		la $a0 input_key($t0)		 # load address of input_key
  		li $a1 100			 # load immediately with n+1, n = 100. Due to how it stores in memory
  		
  		li $v0 8			 # service call to read string
  		syscall				 # execute and read the string
  		
  		li $t0 0			 # counter
  		li $t1 100			 # size to compare the counter while iterating
  		
  		loop_inputKey:nop		 # branch loop
  		
  		la $s1, input_key		 # load address into register $t2 from word array input_key
  		sb $v0, 4($s1)			 # offset we will store read input string into the offset 4 from $t2 in memory
  	
  		addi $t0 $t0 1			 # counter increment i++
  		blt $t0 $t1 loop_inputKey	 # conditional loop counter, iterator i++
  		
  		move $v0 $s1
  		jr $ra				 # pc+4, essentially returning us to pc+4 at jal give_prompt
  		
  		li $t0 0			 # used to keep track of memory address location while storing bytes
argument_three: nop
		
 		li $v0 4			 # service call # 4
 		syscall				 # print the string fromp prompt 2
 		
 		la $a0 input_string($t0)	 # load address of input string with characters 100 from array in data
 		li $a1, 100			 # load immediately with n+1, n = 100. Due to how it stores in memory
 		
 		li $v0 8			 # read string service request call
 		syscall				 # execute serivce request call to read a string
 		
 		li $t0 0			 # counter 
 		li $t1 100			 # Size for counter t0 < t1; 0 < 100 iterate
 		
 		loop_inputString: nop		 # label 
 		
 		la $s2, input_string		 # load the address of string array into $t2
 		sb $v0, ($s2)			 # store the byte in the loaded address
 		
 		addi $t0 $t0 1			 # i++
 		blt $t0 $t1 loop_inputString	 # continue if counter < 100, branching loop
  		
  		move $v0 $s2			 # copy the contents of $t2 into $v0 for return
  		jr $ra				 # pc+4, essentially returning us to pc+4 at jal give_prompt
  		  
  error_checking: nop				 # lable 
		
		li $v0 4			 # service call to print string
		la $a0 error_checking_msg	 # load address of error_checking_msg to display invalid entry
		syscall				 # print string
		j retry				 # return to retry (checkpoint) in argument_one
		
# cipher
#
# Calls compute_checksum and encrypt or decrypt depending on if the user input E or
# D. The numerical key from compute_checksum is passed into either encrypt or decrypt
#
# note: this should call compute_checksum and then either encrypt or decrypt
#
# arguments:  $a0 - address of E or D character
#             $a1 - address of key string
#             $a2 - address of user input string
#
# return:     $v0 - address of resulting encrypted/decrypted string
#--------------------------------------------------------------------
# compute_checksum​, ​encrypt​, and ​decrypt​ will be called from inside of cipher​

cipher: nop

li $v0 10 #end program
syscall

jr $ra
	
		
######################################################################################################################################################################################################################################################################################################################################################################################################################	#####################################################################################################	
.data
input_string: .space 100  			 # Allocated memory array as instructed Max 100 for encryption/decryption
result_string: .space 100 			 # Allocated memory array as instructed Max 100 for the result output
input_key: .space 100    			 # Allocated memory array for the key which will calculate checksum of the key to shift letters
user_choice: .byte 	 			 # Allocated a byte of memory for users choice of E,D,or X
			 			 # user_choice will keep track of the input being E,D, or X when prompted

################################################################################################################################################################################################################################################

error_checking_msg: .asciiz  "\nError, invalid entry! \nTry again: "  	# String output when invoked for error
new_line: .asciiz "\n"							# String output character for newline
	
