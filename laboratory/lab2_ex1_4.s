	.data
seq:	.hword 3, 7, 2, 5, 14, 2, 6, 0
	@ [0x20070000] <= 0x000700003
	@ [0x20070004] <= 0x000500002
	@ [0x20070008] <= 0x00020000E
	@ [0x2007000C] <= 0x000000006
count:	.space 2
	@ [0x20070010] <= 0x00000000
	
	.text
	ldr r0, =seq @ r0: pointer to the number sequence
	mov r1, #0 @ r1: counter of numbers >= 5
	
loop:	ldrh r2, [r0] @ r2: load numbers from the sequence
	add r0, #2 @ condition update
	cmp r2, #0 @ compare r2 with 0
	beq fin @ exit condition
	cmp r2, #5 @ compare r2 with 5
	blt loop @ if r2 < 5 then go to loop
	add r1, #1 @ r1 <= r1 + 1
	b loop @ go back to loop
	
fin:	ldr r0, =count @ r0 <= 0x20070010
	strh r1, [r0] @ [0x20070010] <= 0x00000004
	wfi
