	.data
bcd:	.word 0x12345678
numOK:	.space 1
	
	.text
	ldr r0, =bcd
	ldr r0, [r0] @ r0: BCD number
	mov r1, #0xF @ r1: mask to isolate BCD digits
	
	@ check one BCD digit at a time,
	@ starting with the least significant one.
	@ If an invalid digit is detected: numOK = 'F'
	@ If only zeros remain in the BCD number: numOK = 'T'
loop:	cmp r0, #0
	beq true @ if BCD number = 0, we are done
	mov r2, r0 @ r2: copy of BCD number
	and r2, r1 @ isolate last digit
	cmp r2, #9
	bgt false @ if digit > 9, it is invalid
	lsr r0, #4 @ discard last digit of BCD number
	b loop
	
true:	ldr r0, =numOK
	mov r1, #'T'
	strb r1, [r0]
	wfi
	
false:	ldr r0, =numOK
	mov r1, #'F'
	strb r1, [r0]
	wfi
