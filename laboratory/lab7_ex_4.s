	.data
num:	.word 0x12345678
index1:	.word 3
index2:	.word 4
	
	.text
	ldr r0, =num
	ldr r0, [r0]
	ldr r1, =index1
	ldr r1, [r1]
	ldr r2, =index2
	ldr r2, [r2]
	push {r0 - r2}
	bl checkBits
	pop {r0 - r3}
	wfi
	
checkBits:
	ldr r0, [sp] @ r0: num
	ldr r1, [sp, #4] @ r1: index1
	ldr r2, [sp, #8] @ r2: index2
	mov r3, r0 @ r3: copy of num
	lsr r3, r1 @ index1 in least significant position of r3
	lsr r0, r2 @ index2 in least significant position of r0
	mov r1, #0b1 @ r1: mask to check the last bit
	and r0, r1
	and r3, r1 @ isolate least significant bits of r3 and r0
	cmp r0, r3
	beq equal @ if bits are equal, return 1
	b noteq @ @ otherwise, return 0
	
equal:	mov r0, #1
	push {r0}
	mov pc, lr
noteq:	mov r0, #0
	push {r0}
	mov pc, lr
