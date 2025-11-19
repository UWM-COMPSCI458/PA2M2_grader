# Read in integer, store it in memory, read it from memory, print it out
.data

.text

li $v0, 5
syscall

sw $v0, 0x10010000
lw $a0, 0x10010000

li $v0, 1
syscall

li $v0, 10
syscall