#Write a MIPS program to compute the product of all the elements in an array.  The array is hold values as follows:
#{9, 7, 3, 1, 4, 2, 8, 6, 5, 10}
#Your MIPS assembly program uses a loop to produce the product of all elements.  The output of the program should be looked like following:
#The product is 3628800
# -- program is finished running --

.text
	inputArray: .word 9, 7, 3, 1, 4, 2, 8, 6, 5, 10		# The initial array
	outputText: .asciiz "The product is "			# Our final output text
	newLineText: .asciiz "/n"				# For printing a new line
	
.data
	