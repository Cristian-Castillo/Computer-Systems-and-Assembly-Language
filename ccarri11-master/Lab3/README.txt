------------------------
Lab 3: MIPS Looping ASCII Art
CMPE 012 Winter 2019
Carrillo Castillo, Cristian
CruzID: ccarri11
-------------------------
The text of your prompts are stored in the processor’s memory. After
assembling your program, what is the range of addresses in which these strings are stored?
So I placed my strings below .data and I noticed that the Text Segment when assembled does not represent the strings. However, in the Data Segment tab the address that adjust and change are the following:


Data Segment (after assembled code)
Range (I suppose)
		value+ 0	Value +4    and so on
0x10010000     0x65746e45      0x68742072
0x10010020     0x6e616972      0x20656c67
0x10010040     0x7420666f      0x73656c67

So I believe my range is the column all the way to the left as this is what changes when assembled.


What were the learning objectives of this lab?
Per our Lab Objective PDF:
This lab will introduce you to the MIPS IS using MARS. You will write a program that draws triangles based on values specified by the user.
So far yeah I agree with this statement, but I also feel that I am understanding how everything is stored at a lower level, and how fortunate we are for high level languages.

Did you encounter any issues? Were there parts of this lab you found enjoyable?
I encountered issues in loops, and what I mean by that is that for almost two complete
days I had my triangle printed out already, but I couldn't get it to loop properly back to the beginning. Thus I eventually got so frustrated that I scratched the initial code and worked from end to beginning checking each line of code to ensure the logic was right. Any parts that were enjoyable? No not really, but the joy of completion made me melt in my chair.


How would you redesign this lab to make it better?
The notes given for the lab were more than enough to begin with. No adjustments
needed.

Did you collaborate with anyone on this lab? 
Please list who you collaborated with and the nature of your collaboration.
No one, but me! Let me tell you that this lab took me three consecutive since Tuesday morning until Thursday night.... Geez, I pulled my hair out, but nevertheless it was yet again satisfying to solve this one on my own.
