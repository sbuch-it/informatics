	.data
seq:	.word 6, 10, 4, 14, 9, 3, -1
	@ [0x20070000] <= 0x00000006
	@ [0x20070004] <= 0x0000000A
	@ [0x20070008] <= 0x00000004
	@ [0x2007000C] <= 0x0000000E
	@ [0x20070010] <= 0x00000009
	@ [0x20070014] <= 0x00000003
	@ [0x20070018] <= 0xFFFFFFFF
res:	.space 4
	@ [0x2007001C] <= 0x00000000
	
	.text
	ldr r0, =seq @ r0: pointer to the number sequence
	mov r1, #0 @ r1: store the sum result
	
loop:	ldr r2, [r0] @ r2 : load numbers from the sequence
	cmp r2, #0 @ compare r2 with 0
	blt fin @ if r2 < 0 then go to fin
	add r0, #4 @ condition update
	@ r0 points to the next value of the sequence
	add r1, r2 @ loop body
	b loop @ go back to loop
	
fin:	ldr r0, =res @ r0 <= 0x2007001C
	str r1, [r0] @ [0x2007001C] <= 0x0000002E
	wfi
