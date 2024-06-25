	.text
	mov r0, #5 @ r0 <= 0x00000005
	mov r1, #7 @ r1 <= 0x00000007
	cmp r0, r1 @ N flag is set
	cmn r0, r1 @ no flags are set
	cmp r0, #5 @ Z and C flags are set
	wfi
