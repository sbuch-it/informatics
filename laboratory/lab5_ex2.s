	.data
string:	.asciz "The beginning is Half of the Whole."
	.balign 4
upper:	.space 4
	
	.text
	ldr r0, =string @ r0: pointer to the string
	mov r1, #0 @ r1: counter of replaced characters
	
loop:	ldrb r2, [r0] @ r2: loads characters from the string
	cmp r2, #0
	beq fin
	cmp r2, #'A'
	blt next
	cmp r2, #'Z'
	bgt next
	mov r2, #'?' @ replace character in string
	strb r2, [r0]
	add r1, #1
	
next:	add r0, #1 @ must be at the end of the loop
	b loop
	
fin:	ldr r0, =upper
	str r1, [r0]
	wfi
