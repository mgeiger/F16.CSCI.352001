#AreaCalculator.asm - activity7
#A program to compute the area of a triangle or a rectangle
#Inputs: 1 for a triangle and 2 for a rectangle
#        The length of the side of a square or the circle radius

.data
inputPrompt: .asciiz "Enter 1 for triangle 2 for rectangle: "
trianglePrompt: .asciiz "Enter the base and height of the triangle: "
rectanglePrompt: .asciiz "Enter the height and width of the rectangle: "
incorrectInput: .asciiz "Invalid input\n"
outputData: .asciiz "The area is "
newline: .asciiz "\n"
two: .double 2.0

.text
main:

#Prompt user for input
la $a0, inputPrompt
li $v0, 4
syscall

#Read an integer
la $v0, 5
syscall
move $t1, $v0

#triangle
#if t1 == 1
beq $t1, 2, elseif
bne $t1, 1, else

  #prompt for triangle
  la $a0, trianglePrompt
  li $v0, 4
  syscall

  l.d $f4, two

  #read base into $f0
  li $v0, 7
  syscall

  mov.d $f2, $f0

  #read height into $f0
  li $v0, 7
  syscall

  #compute and print area
  la $a0, outputData
  li $v0, 4
  syscall

  mul.d $f12, $f2, $f0
  div.d $f12, $f12, $f4
  li $v0, 3
  syscall 

  la $a0, newline
  li $v0, 4
  syscall
  
  #j endif
  b endif
elseif:

  #prompt for rectangle
  la $a0, rectanglePrompt
  li $v0, 4
  syscall

  #read height into $f0
  li $v0, 7
  syscall

  mov.d $f2, $f0

  #read width into $f0
  li $v0, 7
  syscall

  #compute and print area
  la $a0, outputData
  li $v0, 4
  syscall

  mul.d $f12, $f0, $f2
  li $v0, 3
  syscall 

  la $a0, newline
  li $v0, 4
  syscall
  j endif
else:
  la $a0, incorrectInput
  li $v0, 4
  syscall
endif:

#end program
li $v0, 10
syscall

