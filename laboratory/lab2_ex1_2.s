	.data
num1:	.word 5 @ [0x20070000] <= 0x00000005
num2:	.word 3 @ [0x20070004] <= 0x00000003
res:	.space 4 @ [0x20070008] <= 0x00000000
	
	.text
	ldr r0, =num1 @ r0 <= 0x20070000
	ldr r0, [r0] @ r0 <= 0x00000005
	ldr r1, =num2 @ r0 <= 0x20070004
	ldr r1, [r1] @ @ r0 <= 0x00000003
	mov r2, #1 @ @ r2 <= 0x00000001
	
loop:	cmp r1, #0 @ compare r1 with 0
	beq fin @ if r1 == 0 then go to fin
	sub r1, r1, #1 @ r1 <= r1 - 1
	mul r2, r2, r0 @ r2 <= r2 * r0
	b loop @ go back to loop
	
fin:	ldr r0, =res @ r0 <= 0x20070008
	str r2, [r0] @ [0x20070008] <= 0x0000007D
	wfi
