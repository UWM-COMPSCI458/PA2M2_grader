.data
str1: .asciiz "String 1\n"
str2: .asciiz "String 2\n"

.text
li $v0, 4
la $a0, str1
syscall

li $v0, 4
la $a0, str2
syscall

li $v0, 10
syscall
