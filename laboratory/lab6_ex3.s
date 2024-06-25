	.data
num:	.word 0x76543210
	
	.text
	ldr r5, =num
	ldr r0, [r5]
	mov r1, #4
	mov r2, #8
	bl setDigit
	str r0, [r5]
	wfi
	
setDigit:
	lsl r1, #2 @ shift of (4 * digit index) positions
	lsl r2, r1 @ shift the new BCD digit into the right position
	mov r3, #0xF @ mask to isolate the least significant digit
	lsl r3, r1 @ create the mask and shift it into the right position
	bic r0, r3 @ delete the previous BCD digit
	orr r0, r2 @ insert the new BCD digit
	mov pc, lr @ return
