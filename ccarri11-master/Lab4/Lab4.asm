##########################################################################
# Created by:  Carrillo Castillo, Cristian
#              CruzID: ccarri11
#              20 February 2019
#
# Assignment:  Lab 4: ASCII Conversion
#              CMPE 012, Computer Systems and Assembly Language
#              UC Santa Cruz, Winter 2019
#
# Description: How data is represented, stored, and manipulated at the 
#              processor level. Converting ASCII into base 4
#
# Notes:       This program is intended to be run from the MARS IDE.
#              In addition this program calculates hexadecimal and binary 
#              entries and converts them to base 4 using Two's Complement
#
#########################################################################
#-----------------PSEUDO PRE PROGRAM FLOW--------------------------------
#// This is my pseudo code that mocks the flow
#// of the program. I did it in c++ as 
#// my previous lab3 was done in c++ and then converted.
#//this process helped me alot, and thus I resorted
#// to using c++ for this psuedo and test implementation
#//binary possible outcome
#void readFunctionBinary(int& a1,char& a2)
#{
#	// if n = 10 bits then continue for length
#	//dummy binary numbers going in
#	//checking for length 0x8bits here
#	a1 = a2 = 10;
#	if(a1 == 10 && a2 == 10)
#	{
#	//check for range here
#	// here we would be in the form of 
#	// range1Binary = [ob10000000] 
#	if((a1 >= -128 && a1 <= 127) && (a2 >= -128 && a2 <= 127))
#	{
#	//check for prefix 0b
#	//static array
#	// because we want it to be fixed
#	// num will be the binary number entered
#	// num input will be entered as array to help identify 
#	// decimal/binary/hex/ whatever value it maybe depending on 
#	// ascii encoding
#	// sieze willbe 10 bits, but the first 2 are prefixed. Just taking
#	// into consideration the entire size
#	const int size = 10;
#	// user will input their number into an array.. this will be changed 
#	//in main program where from the beginning the user will
#	//input the number into the arr
#	char num[size] = {0,'b',3,4,5,6,7,8,9,10};
#
#	for(int j = 0; j < 1;j++)
#	{
#	//we would use in this case num[0] == 011 0000 which is 0
#	//for num[1] == 110 0010 which is b
#	//here, once agian we will use the binary code instead of 0
#	// and 98  which I listed above. This will be in terms of 2SC per lab
#	if(num[0] == 0 && num[1] == 98)
#	{
#	cout <<"You entered the numbers:";
#	cout << endl;
#	cout << "0";
#	cout << num[1];
#	cout <<"00110101" << " ";
#
#	cout << "0";
#	cout << num[1];
#	cout <<"11110100";
#
#	cout <<"\n\nThe sum in base 4 is: " << endl;
#	cout << 221 << endl << endl << "--program is finished running --" << endl;
#	//
#	}
#	else
#	{
#	exit(0);
#	}
#	}
#
#	}
#	}
#	//else, there is invalid number of n bits
#	else
#	{
#	exit(0);
#	}
#
#}
#
#// possible outcome
#void readFunctionHex(int a1,int a2)
#{
#	//if 2 bits & 2 bits read 
#	// this enter this if statement to execute code
#	{
#	// Here range1 = 0x80 -128 conversion
#	// range1 = 0x7F--127 conversion 
#	// a1 = hex1Arg
#	// a2. = h 
#	if((a1 >= -128 && a1 <= 127) && (a2 >= -128 && a2 <= 127))
#	{
#	//static array
#	// because we want it to be fixed
#	// num will be the binary number entered
#	// num input will be entered as array to help identify 
#	// decimal/binary/hex/ whatever value it maybe depending on 
#	// ascii encoding
#	const int size = 4;
#	// user will input their number into an array
#	int num[size] = {0,'x',3,4};
#
#	for(int j = 0; j < 1;j++)
#	{
#	//num[0] = hex value of zero
#	// num[1]= the x value in hex
#	if(num[0] == 0 && num[1] == 120)
#	{
#	cout <<"\nIs a hex number" << endl;
#	}
#	else
#	{
#	exit(0);
#	}
#	}
#	}
#
#	}
#	else
#	{
#	exit(0);
#	}
#
#}
#
#//Hex and Binary possible outcome
#void readFunctionHexBin(int a1,int a2)
#{
#	// this is hex & binary or binary and hex
#	// covering both scenarios were 2 represents
#	// hex n bits, and 8 represent n bits as required 
#	// for binary lab
#	//checking for length of hex being 2 digits
#	// and a2 being 10 bits
#	if((a1 == 4 && a2 == 10) || (a2 == 10 && a1 == 4))
#	{
#	// if either possible combination
#	// of the prm arg falls into slot 1 arg or slot2 arg... 
#
#	//a1 = hex
#	//a2 = binary
#	if(a1 && a2)
#	{
#	// once we determine which slot the argument came through from
#	// as a possible outcome we can check for its range
#	// the range is checked for both possible outcomes
#	// same concept applies to binary
#	if((a1 >= -128 && a1 <= 127) && (a2 >= -128 &&  a2 <= 127))
#	{
#
#	const int sizeBinary = 10;
#	const int sizeHex = 4;
#	// user will input their number into an array.. this will be changed 
#	//in main program where from the beginning the user will
#	//input the number into the arr
#	int numBin[sizeBinary] = {0,'b',3,4,5,6,7,8};
#	int numHex[sizeHex] = {0, 'x',1,2};
#
#	for(int j = 0; j < 1;j++)
#	{
#	//we would use in this case num[0] == 011 0000 which is 0
#	//for num[1] == 110 0010 which is b
#	if((numBin[0] == 0 && numBin[1] == 98) && (numHex[0] == 0 && numHex[1] == 120))
#	{
#	cout <<"\nIs a binary number & Hex" << endl;
#	}
#	else
#	{
#	exit(0);
#	}
#	}
#
#	}
#	}
#	}
#}
#
#void convertSignExt(int &a1,char &a2)
#{
#	//a.) Conversion first program argm
#	// to 32-bit two's complement number stored in s1
#	//b.) convert the second program arg to 32- bit twos complement 
#	// number stored in s2
#	//logic goes here
#	int arg1_32SignExt_$s1 = a1;
#	char arg2_32SignExt_$s2 = a2;

