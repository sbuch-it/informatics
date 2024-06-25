	.data
nums:	.word -8, -5
result:	.space 4
	
	.text
	ldr r0, =nums
	ldr r1, [r0]
	ldr r2, [r0, #4]
	push {r1, r2}
	bl sum
	pop {r1}
	str r1, [r0, #8]
	wfi
	
sum:	push {r0 - r7} @ ARM calling convention
	ldr r0, [sp, #32] @ loads first number is r0
	ldr r1, [sp, #36] @ loads second number is r1
	add r0, r1
	str r0, [sp, #36] @ store result at the bottom of the stack
	pop {r0 - r7} @ recover original values of registers
	add sp, #4 @ make sp point at the result,
	@ located at the bottom of the stack
	mov pc, lr
