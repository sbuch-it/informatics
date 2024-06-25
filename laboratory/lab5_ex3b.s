	.data
nums:	.word 0xA7280C9D
	
	.text
	mov r0, #0 @ r0: counter of negative numbers
	ldr r1, =nums
	ldr r1, [r1] @ r1: sequence of 4-bit integers
	
loop:	cmp r1, #0
	beq fin
	lsr r1, #4
	bcc loop
	add r0, #1
	b loop
	
fin:	wfi
