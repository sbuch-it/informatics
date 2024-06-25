	.data
nums:	.word 25, 5, -9, 7, 0
	
	.text
	ldr r0, =nums
	push {r0}
	bl minAddress
	pop {r0, r1}
	wfi
	
minAddress:
	sub sp, #4 @ reserve space in the stack for the result
	push {r4 - r7} @ ARM calling convention
	
	ldr r0, [sp, #20] @ r0: pointer to the list of numbers
	@ at the beginning, the first number is the smallest
	mov r1, r0 @ r1: address of smallest number
	ldr r2, [r1] @ r2: smallest number
	
loop:	ldr r3, [r0] @ load numbers from the sequence
	cmp r3, #0
	beq endl @ @ if number is 0, return
	cmp r3, r2
	bge next @ if number >= smallest, go to next number
	mov r2, r3 @ if number < smallest, update smallest number
	mov r1, r0 @ if number < smallest, update address of smallest number
next:	add r0, #4 @ point to the next number
	b loop @ back to loop
	
endl:	str r1, [sp, #16] @ address of smallest number on the stack
	pop {r4 - r7}
	mov pc, lr
