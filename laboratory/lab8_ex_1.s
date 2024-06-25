	.data
str1:	.asciz "Plantation"
str2:	.asciz "PLan"
	.text
	ldr r0, =str1
	ldr r1, =str2
	push {r0, r1}
	bl startsWithStr
	pop {r0 - r2}
	wfi
	
startsWithStr:
	sub sp, #4 @ reserve space in the stack for the result
	push {r4 - r7} @ ARM calling convention
	
	ldr r0, [sp, #20] @ r0: pointer to str1
	ldr r1, [sp, #24] @ r1: pointer to str2
	
	ldrb r2, [r0] @ r2: loads characters from str1
	cmp r2, #0
	beq empty @ if string 1 is empty, return -1
	
	ldrb r3, [r1] @ r3: loads characters from str2
	cmp r3, #0
	beq empty @ if string 2 is empty, return -1
	
loop:	cmp r2, #'A'
	blt skip1
	cmp r2, #'Z'
	bgt skip1
	add r2, #32 @ if character is r2 is uppercase, convert to lowercase
skip1:	cmp r3, #'A'
	blt skip2
	cmp r3, #'Z'
	bgt skip2
	add r3, #32 @ if character is r3 is uppercase, convert to lowercase
skip2:	cmp r2, r3
	bne ret0 @ if characters are different, return 0
	
	add r1, #1
	ldrb r3, [r1] @ load next character from str2
	cmp r3, #0
	beq ret1 @ if str2 ends, return 1
	
	add r0, #1
	ldrb r2, [r0] @ load next character from str1
	cmp r2, #0
	beq ret0 @ if str1 ends before str2, return 0
	
	b loop @ back to loop
	
empty:	ldr r0, =-1
	b cleanup
ret0:	mov r0, #0
	b cleanup
ret1:	mov r0, #1
	b cleanup
	
cleanup:
	str r0, [sp, #16]
	pop {r4 - r7}
	mov pc, lr