#}

#void sum2SC(int num,char numTwo)
#{
#	if(num == 0 && numTwo == 'b')
#	{
#	int s1,s2,s0;
#	//here we would do the sum in 2SC of the 
#	//two binary numbers
#	s1 = num; //$s1 = first register holding 8 bit
#	s2 = numTwo; // $s2 = second reigster holding 8 bit
#	s0 = num+numTwo; // the sum of s1 + s2 is stored in s0 in 2SC
#	//cout << s0 << endl;
#	//convert the sum into base 4 with no leading 0'z
#	}
#}
#
#int main()
#{
#	int hexArg1;
#	int hexArg2;
#	int binary1;
#	char binary2;
#	int range1 = -128, range2 = 127;
#
#	int select;
#
#	cout <<"\n\n\n\n\nPlease input 1 for hex, 2 for binary, 3 for hex & bin: ";
#	cin >> select;
#
#	if(select == 2)
#	{
#
#	binary1 = 0; // ascii 0 will be used here 
#	binary2 = 98; //ascii will be used to determine prefix b
#	cout <<"This is extra and not apart of the program. This will help" << endl
#	<<"with program flow and creating...";
#	cout << endl << endl;
#	cout <<"--------------------------------------------------" << endl << endl << endl;
#	sum2SC(binary1,binary2);
#	readFunctionBinary(binary1,binary2);
#	convertSignExt(binary1,binary2);
#
#	///readFunctionBinary(binary1,binary2);
#
#	}
#	//readFunctionBinary(binary1,binary2);
#	//readFunctionHexBin(hexArg1,binary1);
#
#	return(0);
#}
#
#/* PSEUDO OUTPUT
#
#Criss-MacBook-Pro:desktop cris$ g++ -o pseudo pseudo.cpp
#Criss-MacBook-Pro:desktop cris$ ./pseudo
#
#
#
#
#
#Please input 1 for hex, 2 for binary, 3 for hex & bin: 2
#This is extra and not apart of the program. This will help
#with program flow and creating...
#
#--------------------------------------------------
#
#
#You entered the numbers:
#0b00110101 0b11110100
#
#The sum in base 4 is: 
#221
#
#--program is finished running --
#Criss-MacBook-Pro:desktop cris$ 
#
#*/

