#Program: Activity5
.data #data declaration section

NameTitle: .asciiz "Name:"
Name: .asciiz "\tGeiger, Matthew\n"
GoalsTitle: .asciiz "Goals:"
Goals: .asciiz "\tBe the best dang Assembly Programmer\n"
CourseTitle: .asciiz "Course Number:\t"
CourseNumberTxt: .asciiz "352001\n"

# Macro for completing item
.macro done
li $v0,10
syscall
.end_macro

.text
main:
	# Print out My Name
	li $v0, 4
	la $a0, NameTitle
	syscall
	li  $v0, 4           
        la  $a0, Name              
        syscall              
                             
        # Print out My Goals                     
	li $v0, 4
	la $a0, GoalsTitle
	syscall 
	li $v0, 4
	la $a0, Goals
	syscall

	# Print out the Course Number
	li $v0, 4
	la $a0, CourseTitle
	syscall
	li $v0, 4
	la $a0, CourseNumberTxt
	syscall

	# Exit the Program
	done