.data

zero: .double 0.0
prompt: .asciiz "Enter the miles and gallons on one line each, respectively.\n"
invalidData: .asciiz "Invalid entry.\n"
validData1: .asciiz "For "
validData2: .asciiz " mi and "
validData3: .asciiz " gal, the resulting mpg is "
newLine: .asciiz "\n"
avg: .asciiz "The average mpg is "
noData: .asciiz "No valid data was entered.\n"

.text
main:

li $s0, 0 #numMiles
li $s1, 0 #count
l.d $f14, zero

#$f2 numGallons
#$f4 miles
#$f6 avgMPG
#$f8 totalMiles
#$f10 totalGallons
#$f14 zero

while:
  #print prompt
  la $a0, prompt
  li $v0, 4
  syscall
  
  #read numMiles
  li $v0, 5
  syscall
  move $s0, $v0
  
  #read numGallons
  li $v0, 7
  syscall
  mov.d $f2, $f0
  
  #break if numMiles == 0
  beq $s0, $0, endwhile
  
  #copy numMiles into miles
  mtc1 $s0, $f0
  cvt.d.w $f4, $f0
  
  #if(numMiles > 0 && numGallons > 0)
  sgt $t1, $s0, $0
  c.lt.d $f2, $f14
  bc1t else1
    li $t2, 1
    b endif1
  else1:
    move $t2, $0
  endif1:
  and $t1, $t1, $t2
  beqz $t1, else2
    la $a0, validData1
    li $v0, 4
    syscall
    
    mov.d $f12, $f4
    li $v0, 3
    syscall
    
    la $a0, validData2
    li $v0, 4
    syscall
    
    mov.d $f12, $f2
    li $v0, 3
    syscall
    
    la $a0, validData3
    li $v0, 4
    syscall
    
    div.d $f12, $f4, $f2
    li $v0, 3
    syscall
    
    la $a0, newLine
    li $v0, 4
    syscall
    
    add.d $f8, $f4, $f8
    add.d $f10, $f10, $f2
    add $s1, $s1, 1
    b endif2
  else2:
    la $a0, invalidData
    li $v0, 4
    syscall
  endif2:
  
beq $0, $0, while
endwhile:

beqz $s1, else3
  la $a0, avg
  li $v0, 4
  syscall
  
  div.d $f12, $f8, $f10
  li $v0, 3
  syscall
  
  la $a0, newLine
  li $v0, 4
  syscall
b endif3
else3:
  li $v0, 4
  la $a0, noData
  syscall
endif3:

li $v0, 10
syscall