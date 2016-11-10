.data

myFloatArray: .single 5:4
x: .double 1.222222222
y: .double 5.3456789
textStuff: .asciiz "hello"


.text

	l.d $f2, x
	l.d $f4, y
	
	c.lt.d $f2, $f4

	li $v0, 4
	la $a0, textStuff
	syscall