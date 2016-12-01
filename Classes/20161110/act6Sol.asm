#Program: act6Sol.asm
#
#This problem provides the results of adding, multiplying, and finding the
#remainder of two integers.

.data #data declaration section

IntegerPrompt: .asciiz "\nInput an integer: "
AddResult: .asciiz "Adding the two integers gives a result of "
MultResult: .asciiz "Multiplying the two integers gives a result of "
RemResult: .asciiz "The remainder from dividing the two integers is "
NewLine: .asciiz "\n"

.text #start of code section

main:  #execution begins with the label "main"

         li  $v0, 4           #system call code for printing string = 4
         la  $a0, IntegerPrompt # load address of string IntPrompt into $a0
         syscall              # call operating system to perform operation

         li  $v0, 5           #read an integer value into $v0
         syscall
         move  $t1, $v0     #load the integer value into a temporary register

         li  $v0, 4           #system call code for printing string = 4
         la  $a0, IntegerPrompt # load address of string IntPrompt into $a0
         syscall              # call operating system to perform operation

         li  $v0, 5           #read an integer value into $v0
         syscall
         move  $t2, $v0     #load the integer value into a temporary register

         add $s1, $t1, $t2  #add the integers
         mul $s2, $t1, $t2  #multiply the integers
         rem $s3, $t1, $t2  #find the remainder

         li  $v0, 4           #system call code for printing string = 4
         la  $a0, AddResult # load address of string AddResult into $a0
         syscall              # call operating system to perform operation

         li  $v0, 1           #system call code for printing integer = 1
         move  $a0, $s1       #load value of $s1 into $a0 (move)
         syscall

         li  $v0, 4           #system call code for printing string = 4
         la  $a0, NewLine     #load address of NewLine into $a0
         syscall              #call operating system to perform operation

         li  $v0, 4           #system call code for printing string = 4
         la  $a0, MultResult # load address of string MultResult into $a0
         syscall              # call operating system to perform operation

         li  $v0, 1           #system call code for printing integer = 1
         move  $a0, $s2       #load value of $s2 into $a0 (move)
         syscall

         li  $v0, 4           #system call code for printing string = 4
         la  $a0, NewLine     #load address of NewLine into $a0
         syscall              #call operating system to perform operation

         li  $v0, 4           #system call code for printing string = 4
         la  $a0, RemResult # load address of string RemResult into $a0
         syscall              # call operating system to perform operation

         li  $v0, 1           #system call code for printing integer = 1
         move  $a0, $s3       #load value of $s3 into $a0 (move)
         syscall

         li  $v0, 4           #system call code for printing string = 4
         la  $a0, NewLine     #load address of NewLine into $a0
         syscall              #call operating system to perform operation

         li  $v0, 10          #load termination code into $v0
         syscall              #terminate the program
