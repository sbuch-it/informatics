	.text
	mov r0, #33
	push {r0}
	bl mul16
	pop {r0}
	mov r1, #32
	push {r1}
	bl mul16
	pop {r1}
	wfi
	
mul16:	push {r0 - r7, lr} @ ARM calling convention
	ldr r0, [sp, #36] @ load input number
	mov r1, #0xF @ mask for testing multiple of 16
	and r0, r1
	cmp r0, #0
	beq ismul
	mov r2, #0 @ set 0 if not multiple of 16
	b end
ismul:	mov r2, #1 @ set 1 if multiple of 16
end:	str r2, [sp, #36] @ save result in the stack, replacing input number
	pop {r0 - r7, pc} @ recover saved values of registers, return
