	.data
nums:	.word 25, 5, -9, 7, 0
		
	.text
	ldr r0, =nums
	push {r0}
	bl selectionSort
	pop {r0}
	wfi
	
selectionSort:
	push {r4 - r7, lr} @ ARM calling convention
	ldr r4, [sp, #20] @ r4: pointer to the number sequence
	
loop2:	ldr r6, [r4]
	cmp r6, #0
	beq fin @ if the number is a 0, we reached the end
	push {r4} @ push parameter for minAddress to the stack
	bl minAddress
	pop {r5} @ r5: address of smallest number
	pop {r4} @ r4: address of a number in the sequence
	@ swap first number in the list with smallest number
	ldr r6, [r4]
	ldr r7, [r5]
	str r6, [r5]
	str r7, [r4]
	add r4, #4 @ point to the next number in the list
	b loop2
	
fin:	pop {r4 - r7, pc} @ recover values of registers r4-r7 and return
	
minAddress:
	sub sp, #4
	push {r4 - r7}
	ldr r0, [sp, #20]
	mov r1, r0
	ldr r2, [r1]
loop:	ldr r3, [r0]
	cmp r3, #0
	beq endl
	cmp r3, r2
	bge next
	mov r2, r3
	mov r1, r0
next:	add r0, #4
	b loop
endl:	str r1, [sp, #16]
	pop {r4 - r7}
	mov pc, lr
