	.text
	mov r0, #5
	mov r1, #3
	bl pow
	wfi
	
pow:	mov r2, #1
loop:	cmp r1, #0
	beq ret
	sub r1, #1
	mul r2, r0
	b loop
ret:	mov pc, lr
