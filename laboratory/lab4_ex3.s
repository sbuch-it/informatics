	.data
octal:	.asciz "12347"
	.balign 4
num:	.space 4
	
	.text
	ldr r0, =octal @ r0: pointer to the string
	mov r1, #0 @ r1: regular numeric representation
	
	@ for each digit, the loop does
	@ number = (previous_number * 8) + digit
loop:	ldrb r2, [r0] @ r2: loads digits from the string
	cmp r2, #0
	beq fin
	add r0, #1 @ condition update
	sub r2, #'0' @ convert from ASCII to numeric value
	lsl r1, #3 @ shift to left by 3 = multiply by 8
	add r1, r2 @ place the digit at the end
	b loop
	
fin:	ldr r0, =num
	str r1, [r0]
	wfi
