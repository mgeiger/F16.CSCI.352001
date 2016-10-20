# Matthew Geiger
# Exam #1
# 2016.10.12
# Exam #1 Question #3
# Program will output name, course ids, and my hobbies

.data						# This section loads data into stored memory at the beginning of execution

NameText: .asciiz "Name: "			# Name header text
Name: .asciiz "Matthew Geiger\n"		# My Name text
CoursesText: .asciiz "Courses: "		# Courses header text
NewLine: .asciiz "\n"				# New Line constant text
Courses: .word 352:10				# My single class id as an integer array of 10 items all initialized with 352
HobbyText: .asciiz "Hobby: "			# Hobby Header text
Hobby: .asciiz "Speding time with my family.\n"	# My boring hobby text

.text						# This section is the instruction set/commands to execute at run-time

# Print out the Name Section
la $a0, NameText				# Load the Name Text
la $v0, 4					# Load it into a system call to output a string
syscall						# Execute this line to a system call

la $a0, Name					# Load My name Text
la $v0, 4					# Load it into a system call to output a string
syscall						# Execute this line to a system call

# Print out My Courses
la $a0, CoursesText				# Load the Cources Text
la $v0, 4					# Load it into a system call to output a string
syscall						# Execute this line to a system call

la $a0, NewLine					# Load the New Line Text
la $v0, 4					# Load it into a system call to output a string
syscall						# Execute this line to a system call

la $s0, Courses					# Load my courses array into Saved Register #0

lw $a0, 0($s0)					# Load the the first array value of $s0 into $a0
la $v0, 1					# Load it into a system call to output a word
syscall						# Execute this line to a system call

la $a0, NewLine					# Load the New Line Text
la $v0, 4					# Load it into a system call to output a string
syscall						# Execute this line to a system call

lw $a0, 4($s0)					# Load the the second array value of $s0 into $a0
la $v0, 1					# Load it into a system call to output a word
syscall						# Execute this line to a system call

la $a0, NewLine					# Load the New Line Text
la $v0, 4					# Load it into a system call to output a string
syscall						# Execute this line to a system call

# Print out My Hobby
la $a0, HobbyText				# Load the Name Text into argument register #0
la $v0, 4					# Load it into a system call to output a string
syscall						# Execute this line to a system call

la $a0, Hobby					# Load My name Text into argument register #0
la $v0, 4					# Load it into a system call to output a string
syscall						# Execute this line to a system call

# End the program
la $v0, 10					# Load the MIPS syscall for ending a program
syscall						# Execute the System Call to end the program