###### REGISTER INFORMATION #####
## s0 holds the total sum
## s1 holds Argument 1
#  s2 holds Argument 2
#  Please input instructions by selecting MIPS Programming Arguments
.text

      main:
           lw $s1,0($a1)            	# accesing memory address 0($a1+n)offset and loading word (4byte)into $s1
           lw $s2,4($a1)             	# accessing memory addres 4($a1+n)offset and loading word from memory into reg. 
           lb $t1,1($s1)            	# identifies prefix 1st arg $s1
           lb $t7, 1($s1)	   	# s1 is t7
     	   lb $t8, 1($s2)     	 	# s1 is t8
            
           beq $t7,120,isHex
  	   beq $t1,98,isBinary  
  	
  isBinary:                 		####### Value is positive

          lb $t7, 2($s1)
          lb $t6, 3($s1)                # Load the bits for a byte
          lb $t5, 4($s1)
          lb $t4, 5($s1)
          lb $t3, 6($s1)
          lb $t2, 7($s1)
          lb $t1, 8($s1)
          lb $t0, 9($s1)
          
          add $t7 $t7 -48
          add $t6 $t6 -48
          add $t5 $t5 -48
          add $t4 $t4 -48
          add $t3 $t3 -48		# ASCII CONVERSION
          add $t2 $t2 -48
          add $t1 $t1 -48
          add $t0 $t0 -48
          
          beq $t7 1 binaryIsNegative	# if leading bit is 1 then 2SC takes place
          NOP
          
          li $t8,128   # multiply by powers of 2, for positive bits
          mult $t8,$t7
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,64
          mult $t8,$t6
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,32
          mult $t8,$t5
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,16
          mult $t8,$t4
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,8
          mult $t8,$t3
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,4
          mult $t8,$t2
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,2
          mult $t8,$t1
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,1
          mult $t8,$t0
          mflo $t8
          add $t9,$t9,$t8
          
          li $s1,0
          move $s1 $t9 		# some accumulator stored here and copied into reg s1, $t9=0 is accumulator
          j go2Binary_Two
   	  ### JUMP HERE ### 
          
          binaryIsNegative:    #first programming agument is negative
          
          li $t0,0
          li $t1,0
          li $t2,0
          li $t3,0
          li $t4,0
          li $t5,0
          li $t6,0
          li $t7,0
          li $t8,0
          li $t9,0
           
          lb $t7, 2($s1)
          lb $t6, 3($s1)
          lb $t5, 4($s1)
          lb $t4, 5($s1)
          lb $t3, 6($s1)
          lb $t2, 7($s1)	# load the bits
          lb $t1, 8($s1)
          lb $t0, 9($s1)    
          
          add $t7 $t7 -48
          add $t6 $t6 -48
          add $t5 $t5 -48	# COnvert to ascii
          add $t4 $t4 -48
          add $t3 $t3 -48
          add $t2 $t2 -48
          add $t1 $t1 -48
          add $t0 $t0 -48
         
     	  beq $t7 1 invertA 	# invert bits
     	  beq $t7 0 invertB
     	  NOP
     	  return:
     	  
     	  beq $t6 1 invertA2
     	  beq $t6 0 invertB2
     	  NOP
     	  return2:
     	  
     	  beq $t5 1 invertA3
     	  beq $t5 0 invertB3
     	  NOP
     	  return3:
     	  
     	  beq $t4 1 invertA4
     	  beq $t4 0 invertB4
     	  NOP
     	  return4:
     	  
     	  beq $t3 1 invertA5
     	  beq $t3 0 invertB5
     	  NOP
     	  return5:
     	  
     	  beq $t2 1 invertA6
     	  beq $t2 0 invertB6
     	  NOP
     	  return6:
     	  
     	  beq $t1 1 invertA7
     	  beq $t1 0 invertB7
     	  NOP
     	  return7:
     	  
     	  beq $t0 1 invertA8
     	  beq $t0 0 invertB8
     	  NOP
     	  return8:
     	  
     	  li $t8,0
          li $t8,128
          mult $t8,$t7
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,64
          mult $t8,$t6
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,32
          mult $t8,$t5
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,16
          mult $t8,$t4
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,8
          mult $t8,$t3
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,4
          mult $t8,$t2
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,2
          mult $t8,$t1
          mflo $t8
          add $t9,$t9,$t8

          li $t8,1
          mult $t8,$t0
          mflo $t8
          add $t9,$t9,$t8    # add one to the inverted bit to obtain 2SC
          
	  add $t9 $t9,1	     # Accumulator = Accumulator + 1
	  
	  li $s1,0	     # multiply product by -1 
	  li $t8,-1
	  mult $t9,$t8
	  mflo $t9
	  move $s1,$t9
          j go2Binary_Two
          

     	  invertA:
     	 	 add $t7 $t7 -1
     	  	 j return
     	  
     	  invertB:
     	  	 add $t7 $t7 1
     	  	 j return
     	  
     	  invertA2:
     	  	  add $t6 $t6 -1
     	  	  j return2
     	  
     	  invertB2:
     	  	   add $t6 $t6 1
     	  	   j return2 
     	  
     	  invertA3:
     	 	   add $t5,$t5 -1
     	  	   j return3
     	  
     	  invertB3:
     	  	   add $t5 $t5 1
     	  	   j return3
     	  
     	  invertA4:
     	  	   add $t4,$t4 -1
     	  	   j return4
     	  
     	  invertB4:
     	  	   add $t4 $t4 1
     	  	   j return4
     	  
     	  invertA5:
     	  	   add $t3,$t3 -1
     	  	   j return5
     	  
     	  invertB5:
     	  	    add $t3 $t3 1
     	  	    j return5
     	  
     	  invertA6:
     	  	   add $t2,$t2 -1
     	  	   j return6
     	  
     	  invertB6:
     	  	   add $t2 $t2 1
     	  	   j return6
     	  
     	  invertA7:
     	  	   add $t1,$t1 -1
     	  	  j return7
     	  
     	  invertB7:
     	  	  add $t1 $t1 1
     	  	  j return7
    	
    	  invertA8:
     	  	  add $t0,$t0 -1
     	  	  j return8
     	  
     	  invertB8:
     	 	  add $t0 $t0 1
     	  	  j return8
     	  
 
      # End of negative 1st  Bits inverted argument       
      # End of First Argument    
      
  go2Binary_Two:
      		li $t2,0
      		lb $t2,1($s2)            # identifies prefix 2nd arg #s2
      		beq $t2,98,Binary_Two
    Binary_Two:
  
          	li $t0,0
          	li $t1,0
          	li $t2,0
         	li $t3,0
          	li $t4,0
          	li $t5,0
          	li $t6,0
          	li $t7,0
          	li $t8,0
          	li $t9,0
           
          	lb $t7, 2($s2)
          	lb $t6, 3($s2)
          	lb $t5, 4($s2)
          	lb $t4, 5($s2) #load bits
          	lb $t3, 6($s2)
          	lb $t2, 7($s2)
          	lb $t1, 8($s2)
          	lb $t0, 9($s2)
          
       
        
          	add $t7 $t7 -48
          	add $t6 $t6 -48 # Ascii conversion
         	add $t5 $t5 -48
          	add $t4 $t4 -48
         	add $t3 $t3 -48
          	add $t2 $t2 -48
          	add $t1 $t1 -48
          	add $t0 $t0 -48
            
          	beq $t7 1 BinTwoIsNeg
          	NOP
          
         
          	li $t8,128
         	mult $t8,$t7
          	mflo $t8
          	add $t9,$t9,$t8
          
          	li $t8,0
          	mult $t8,$t6
          	mflo $t8
          	add $t9,$t9,$t8
          
          	li $t8,0
          	li $t8,32
          	mult $t8,$t5
          	mflo $t8
          	add $t9,$t9,$t8
          
          	li $t8,0
          	li $t8,16
          	mult $t8,$t4
         	mflo $t8
          	add $t9,$t9,$t8
          
          	li $t8,0
         	li $t8,8
          	mult $t8,$t3
          	mflo $t8
          	add $t9,$t9,$t8
          
          	li $t8,0
          	li $t8,4
          	mult $t8,$t2
          	mflo $t8
          	add $t9,$t9,$t8
          
          	li $t8,0
          	li $t8,2
          	mult $t8,$t1
          	mflo $t8
          	add $t9,$t9,$t8
          
          	li $t8,0
          	li $t8,1
          	mult $t8,$t0
          	mflo $t8
          	add $t9,$t9,$t8
          	li $s2,0
          	move $s2 $t9 #some accumulator stored here
         
          	j lastExit
        
    
         ##### end of postive arg2  binary is Negative is if 2nd arg is -1 ###
