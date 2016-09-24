#Program: Hello, World!
.data #data declaration section

Greeting: .asciiz "\nHello, World!\n"

.text #start of code section

main:  #execution begins with the label "main"

        li  $v0, 4           #system call code for printing string = 4
        la  $a0, Greeting    # load address of string to be printed
                             # into $a0
        syscall              # call operating system to perform
                             # operation
                             # v0 specifies the system function called
                             # syscall takes $v0 (and opt arguments)

	li  $v0, 10		#system call code for exit
	syscall
