	.text
	mov r0, #10 @ r0 <= 0x0000000A
	ldr r1, =0x1234 @ r1 <= 0x00001234
	mov r2, r1 @ r2 <= 0x00001234
	wfi
