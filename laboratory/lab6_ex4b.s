	.data
str0:	.asciz "ama"
str1:	.asciz "Amame mi ama"
	
	.text
	ldr r0, =str0
	ldr r1, =str1
	bl startsWith
	wfi
	
startsWith:
	ldrb r2, [r0]
	cmp r2, #0
	beq empty
	ldrb r3, [r1]
	cmp r3, #0
	beq empty
loop:	cmp r2, #'Z' @ r2: transform to lowercase letter if needed
	bgt next1
	cmp r2, #'A'
	blt next1
	add r2, #32
next1:	cmp r3, #'Z' @ r3: transform to lowercase letter if needed
	bgt next2
	cmp r3, #'A'
	blt next2
	add r3, #32
next2:	cmp r2, r3
	bne no
	add r0, #1
	add r1, #1
	ldrb r2, [r0]
	cmp r2, #0
	beq yes
	ldrb r3, [r1]
	cmp r3, #0
	beq no
	b loop
yes:	mov r3, #1
	mov pc, lr
no:	mov r3, #0
	mov pc, lr
empty:	ldr r3, =-1
	mov pc, lr
