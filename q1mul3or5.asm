li $t0, 0 #stores sum for answer
li $t1, 3 #the current multiple to get
li $t2, 3 #number to work with
li $t3, 5 #number to work with

loop:
  rem $t4,$t1,$t2
  rem $t5,$t1,$t3 #get remainders
  bnez $t4,skipthree #check remainders. if three passes it skips checking 5
  add $t0,$t0,$t1 #add new multiple to sum
  j increment #skip checking 5
  skipthree:
    bnez $t5,skipfive
    add $t0,$t0,$t1 
  skipfive:
  increment:
    addi $t1,$t1,1 #increment value to check
    blt $t1,1000,loop #if multiple value less than 1000 repeat loop
#end loop

li $v0,1 #syscall for print value
add $a0,$t0,$zero #load answer into register
syscall #print answer

li $v0,10
syscall #terminate program