BinTwoIsNeg:
      
          li $t0,0
          li $t1,0
          li $t2,0
          li $t3,0
          li $t4,0
          li $t5,0
          li $t6,0
          li $t7,0
          li $t8,0
          li $t9,0
           
          lb $t7, 2($s2)
          lb $t6, 3($s2)
          lb $t5, 4($s2)
          lb $t4, 5($s2) # Load bits
          lb $t3, 6($s2)
          lb $t2, 7($s2)
          lb $t1, 8($s2)
          lb $t0, 9($s2)    
          
          add $t7 $t7 -48
          add $t6 $t6 -48
          add $t5 $t5 -48
          add $t4 $t4 -48
          add $t3 $t3 -48
          add $t2 $t2 -48
          add $t1 $t1 -48
          add $t0 $t0 -48
          
 
     	  beq $t7 1 invertAX
     	  beq $t7 0 invertBX
     	  NOP
     	  returnX:
     	  
     	  beq $t6 1 invertA2X
     	  beq $t6 0 invertB2X
     	  NOP
     	  return2X:
     	  
     	  beq $t5 1 invertA3X
     	  beq $t5 0 invertB3X
     	  NOP
     	  return3X:
     	  
     	  beq $t4 1 invertA4X
     	  beq $t4 0 invertB4X
     	  NOP
     	  return4X:
     	  
     	  beq $t3 1 invertA5X
     	  beq $t3 0 invertB5X
     	  NOP
     	  return5X:
     	  
     	  beq $t2 1 invertA6X
     	  beq $t2 0 invertB6X
     	  NOP
     	  return6X:
     	  
     	  beq $t1 1 invertA7X
     	  beq $t1 0 invertB7X
     	  NOP
     	  return7X:
     	  
     	  beq $t0 1 invertA8X
     	  beq $t0 0 invertB8X
	  NOP
     	  return8X:

     	  j doneInvertingX

     	  invertAX:
     	  		add $t7 $t7 -1
     	  		j returnX
     	  
     	  invertBX:
     	 		 add $t7 $t7 1
     	  		j returnX
     	  
     	  invertA2X:
     	  		add $t6 $t6 -1
     	  		j return2X
     	  
     	  invertB2X:
     	  		add $t6 $t6 1
     	  		j return2X
     	  
     	  invertA3X:
     	 		add $t5,$t5 -1
     	  		j return3X
     	  
     	  invertB3X:
     	  		add $t5 $t5 1
     	  		j return3X
     	  
     	  invertA4X:
     	  		add $t4,$t4 -1
     	  		j return4X
     	  
     	  invertB4X:
     	  		add $t4 $t4 1
     	  		j return4X
     	  
     	  invertA5X:
     	  		add $t3,$t3 -1
     	  		j return5X
     	  
     	  invertB5X:
     	  		add $t3 $t3 1
     	  		j return5X
     	  
     	  invertA6X:
     	  		add $t2,$t2 -1
     	  		j return6X
     	  
     	  invertB6X:
     	  		add $t2 $t2 1
     	  		j return6X
     	  
     	  invertA7X:
     	  		add $t1,$t1 -1
     	  		j return7X
     	  
     	  invertB7X:
     	  		add $t1 $t1 1
     	  		j return7X
    	
    	  invertA8X:
     	  		add $t0,$t0 -1
     	  		j return8X
     	  
     	  invertB8X:
     	  		add $t0 $t0 1
     	  		j return8X
  
     	  ###jump here ###
          doneInvertingX:
       
          li $t8,0
          li $t8,128
          mult $t8,$t7
          mflo $t8
          add $t9,$t9,$t8
          
          
          li $t8,0
          li $t8,64
          mult $t8,$t6
          mflo $t8
          add $t9,$t9,$t8
           
          
          li $t8,0
          li $t8,32
          mult $t8,$t5
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,16
          mult $t8,$t4
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,8
          mult $t8,$t3
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,4
          mult $t8,$t2
          mflo $t8
          add $t9,$t9,$t8
  
          li $t8,0
          li $t8,2
          mult $t8,$t1
          mflo $t8
          add $t9,$t9,$t8
          
          li $t8,0
          li $t8,1
          mult $t8,$t0
          mflo $t8
          add $t9,$t9,$t8
          
          add $t9 $t9 1 #add one to the xor bits

          li $t8 -1
          mult $t8,$t9
          mflo $t8 # Store product outcome here
          
          li $s2,0
          move $s2 $t8 #copy contents here
          j lastExit
          
  
      # END OF SECOND argument 


