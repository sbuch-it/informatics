	.data
nums:	.word 1, 2, 2, 1, 3, 2, 5, 0
sorted:	.space .-nums
	
	.text
	ldr r0, =nums @ r0: read from nums
	ldr r1, =sorted @ r1: write to sorted
	mov r2, #0 @ r2: load numbers from the string
	mov r3, #0 @ r3: keep last number written
	
loop:	ldr r2, [r0]
	cmp r2, #0
	beq fin
	add r0, #4
	cmp r2, r3
	bge write
	b loop
	
write:	str r2, [r1]
	add r1, #4
	mov r3, r2
	b loop
	
fin:	wfi
