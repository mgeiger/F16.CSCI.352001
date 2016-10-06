#Program: DivisionExample
#
#This program provides an example of dividing two integers and outputting
#the result.

.data #data declaration section

OutputPt1: .asciiz "\nThe result of dividing "
OutputPt2: .asciiz " by "
OutputPt3: .asciiz " is "
OutputPt4: .asciiz "\n"

.text #start of code section

main:  #execution begins with the label "main"

        li  $t1, 7          #load 7 into $t1
        li  $t2, 9          #load 9 into $t2
        div $t3, $t1, $t2   #divide $t1 by $t2 and load result into $t3
        
        li  $v0, 4           #system call code for printing string = 4
        la  $a0, OutputPt1    # load address of string OutputPt1 into $a0
        syscall              # call operating system to perform operation
                             # v0 specifies the system function called
                             # syscall takes $v0 (and opt arguments)
                             
        li  $v0, 1           #system call code for printing integer = 1
        move  $a0, $t1       #move data from $t1 into $a0
        syscall
        
        li  $v0, 4           #system call code for printing string = 4
        la  $a0, OutputPt2    # load address of string OutputPt2 into $a0
        syscall              # call operating system to perform operation

        li  $v0, 1	     #system call code for printing integer = 1
        move  $a0, $t2       #move data from $t2 into $a0
        syscall

        li  $v0, 4           #system call code for printing string = 4
        la  $a0, OutputPt3    # load address of string OutputPt3 into $a0
        syscall              # call operating system to perform operation
        
        li  $v0, 1	     #system call code for printing integer = 1
        move  $a0, $t3	     #move data from $t3 to $a0
        syscall
        
        li  $v0, 4           #system call code for printing string = 4
        la  $a0, OutputPt4    # load address of string OutputPt4 into $a0
        syscall              # call operating system to perform operation

	li  $v0, 10	     # system call code for terminate program
	syscall