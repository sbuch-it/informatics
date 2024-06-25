	.data
length:	.word 5
list:	.word 80, 35, 43, -100, 4
	
	.text
main:	ldr r0, =length
	ldr r0, [r0]
	ldr r1, =list
	
	@ push parameters into the stack
loop:	cmp r0, #0
	beq endl
	ldr r2, [r1]
	push {r2}
	sub r0, #1
	add r1, #4
	b loop
endl:	ldr r0, =length
	ldr r0, [r0]
	push {r0}
	bl numEven
	pop {r0}
	
	@ remove parameters from the stack
	pop {r2} @ r2: length of the list
	lsl r2, #2 @ multiply by 4
	add sp, r2 @ move sp to the bottom of the stack
	wfi
	
numEven:
	sub sp, #4 @ reserve space for the result
	push {r4 - r7} @ ARM calling convention
	
	mov r0, #0 @ r0: even number counter
	ldr r1, [sp, #20] @ r1: length of the list
	add r2, sp, #24 @ r2: pointer to list of numbers
	
loop2:	cmp r1, #0
	beq fin @ if there are no remaining numbers, we are done
	sub r1, #1
	ldr r3, [r2] @ r3: current number
	lsr r3, #1
	bcs next @ if carry set after right shift, number is not even
	add r0, #1 @ otherwise, number is even
next:	add r2, #4 @ point to next number
	b loop2 @ back to loop2
	
fin:	str r0, [sp, #16]
	pop {r4 - r7}
	mov pc, lr
