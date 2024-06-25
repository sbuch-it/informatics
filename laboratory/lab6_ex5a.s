	.data
list:	.word 80, 30, 0, 43, -100, -4, 4
	
	.text
	ldr r0, =list
	mov r1, #7
	bl min
	wfi
	
min:	ldr r2, [r0] @ starting smallest number = first number in the list
loop:	cmp r1, #0
	beq ret @ loop end condition
	sub r1, #1 @ loop condition update
	ldr r3, [r0] @ loads number from the list
	add r0, #4 @ advance the pointer of the list
	cmp r3, r2
	bge loop @ if number >= smallest, go to the next iteration
	mov r2, r3 @ if number < smallest, smallest = number
	b loop
ret:	mov pc, lr @ return