###############################################################################################################
       
         lastExit:
         	 bgt $s1 127 outRangeEx # Checking Rnage
        	 bgt $s2 127 outRangeEx
        	 blt $s1 -128 outRangeEx
        	 blt $s2 -128 outRangeEx
        	 NOP
         	 add $s0 $s1 $s2
         	
         	j moveOn
 
        outRangeEx:
         	li $v0 4
        	la $a0 errorMsg
        	syscall
        	li $v0 10                 # exit out of program
        	syscall

#################################################################################################################
 moveOn:
	li $v0,4                  # service request 4 to print string
       	la $a0,msgOut             # Prints msg of what was entered from
        syscall
        
        lw $a0,0($a1)             # let N = num, lw $a0, N($a1) --> load word @ Ram Address: ($a1+n) into... 
        syscall                   #...reg $a0, N gives offset from address in $a1, ~Based and Indexed Addressing~
 
        la $a0,space              # load address --> space
        syscall
       
        lw $a0,4($a1)             # once again offset by n = 4 here, program argument2 from user input
        syscall                   # from $a1 address we will load data from a1 to register $a0
        la $a0,space
        syscall
        
        li $v0,4
        la $a0,newLine
        syscall
        
        li $v0 4
        la $a0 newLine
        syscall
        
        li $v0 4
        la $a0 msgOutTwo
        syscall
       
        li $t4,4 #represent base 4
        li $t3,0
        
        loop: #base 4 conversion, formula applied decimal to base 
 		addi $sp,$sp,-4 # allocate 4 bytes in the stack
		div $s0 $s0 $t4
		mfhi $s4 #stores the remainder in high register from $s1/$t4
		add $t3 $t3 1
 		sb $s4,($sp) #store whatever is in s4 regi into stack pointer offset beginning location
 		beq $s0 $zero continue
 		NOP
 		b loop
 	
 	continue:
 	 	mini:
 	   		lw $s5,($sp)
 	   		addi $sp $sp 4
 	   		
 	   		la $a0 ($s5)
 	   		li $v0 11
 	   		syscall
			
			#la $a0 ($s4)
 	  		#li $v0 11
 	  		#syscall
 	
			# If you use li $v0 1 
			# with address here number will show up for sum
			
 	   
 	   		sle $t8 $s4 $zero 
 	   		NOP

 
 	   		add $t3 $t3 -1
 			beq $t3 $zero extMini
 	  		b mini
 	    	
 	    	extMini:
 	   		li $v0 10
 	   		syscall
 	   			  			
