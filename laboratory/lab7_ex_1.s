	.data
sent:	.asciz "You reap what you sow..."
	
	.text
	ldr r0, =sent @ r0: pointer to the character string
	mov r1, #0 @ r1: character counter
	
loop1:	ldrb r2, [r0, r1] @ r2: loads characters from string
	cmp r2, #0
	beq endl1 @ if end of string, exit loop1
	push {r2} @ push each character into the stack
	add r1, #1 @ update character counter
	b loop1
	
endl1:	ldr r0, =sent @ move r0 back to the start of the string
loop2:	cmp r1, #0
	beq endl2 @ if character counter reaches 0, we are done
	pop {r2} @ take character from the top of the stack
	strb r2, [r0] @ overwrite original string
	sub r1, #1 @ decrease character counter by 1
	add r0, #1 @ point to next character
	b loop2
	
endl2:	wfi
