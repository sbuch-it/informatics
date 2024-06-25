	.data
sum:	.word 5, 6, 7
	@ [0x20070000] <= 0x00000005
	@ [0x20070004] <= 0x00000006
	@ [0x20070008] <= 0x00000007
subs:	.word 2, 3, 4
	@ [0x2007000C] <= 0x00000002
	@ [0x20070010] <= 0x00000003
	@ [0x20070014] <= 0x00000004
mult:	.word 3
	@ [0x20070018] <= 0x00000003
res:	.space 4
	@ [0x2007001C] <= 0x00000000
	
	.text
	ldr r0, =sum @ r0: pointer to the number sequence
	mov r1, #0 @ r1: result
	mov r2, #0 @ r2: load numbers from the sequence
	ldr r2, [r0] @ r2 <= 0x00000005
	add r1, r2 @ r1 <= 0x00000005
	ldr r2, [r0, #4] @ r2 <= 0x00000006
	add r1, r2 @ r1 <= 0x0000000B
	ldr r2, [r0, #8] @ r2 <= 0x00000007
	add r1, r2 @ r1 <= 0x00000012
	ldr r2, [r0, #12] @ r2 <= 0x00000002
	sub r1, r2 @ r1 <= 0x00000010
	ldr r2, [r0, #16] @ r2 <= 0x00000003
	sub r1, r2 @ r1 <= 0x0000000D
	ldr r2, [r0, #20] @ r2 <= 0x00000004
	sub r1, r2 @ r1 <= 0x00000009
	ldr r2, [r0, #24] @ r2 <= 0x00000003
	mul r1, r2 @ r1 <= 0x0000001B
	str r1, [r0, #28] @ [0x2007001C] <= 0x0000001B
	wfi