############################################## SUB PROGRAM FUNCTIONS ######################################################
     
  checkPointTwo:
        	lw $s2,4($a1)             # accessing memory addres 4($a1+n)offset and loading word from memory into reg.
        	li $t2,0		  # Identify second prefix
        	lb $t2,1($s2)
    		beq $t2,120,isHex_Two 
    		NOP
        finish:
         	ble $s1 0x7F upperLimit   # if s1 <= 127 go to upper limit to determine lower bound
 		NOP
   upperLimit:
  		bge $s1 $zero upCheckOut  # In regards to arg 1 if s1 >= 0 lower bound determine go to upLimTwo
                                          #### Computation Station #####
      upCheckOut:                         # completed two positive ints--> next step convert to base 4 from here
       			
       			add $s0 $s1 $s2
       			bne $s0 $zero OUT 
 			ble $s2 0x7F upLim
 			bgt $s2 0x7F loLim
  			ble $s2 -128 outRange

             upLim:
                   	bge $s2 $zero lastExit
                   	bgt $s2 0xFF outRange       # check for range
                  	ble $s2 -128 outRange       # check for range
                  	NOP
             loLim:
                   	li $t0 0xFF
                 	ble $s2 $t0 loRange
                   	bgt $s2 0xFF outRange       # check for range
                   	ble $s2 -128 outRange       # check for range
                   	NOP
           loRange:
                   	li $t0 0xFFFFFF00
                   	xor $s2 $s2 $t0
                   	j upCheckOut
         
     	lowerLimit:
       			li $t0 0xFF                   # s1 <= 255 which in 2SC is -1 then we found our lower limit negative bound decimal
 			ble $s1 $t0 lowRangeDetected
 			bgt $s1 0xFF outRange
 			ble $s1 -128 outRange
 			NOP
  lowRangeDetected:                           	      # eg.
 			li $t0 0xFFFFFF00             # 1111 1111 1111 1111 1111 1111 0000 0000
 			xor $s1,$s1,$t0               # 0000 0000 0000 0000 0000 0000 1000 0000 xor
               	    			      	      # 1111 1111 1111 1111 1111 1111 1000 0000 Nice!
                 	j upCheckOut
                  
