	.data
bcd:	.word 0x91234567
odd:	.space 4
	
	.text
	ldr r0, =bcd
	ldr r0, [r0] @ bcd number
	mov r1, #0 @ r3: counter of odd numbers
	mov r2, #1 @ mask
loop:	cmp r0, #0
	beq fin
	mov r3, r0 @ copy of bcd number
	lsr r0, #4
	and r3, r2 @ isolate least significant bit
	cmp r3, #1
	beq isOdd
	b loop
	
isOdd:	add r1, #1
	b loop
	
fin:	ldr r0, =odd
	str r1, [r0]
	wfi
