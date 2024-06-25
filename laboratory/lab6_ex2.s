	.data
num:	.word 0x76543210
	
.text
	ldr r0, =num
	ldr r0, [r0]
	mov r1, #3
	bl getDigit
	wfi
	
getDigit:
	lsl r1, #2 @ shift of (4 * digit index) positions
	lsr r0, r1 @ shift the BCD number to the right
	mov r3, #0xF @ mask to isolate the least significant digit
	and r3, r0 @ isolate the digit and store it in r3
	mov pc, lr @ return
