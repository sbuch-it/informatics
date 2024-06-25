	.text
	mov r0, #15 @ r0 <= 0x0000000F
	add r0, #5 @ r0 <= 0x00000014
	add r0, r0, r0 @ r0 <= 0x00000028
	mov r1, #45 @ r1 <= 0x0000002D
	sub r1, #3 @ r1 <= 0x0000002A
	sub r1, r1, r0 @ r1 <= 0x00000002
	mul r1, r1, r0 @ r1 <= 0x00000050
	wfi
