	.data
nums:	.word 0xA7280C9D
	
	.text
	mov r0, #0 @ r0: counter of negative numbers
	ldr r1, =nums
	ldr r1, [r1] @ r1: sequence of 4-bit integers
	mov r2, #0b1000 @ r2: mask to check sign bit

loop:	cmp r1, #0
	beq fin
	tst r1, r2
	beq next
	add r0, #1
	
next:	lsr r1, #4
	b loop
	
fin:	wfi
