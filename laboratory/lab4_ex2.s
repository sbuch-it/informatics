	.data
neven:	.space 4
nmul8:	.space 4
nums:	.hword 3, 8, 34, 12324, -24, 0
	
	.text
	ldrh r0, =nums @ r0: pointer to the number sequence
	mov r1, #0 @ r1: counter of even numbers
	mov r2, #0 @ r2: counter of multiple of 8
	mov r3, #0b1 @ r3: mask for even numbers
	mov r4, #0b111 @ r4: mask for multiples of 8
	
loop:	ldrh r5, [r0] @ r5: load numbers from the sequence
	sxth r5, r5 @ sign extension
	cmp r5, #0
	beq fin
	add r0, #2
	@ we need r3 because we cannot use an immediate
	tst r5, r3 @ even number test
	bne loop @ if number is not even, then go to the next
	add r1, #1
	tst r5, r4 @ multiple of 8 test
	bne loop @ if number is not multiple, then go to the next
	add r2, #1
	b loop
	
fin:	ldr r0, =neven
	str r1, [r0]
	ldr r0, =nmul8
	str r2, [r0]
	wfi
