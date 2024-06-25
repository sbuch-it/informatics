	.data
str1:	.asciz "A man with a plan"
str2:	.asciz "AN"
	
	.text
	ldr r0, =str1
	ldr r1, =str2
	push {r0, r1}
	bl occurrences
	pop {r1, r2}
	wfi
	
occurrences:
	push {r4 - r7, lr} @ ARM calling convention
	@ save values of registers that will be used
	@ in this subroutine, as well as lr
	ldr r4, [sp, #20] @ r4: pointer to str1
	ldr r5, [sp, #24] @ r5: pointer to str2
	mov r6, #0 @ r6: occurrence counter
	
loop2:	push {r4, r5} @ push parameters to call startsWithStr
	bl startsWithStr
	pop {r7} @ r7: result from startsWithStr
	pop {r4, r5} @ r4, r5: pointers to str1 and str2
	cmp r7, #0
	blt fin @ if startsWithStr returns -1, go to fin
	add r6, r7 @ add result from startsWithStr
	@ add 0 if no occurrence or add 1 if occurrence
	add r4, #1 @ point to next character in str1
	b loop2 @ back to loop2
	
fin:	mov r0, r6 @ result in r0
	pop {r4 - r7, pc} @ recover saved register values and return
	
startsWithStr:
	sub sp, #4
	push {r4 - r7}
	ldr r0, [sp, #20]
	ldr r1, [sp, #24]
	ldrb r2, [r0]
	cmp r2, #0
	beq empty
	ldrb r3, [r1]
	cmp r3, #0
	beq empty
loop:	cmp r2, #'A'
	blt skip1
	cmp r2, #'Z'
	bgt skip1
	add r2, #32
skip1:	cmp r3, #'A'
	blt skip2
	cmp r3, #'Z'
	bgt skip2
	add r3, #32
skip2:	cmp r2, r3
	bne ret0
	add r1, #1
	ldrb r3, [r1]
	cmp r3, #0
	beq ret1
	add r0, #1
	ldrb r2, [r0]
	cmp r2, #0
	beq ret0
	b loop
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
