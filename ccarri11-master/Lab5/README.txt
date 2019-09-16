------------------------
Lab 5: Subroutines
CMPE 012 Winter 2019
Carrillo Castillo Jr, Cristian
CruzID: ccarri11
-------------------------
What was your design approach?
Write the answer here.

What did you learn in this lab?
I learned how to store strings, the functionality of a subroutine, 
and how $ra works with the pc+4 counter.. Basically its like a function that 
returns back to the body. How to create arrays and store those bytes into arrays. Invoke program arguments
Such as $a0,$a1,and $a2 to use through my program by returning them in $v0. In addition I want to point out
that I also learned (though not implemented here) that with nested subroutines you have to use a stack pointer
to store $ra, or suffer the fate of an infinite loop...

E.G.

subi $sp $sp 4 # move stack pointer down by 4

$ra, ($sp) # for nested subroutines

Add $sp $sp 4 # return stack pointer to location

This is important to avoid infinite loops, and to store long term data into memory that is retrievable though
The registers have been overwritten!


Did you encounter any issues? 
Yes!!!, storing my information was rather unusual and took up at least 2-4 hours of tinkering. In addition
retrieving the data to try to implement the cypher was difficult as well. 

Were there parts of this lab you found
enjoyable?
I didn't have much time to work on my last two labs, but in this lab I really felt that I was making
Progress on how strings were stored in memory, and how to properly allocate them by using .space.
I also want to note that though I didn't finish this lab, I will get back to it on my own free time, 
because how cool is it to build your own cypher?? I think its amazing, and I am kind of sad and disappointed 
more in myself that I wasn't able to give it my all in this lab.

How would you redesign this lab to make it better?
Perhaps group people in pairs for projects such as these. The labs are quite time consuming, and
other classes are impacted. Ergo, the lab was doable, its just time to work on such a lab is consuming.
I have to say that I have learned a lot in CMPE 12

* lw -- > mem to reg
* sw -- > reg to mem
* How alignment works in terms of word
* what it means when someone says 32 bits, a byte, giga, etc.
# xor, shifts, etc.

I really do feel that I can go into a Best Buy store and know exactly what is it that I am looking at in terms of
Hardware, and how the 0's and 1's work in your cpu. The examples Master R gives us in terms of packet really helps. Especially
when the professor taught us how little endian/big endian worked in mips

Did you collaborate with anyone on this lab? 
Please list who you collaborated with and the nature of your collaboration.
No, I never collaborate with anyone. In addition the only resource I tend to use.. Is the one provided by Master R.
That is the youtube videos that she recommedned, Amel. Which is an awesome resource, and makes MIPS
more comprehendible. In addition May I suggest that these labs would be great if you could work with another partner.
Perhaps groups of 2, and random students at that. I feel that these labs are somewhat heavy on time, leaving
other classes in a bind.Thus, even though I wanted to give my 110 percent to this class and its entirety. Realistically
its quite difficult to do so. Like I mentioned before... I think groups of two will force people to communicate, hold
others responsible, and lessen the workload. The work is doable, but it's just the time. I also want to go on a tangent
that this class made me love Computer Engineering, but unfortunately I'm in C.S. I wish I would of known from the beginning
how fun CMPE is, but hey there's always your masters degree. Thank you for reading this part!