	.data
string:	.asciz "E$x$tra$ Cri$$spy$!"
orig:	.space .-string
	
	.text
	ldr r0, =string
	ldr r1, =orig
loop:	ldrb r2, [r0]
	cmp r2, #0
	beq fin
	cmp r2, #'$'
	bne write
	add r0, #1
	b loop
write:	strb r2, [r1]
	add r0, #1
	add r1, #1
	b loop
fin:	mov r2, #0
	strb r2, [r1]
	wfi
