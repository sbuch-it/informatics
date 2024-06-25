	.data
seq:	.asciz "12534543"
	@ [0x20070000] <= 0x33353231
	@ [0x20070004] <= 0x33343534
	.balign 4
fives:	.space 4
	@ [0x2007000C] <= 0x00000000
	
	.text
	ldr r0, =seq @ r0: pointer to the string
	mov r1, #0 @ r1: counter of '5' characters
loop:	ldrb r2, [r0] @ load characters from the string
	cmp r2, #0 @ compare r2 with 0
	beq fin @ exit condition
	add r0, #1 @ condition update
	cmp r2, #'5' @ compare r2 with character '5'
	bne loop @ if r2 != '5' then go to loop
	add r1, #1 @ r1 <= r1 + 1
	b loop @ go back to loop
fin:	ldr r0, =fives @ r0 <= 0x2007000C
	str r1, [r0] @ [0x2007000C] <= 0x00000002
	wfi
