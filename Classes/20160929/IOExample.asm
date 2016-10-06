#Program: IOExample.asm
#
#This program provides an example of reading different types of input and providing 
#output.

.data #data declaration section

TextPrompt: .asciiz "\nInput a line of text: "
FloatPrompt: .asciiz "\nInput a real number: "
IntegerPrompt: .asciiz "\nInput an integer: "
NewLine: .asciiz "\n"

MyString: .space 256

.text #start of code section

main:  #execution begins with the label "main"

        li  $v0, 4           #system call code for printing string = 4
        la  $a0, TextPrompt    # load address of string TextPrompt into $a0
        syscall              # call operating system to perform operation
        
        li  $v0, 8           #system call code for reading string = 8
        la  $a0, MyString    # $a0 is the address of the input buffer MyString
        la  $a1, 255         # $a1 is the maximum number of characters to read
        syscall              #call operating system to perform operation
        
        li  $v0, 4           #system call code for printing string = 4
        la  $a0, FloatPrompt    # load address of string TextPrompt into $a0
        syscall              # call operating system to perform operation
        
        li  $v0, 7           # read a double value into $f0
        syscall              #call operating system to perform operation
        mov.d $f2, $f0       #move $f0 to $f2
        
        li  $v0, 4           #system call code for printing string = 4
        la  $a0, IntegerPrompt    # load address of string TextPrompt into $a0
        syscall              # call operating sytem to perform operation
        
        li  $v0, 5           #read an integer value into $v0
        syscall        
        move  $t1, $v0       #load the integer value into a temporary register
        
        
        li  $v0, 4           #system call code for printing string = 4
        la  $a0, MyString    # load address of string OutputPt1 into $a0
        syscall              # call operating system to perform operation
                             # v0 specifies the system function called
                             # syscall takes $v0 (and opt arguments)

        li  $v0, 4           #system call code for printing string = 4
        la  $a0, NewLine     #load address of NewLine into $a0
        syscall              #call operating system to perform operation
        
        li  $v0, 3           #system call code for printing double = 3
        mov.d $f12, $f2      #move $f2 into $f12 to print
        syscall              #call operating system to perform operation
        
        li  $v0, 4           #system call code for printing string = 4
        la  $a0, NewLine     #load address of NewLine into $a0
        syscall              #call operating system to perform operation
        
        li  $v0, 1           #system call code for printing integer = 1
        la  $a0, ($t1)       #load address of $t1 into $a0
        syscall
        
        li  $v0, 4           #system call code for printing string = 4
        la  $a0, NewLine     #load address of NewLine into $a0
        syscall              #call operating system to perform operation

	li  $v0, 10	     #load termination code into $v0
	syscall		     #terminate the program