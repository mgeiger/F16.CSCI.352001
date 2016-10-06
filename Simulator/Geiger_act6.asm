# Program: Activity6
# This program will take in two integer values.
# Then output the Sum, Product, and Remainder of the two integers

# Static Variables and Macros
.data
EntryText: .asciiz "Please enter an integer: "
ProductText: .asciiz "\t is the Product.\n"
SumText: .asciiz "\t is the Sum.\n"
RemainderText: .asciiz "\t is the Remainder (when doing integer division).\n"

# Macro for completing program
.macro done
	li $v0,10
	syscall
.end_macro

# Macro to Ask for an integer and store that integer in $v0
.macro enter_int
	li $v0, 4
	la $a0, EntryText
	syscall
	# TODO: What happens when we put in a Char or Float	
	li $v0, 5
	syscall
.end_macro

# Main Section of Code
.text
main:
	# Enter in the First Interger to $t0
	enter_int
	move $t0, $v0
	
	# Enter in the Second Integer to $t1
	enter_int
	move $t1, $v0
	
	# Assign Sum to $t2
	add $t2, $t0, $t1
	
	# Assign the Product of the two (2) inputs to $t3
	# TODO: Can make an overflow if the two values are >2^32
	mul $t3, $t0, $t1
	
	# Assign Remainder to $t3
	rem $t4, $t0, $t1
	
	# Print out the Sum Value
	li $v0, 1
	move $a0, $t2
	syscall
	# Print out the Sum Text
	li $v0, 4
	la $a0, SumText
	syscall

	# Print out the Product Value
	li $v0, 1
	move $a0, $t3
	syscall
	# Print out the Product Text
	li $v0, 4
	la $a0, ProductText
	syscall
	
	# Print out the Remainder Value
	li $v0, 1
	move $a0, $t4
	syscall
	# Print out the Remainder Text
	li $v0, 4
	la $a0, RemainderText
	syscall
	
	# Complete the program
	done