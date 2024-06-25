	.data
str1:	.ascii "Hello friend."
	@ [0x20070000] <= 0x6C6C6548
	@ [0x20070004] <= 0x7266206F
	@ [0x20070008] <= 0x646E6569
	@ [0x2007000C] <= 0x0000002E
str2:	.space .-str1
	
	.text
	ldr r0, =str1 @ r0: pointer to the input string
	ldr r1, =str2 @ r1: pointer to the output string
loop:	ldrb r2, [r0] @ r2: loads characters from the input string
	add r0, #1 @ update the pointer to str1
	cmp r2, #'.' @ compare r2 with character '.'
	beq fin @ exit condition
	cmp r2, #'a' @ compare r2 with character 'a'
	blt print @ if before 'a' then print same character
	cmp r2, #'z' @ compare r2 with character 'a'
	bgt print @ if before 'z' then print same character
	sub r2, #32 @ uppercase = lowercase - 32
print:	strb r2, [r1] @ loop body
	add r1, #1 @ update the pointer to str2
	b loop @ go back to loop
fin:	strb r2, [r1] @ store '.' at the end of the output string
	wfi
