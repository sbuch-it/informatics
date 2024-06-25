	.data
nums:	.hword 7, 4, 5, 1, 9, 3, 8, 0
	.balign 4
count:	.space 4
		
	.text
	ldr r0, =nums @ r0: pointer to the sequence
	mov r1, #0 @ r1: counter of numbers > 4 and <= 8
	
loop:	ldrh r2, [r0] @ r2: load numbers from the sequence
	cmp r2, #0
	beq fin
	add r0, #2
	cmp r2, #4
	ble loop
	cmp r2, #8
	bgt loop
	add r1, #1
	b loop
	
fin:	ldr r0, =count
	str r1,[r0]
	wfi
