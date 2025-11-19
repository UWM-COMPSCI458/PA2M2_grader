# A simple loop
.data

.text

	li $t0, 10
	li $t1, 0

loop:
	beq $t0, $t1, finished
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	addiu $t1, $t1, 1
	j loop
	
finished:
	
