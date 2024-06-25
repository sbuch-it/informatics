	.data
nums:	.word 3, 6, 10, 2, 0
blackjack:
	.space 1
	
	.text
	ldr r0, =nums @ r0: pointer to the number sequence
	mov r1, #0 @ r1: sum of the number sequence
	mov r2, #'N' @ r2: result of blackjack
loop:	ldr r3, [r0] @ r3: loads numbers from the sequence
	cmp r3, #0
	beq endl @ end condition
	add r1, r3
	add r0, #4 @ increment pointer
	b loop
endl:	cmp r1, #21
	beq saveY
	b fin
saveY:	mov r2, #'Y'
fin:	ldr r0, =blackjack
	str r2, [r0]
	wfi
