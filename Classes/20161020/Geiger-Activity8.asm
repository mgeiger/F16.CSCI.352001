# Activity 8
# Matthew Geiger

# Calculate the Perimeter of a Triangle or Rectangle


.data
	inputPrompt: .asciiz "Enter (1) Triangle or (2) Rectangle: "
	newLine: .asciiz "\n"
	invalidDisplay: .asciiz "You have entered an invalid input.\n"
	perimeterDisplay: .asciiz "Total perimeter is: "
	enterPrompt: .asciiz "Enter side length: "
	
	.macro done
		li $v0, 10
		syscall	
	.end_macro
	
.text
# $t0 is the Rect/Tri
# $t1 is the number of sides (initial)
# $f12 is the total area
main:
	# Prompt the user for 1 or 2
	la $a0, inputPrompt
	li $v0, 4
	syscall
	# Read the integer form the user
	la $v0, 5
	syscall
	move $t0, $v0
	# Print out a blank line
	la $a0, newLine
	li $v0, 4
	syscall
		
	# See if we are a rectangle
	beq $t0, 2, setrect
	# Jump to a failure area if we aren't 2 or 1
	bne $t0, 1, inputfail
	
	# We are now working with a Triangle
	# We are working with 3 sides
	li $t1, 3
	# This is our counter
	li $t2, 0
	j loop
	
setrect:
	# We are going to work with a Rectangle
	# We are working with 4 sides
	li $t1, 4
	# This is our counter
	li $t2, 0
	j loop


loop:
	# Loop to ensure that we collect the correct number of sides
	beq $t1, $t2, end
	# Display enter
	la $a0, enterPrompt
	li $v0, 4
	syscall
	
	# Look for entry
	li $v0, 7
	syscall
	add.d $f12, $f12, $f0
	
	# Print new line
	la $a0, newLine
	li $v0, 4
	syscall
	
	# Add one to our loop
	addi $t2, $t2, 1
	j loop
	
inputfail:
	# Display error out
	la $a0, invalidDisplay
	li $v0, 4
	syscall
	done
	
end: 
	# Prints the Perimeter Total Display
	la $a0, perimeterDisplay
	li $v0, 4
	syscall
	# Prints the Perimeter Value
	li $v0, 3
	syscall
	# Prints a New line
	la $a0, newLine
	li $v0, 4
	syscall
	
	done