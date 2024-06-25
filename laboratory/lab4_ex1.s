	.data
ones:	.space 4
num:	.quad 0x02AF785E01B59B34
	
	.text
	ldr r0, =num @ r0: pointer to the number
	ldr r1, [r0] @ r1: 4 least significant bits of num
	mov r2, #0 @ r2: counter of 1 digits
	
	@ shift to the right until r1 = 0
	@ if carry flag was set after shifting, it was a 1
loop1:	cmp r1, #0
	beq done1
	lsr r1, r1, #1 @ logical shift to the right
	bcc loop1 @ bcc = branch if carry clear
	add r2, #1 @ if carry set, then add 1 to the counter
	b loop1 @ go back to loop1
	
done1:	ldr r1, [r0, #4] @ r1: 4 most significant bits of num
	
loop2:	cmp r1, #0
	beq done2
	lsr r1, r1, #1 @ logical shift to the right
	bcc loop2 @ bcc = branch if carry clear
	add r2, #1 @ if carry set, then add 1 to the counter
	b loop2 @ go back to loop1
	
done2:	ldr r0, =ones
	str r2, [r0]
	wfi
