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
# CaesarCipherMain
#
# This file calls soubroutines found in Lab5.asm to execute the Caesar Cipher program
#
# Subroutines Called: 
# give_prompt
# cipher (note cipher calls other subroutines (i.e. nested subroutines))
# print_strings
#
#
# Register Usage:
# a0, a1, a2 are used as varying inputs to the subroutines and syscalls
# v0 is used as return values from the subroutines and for syscalls
# s0 contains address of E,D or X
# t0 contains character of E,D or X
# s1 contains address of key string
# s2 contains address of user input string for Enc/Dec
# s3 contians address of resulting string after cipher applied

.text

#Calls subroutines for getting user input, computing the cipher key, running the caesar cipher, and printing result
main:
	la 	$a0, WelcomeMessage 
	li 	$v0, 4
	syscall
	
#Run cipher subroutines
loop: 
#call first subroutine to print prompts & collecting user input
	#load string to be typed
	la	$a0, prompt0 
	li	$a1, 0 
	jal	give_prompt	
	move 	$s0, $v0	# $s0 contains address of E,D or X
	
	lb	$t0, ($s0)	# check for exit condition (user input 'X')
	beq  	$t0, 88, exit

	la	$a0, prompt1
	li	$a1, 1
	jal	give_prompt
	move 	$s1, $v0	# $s1 contains address of key string
	
	la	$a0, prompt2
	li	$a1, 2
	jal	give_prompt	
	move 	$s2, $v0	# $s2 contains address of user input string for Enc/Dec
	

#call second subroutine to encrypt or decrypt w/ inputs:
#a0 contains address of E or D
#a1 contains address of key string
#a2 contains address of user input string
	move	$a0, $s0	
	move	$a1, $s1
	move	$a2, $s2
	jal	cipher
	move	$s3, $v0	# $s3 contians address of resulting string after cipher applied
	
	li $v0 10
	syscall  # working here
	
#call subroutine to print arrays
#a0 user input string address
#a1 resulting string after cipher address
#a2 Choice of E or D
	move	$a0, $s2	
	move	$a1, $s3	
	move	$a2, $s0	
	#jal	print_strings
	b 	loop
	
#Display Exit Message
exit:	nop
	li	$v0, 4
	la	$a0, GoodbyeMessage
	syscall

	li	$v0, 10
	syscall

.data

WelcomeMessage:	.asciiz		"Welcome to the Caesar Cipher program!\n"
GoodbyeMessage:	.asciiz		"\nGoodbye!"

prompt0:	.asciiz		"\nDo you want to (E)ncrypt, (D)ecrypt, or e(X)it? "
prompt1:	.asciiz		"What is the key? "
prompt2:	.asciiz		"What is the string? "

.include "Lab5.asm"	  # .include will use call subroutines (functions to interact with Lab5Main)