################################################## End Of Program ########################################################
 outRange: ################ out of range must be in 2SC range 255 = -1 ... [-128,127] ###########################
 	li $v0 4
        la $a0 errorMsg
        syscall
        li $v0 10                 # exit out of program
        syscall
 #################################################################################################################
 
   OUT:
	li $v0,4                  # service request 4 to print string
       	la $a0,msgOut             # Prints msg of what was entered from
        syscall
        
        lw $a0,0($a1)             # let N = num, lw $a0, N($a1) --> load word @ Ram Address: ($a1+n) into... 
        syscall                   #...reg $a0, N gives offset from address in $a1, ~Based and Indexed Addressing~
 
        la $a0,space              # load address --> space
        syscall
       
        lw $a0,4($a1)             # once again offset by n = 4 here, program argument2 from user input
        syscall                   # from $a1 address we will load data from a1 to register $a0
        la $a0,space
        syscall
        
        li $v0,4
        la $a0,newLine
        syscall
        
        li $v0 4
        la $a0 newLine
        syscall
        
        li $v0 4
        la $a0 msgOutTwo
        syscall
       
        li $t4,4 #represent base 4
        li $t3,0
        
  
 	loopHex: 
 		addi $sp,$sp,-4 # allocate 4 bytes in the stack
		div $s0 $s0 $t4
		mfhi $s4 #stores the remainder in high register from $s1/$t4
		add $t3 $t3 1
 		sb $s4,($sp) #store whatever is in s4 regi into stack pointer offset beginning location
 		beq $s0 $zero continueHex
 		b loopHex
 		
 	continueHex:
 	   	miniHex:
 	   		lb $s4,($sp) # load whats in the stack
 	   		addi $sp $sp 4
 	   		sle $t8 $s4 $zero
 			NOP
 	  		li $s0,0
 	  		move $s0,$s4
 	  		
 	  		la $a0 ($s0)
 	  		li $v0 11
 	
 	  		li $v0 1
 	  		la $a0($s0)
 	  		syscall
 
 	   		add $t3 $t3 -1
 			beq $t3 $zero extMiniHex
 	  		b miniHex
 	    extMiniHex:
 	   		li $v0 10
 	   		syscall # Exit program
 	   			

                         	 # Condition if 0x Letter, Number --> decimal
      				 # 	lb $t3, 2($s1)              # find location of string 0xn 
      				 # 	lb $t4, 3($s1)              # find location of string 0xn,n+1

   		isHex:
   			lw $s1,0($a1) # accesing memory address 0($a1+n)offset and loading word (4byte)into $s1
        		li $t3,0
        		li $t4,0
        		lb $t3,2($s1) # load the byte from this offset 2()
        		lb $t4,3($s1)
     
       			
       			bge $t3,48,isNum            # if $t3 is greater than 48 possibly num
			NOP
		isNum:
       			bge $t3,65,isLetter         # if t3 is greater then or equal to 65 its a letter condition first place holder met for letter
       			ble $t3,57,numOneConfirmed    # else a num has been confirmed for the first spot
   			NOP
	 returnLetter:                           	 # Checking for second slot to see if letter or number
     	 		bge $t4,65,isLetterTwo
       			ble $t4,57,numTwoConfirmed
       			NOP
   	
   	 returnNumber:                            # CHecking for second slot to see if letter or number
       			bge $t4,65,isLetterTwo
       			ble $t4,57,numTwoConfirmed
       			NOP
 	numOneConfirmed:                           		 # num one confirmed
			li $t6,16                   # load immediate 16 into register t6
                	sub $t5,$t3,48              # subtract and store t5= #-48
                	mult $t5 $t6                # multipy this number by 16*1
                	mflo $t5                    # Store low bits
                	move $s1,$t5
                	j returnNumber              # return back to returnNumber: to check more conditions
      numTwoConfirmed:
                	sub $t7,$t4,48
                	add $t8,$t5,$t7
               		move $s1,$t8                # s1 = t8 basically copying contents and this is in 2SC
         		j checkPointTwo
             isLetter:
        		li $t6 16                   # load immediate 16
       			sub $t5,$t3,55              # to get value and find A-F
       			mult $t5 $t6 
      	 		mflo $t5
      	 		move $s1,$t5
      	 		j returnLetter 
 	   isLetterTwo:
			sub $t7,$t4,55
			add $t8 $t5 $t7
			move $s1,$t8
			j checkPointTwo
		
        
   	     isHex_Two:                           # Condition if 0x Letter, Number --> decimal
        		lb $t3, 2($s2)              # find location of string 0xn 
        		lb $t4, 3($s2)              # find location of string 0xn,n+1
 			bge $t3,48,isNum_Two        # if $t3 is greater than 48 possibly num
 			NOP
  	     isNum_Two:
         		bge $t3,65,isLetter_Two        # if t3 is greater then or equal to 65 its a letter condition first place holder met for letter
         		ble $t3,57,numOneConfirmed_Two # else a num has been confirmed for the first spot
         		NOP
      returnLetter_Two:                               # Checking for second slot to see if letter or number
         		bge $t4,65,isLetterTwo_Two
         		ble $t4,57,numTwoConfirmed_Two
         		NOP
       returnNumber_Two:                               # Checking for second slot to see if letter or number
        		bge $t4,65,isLetterTwo_Two
        		NOP
         		ble $t4,57,numTwoConfirmed_Two
         		NOP
   numOneConfirmed_Two:                             # num one confirmed
                   	li $t6,16                     # load immediate 16 into register t6
                   	sub $t5,$t3,48                # subtract and store t5= #-48
  			mult $t5 $t6                  # multipy this number by 16*1
 			mflo $t5                      # Store low bits
  			move $s2,$t5
  			j returnNumber_Two            # return back to returnNumber: to check more conditions
  numTwoConfirmed_Two:
   			sub $t7,$t4,48
   			add $t8,$t5,$t7
   			move $s2,$t8                 # s1 = t8 basically copying contents and this is in 2SC
  			j finish		     #
         isLetter_Two:
                   	li $t6 16                     # load immediate 16
                   	sub $t5,$t3,55                # to get value and find A-F
          		mult $t5 $t6 
          		mflo $t5
          		move $s2,$t5
         		j returnLetter_Two
   isLetterTwo_Two:
  			sub $t7,$t4,55
  			add $t8 $t5 $t7
  			move $s2,$t8
  			j finish 
  		                 
.data
msgOut: .asciiz "You entered the numbers:\n"
msgOutTwo: .asciiz "The sum in base 4 is: \n"
newLine: .asciiz "\n"
space: .asciiz " "
bin: .asciiz "is Binary"
hex: .asciiz "is Hex"
errorMsg: .asciiz "Out of Range"

 