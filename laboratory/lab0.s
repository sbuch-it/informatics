	.text
	
main:	mov r0, #5 @ r0 <= 0x00000005
	mov r1, #4 @ r1 <= 0x00000004
	add r2, r1, r0 @ r2 <= 0x00000009
	
stop:	wfi
