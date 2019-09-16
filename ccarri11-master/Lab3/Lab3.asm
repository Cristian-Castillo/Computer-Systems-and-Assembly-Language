##########################################################################
# Created by:  Carrillo Castillo, Cristian
#              CruzID: ccarri11
#              7 February 2019
#
# Assignment:  Lab 3: MIPS Looping ASCII Art
#              CMPE 012, Computer Systems and Assembly Language
#              UC Santa Cruz, Winter 2019
#
# Description: This program prompts the user for the amount of legs that the size of a triangle should be
#	       Once the size is acquired, the user will then be prompted for how many duplicates to print
#
# Notes:       This program is intended to be run from the MARS IDE.
#
#########################################################################
.text
main:
	li $v0,4 #service call request
	la $a0,response 
	syscall #service request call
	
	li $v0, 5  #prompt user for input 1
	syscall
   	move $a0, $v0        #copy userinput into $a0 regi
   	move $t3, $a0 #copied contents from $a0 to $t3 .. user input is now in $t3
   
   	li $v0, 4    #service call to output question number to
   	la $a0,responseTwo
   	syscall
   
   	li $v0, 5 #prompt user to input second integer..This will print triangle x inputs.. Basically a duplicate 
   	syscall
   	move $t5,$v0 #store user input into register t5
        
   	li $v0,4 #new line space then printing commence
   	la $a0,newLine
   	syscall
   	
   masterLoop: # the master loop which controls how many triangles will be printed based off of $t5 register
        
        beqz $t5,End#is $t5 (userinput equal to zero?) ..If it is then go all the way down to End and you will exit out program 
        
   fowardLoop: #if no we began by entering our first loop 
   	
   	li $t0,1 #temp values to hold position as we increment
     	li $t1,1
      
   loop: # enter loop
   	
   	li $v0, 11 #Service call 11 enabled us to use special character like space forward slash,back slash, and space
    	la $a0, 0x20 #space character 
    	syscall
    	
    	beq $t0, $t1, exitLoop          #if counter 0 is equal to counter 1, exitLoop to new line
    	addi $t0, $t0, 1            #otherwise i++
    	j loop                  #loop back up

   exitLoop:   
   	
   	li $v0,11 #when code blopck is entered here it will print out the 
   	la $a0,'\\' #new foward slash and of course service 11 needed to invoke character
    	syscall
        
    	li $v0, 4    #print newline
   	la $a0, newLine
   	syscall

    	beq $t1, $t3, move       #if the temp value is equal to user input then break out of loop and go down to move
    	li $t0, 1               #set t0 back to 0
    	addi $t1, $t1, 1            # add 1 to $t1, basically increment up    
    	j loop #loop conditional go back to loop
        
  	b fowardLoop #go all the way back up to forward loop
           
   move: #you have breaken out of loop now it will print /
   
   printFoward:
 	
 	li $t7,0 #temp value stored in t7
 	move $t7,$t3 #copied user input into reg $t7
   
   return: #if $t7 is equal to 0 revert to exitMe
   	
   	beqz $t7,exitMe
   	li $t6,0
   	
   getSpace:
   
    	addi $t6,$t6,1 #increment by 1 to reg $t6
   	
   	li $v0,11 #service call to print out space character
	la $a0,0x20 #load space character
	syscall

    	beq $t6,$t7,prtFow #if the space is equal to the user input which was copied then revert to prtFow: else continue 
    	#continue here and loop back from getSpace
    	b getSpace #loop conditional go back to getSpace
    
    prtFow:

    	 li $v0,11 #special service call by using 11 to utilize character
   	 la $a0,'/'
   	 syscall
	 
	 beq $t5,1,isThisTheEnd #I used alot of pseudo!! Basically saying if $t5 equal to 1 and...!!! jump to isThis the End
   	 li $v0,4
   	 la $a0,newLine
    	 syscall
          
    notYet:
    
   	 sub $t7,$t7,1 #decrement  and then from j return go back up to return.. there you will be rechecked with condition
    	 j return   
    	 
     isThisTheEnd: # if $t5 = 1 && t7 =1 then jump straight to the end, else ignore newline and return back to prtFow 
    
     	  beq $t7,1,End #second condition to be checked if both are equal 1 then immediately exit
     
    	  li $v0,4 #else new line and return
     	  la $a0,newLine
     	  syscall
    	  j notYet
    	
    exitMe:
         
    	 sub $t5,$t5,1 #decrement 1 from $t5 every time.. 
    	 b masterLoop #repeat entire process and revert back to the masterLoop
   
    End: #exit out of program
   
    	li $v0,10 #service call exit 10 end of program
    	syscall
    
.data #misecellanous used function recalls from main body
response: .asciiz "Enter the length of one of the triangle legs: "
responseTwo: .asciiz "Enter the number of triangles to print: "
newLine: .asciiz "\n"
space: .asciiz " "
star: .asciiz "*" #helped to determine the size while buildilng.. Training wheels if one must

