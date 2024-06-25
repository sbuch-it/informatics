	.data
str0:	.asciz "ama"
str1:	.asciz "amame mi ama"
	
	.text
	ldr r0, =str0
	ldr r1, =str1
	bl startsWith
	wfi
	
startsWith:
	ldrb r2, [r0] @ r2: loads characters from str0
	cmp r2, #0
	beq empty @ check if str0 is empty
	ldrb r3, [r1] @ loads characters from str1
	cmp r3, #0
	beq empty @ check if str1 is empty
loop:	cmp r2, r3
	bne no @ if characters are not equal, return 0
	add r0, #1 @ advance pointer for str0
	add r1, #1 @ advance pointer for str1
	ldrb r2, [r0] @ load next character from str0
	cmp r2, #0
	beq yes @ if str0 is over, return 1
	ldrb r3, [r1] @ load next character from str1
	cmp r3, #0
	beq no @ if str1 is over, return 0 (str1 shorter than str0)
	b loop
yes:	mov r3, #1
	mov pc, lr
no:	mov r3, #0
	mov pc, lr
empty:	ldr r3, =-1
	mov pc, lr
