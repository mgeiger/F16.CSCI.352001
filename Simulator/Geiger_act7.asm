# This is to determine the area of a triangle or rectangle

.data
TypePrompt: .asciiz "\nEnter (1) for Triangle or (2) for Rectangle: "
BasePrompt: .asciiz "\nPlease enter the Base: "
HeightPrompt: .asciiz "\nPlease enter the Height: "
InvalidDisplay: .asciiz "\nInvalid Type"
AreaDisplay: .asciiz "\nYour object's area is: "
TwoDouble: .double 2.0

# Macro for completing the program
.macro done
	li $v0, 10
	syscall
.end_macro

.text
main:
	# Prompt the user for information
	li $v0, 4
	la $a0, TypePrompt
	syscall
	li $v0, 5
	syscall
	# Store the type into Temporary $t0
	move $t0, $v0

	# Have them enter in the base
	li $v0, 4
	la $a0, BasePrompt
	syscall
	li $v0, 7
	syscall
	# Store the Base into Temporary Float $f2
	mov.d $f2, $f0

	# Have them enter in the height
	li $v0, 4
	la $a0, HeightPrompt
	syscall
	li $v0, 5
	syscall
	# Store the Height into Temporary Float $f4
	mov.d $f4, $f0
	
	# Branch to different calculations
	# Check for Rectangle
	beq $t0, 2, rect_calc
	# Check for Triangle
	bne $t0, 1, failure
	
	mul.d $f12, $f2, $f4
	l.d $f8, TwoDouble
	div.d $f12, $f12, $f8
	# Print out the area display:
	li $v0, 4
	la $a0, AreaDisplay
	syscall
	# Print out the area value
	li $v0, 3
	syscall
	
	done
	
failure:
	# Exit if not entered properly
	li $v0, 4
	la $a0, InvalidDisplay
	done
	

rect_calc:
	mul.d $f12, $f2, $f4
	# Print out the area display:
	li $v0, 4
	la $a0, AreaDisplay
	syscall
	# Print out the area value
	li $v0, 3
	#move $a0, $t3
	syscall
	
	done
