	.data
bcd1:	.word 0x12345678
bcd2:	.word 0x12345A
	
	.text
	ldr r0, =bcd1
	ldr r0, [r0]
	push {r0}
	bl BCDcheck
	pop {r1, r2}
	ldr r2, =bcd2
	ldr r2, [r2]
	push {r2}
	bl BCDcheck
	pop {r3, r4}
	wfi
	
BCDcheck:
	sub sp, #4 @ reserve space for result in the stack
	push {r0 - r7} @ ARM calling convention
	ldr r0, [sp, #36] @ load input parameter
	mov r1, #0xF @ r1: mask to isolate BCD digits
	
loop:	cmp r0, #0
	beq ret1 @ if BCD number becomes 0 before
	@ finding invalid digits, it is valid
	mov r2, r0 @ r2: copy of BCD number
	and r2, r1 @ isolate last BCD digit
	cmp r2, #9
	bgt ret0 @ if digit is greater than 9 BCD number is invalid
	lsr r0, #4 @ shift 4 bits, next digit as least significant digit
	b loop @ back to loop
	
ret1:	mov r0, #1 @ set 1 if number is valid
	b end
ret0:	mov r0, #0 @ set 0 if number is valid
end:	str r0, [sp, #32] @ store result in the space reserved in the stack
	pop {r0 - r7} @ recover saved register values
	mov pc, lr @ return
