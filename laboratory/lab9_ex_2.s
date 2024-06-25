	.data
nums:	.word 16, 47, 3, 15, 48, 0
	
	.text
	ldr r0, =nums
	push {r0}
	bl mul16counter
	pop {r0}
	wfi
	
mul16counter:
	push {r0 - r7, lr} @ ARM calling convention
	@ save values of used registers and lr
	ldr r0, [sp] @ load input address
	mov r2, #0 @ r2: counter of multiples of 16
loop:	ldr r1, [r0] @ r1: loads numbers from the list
	cmp r1, #0
	beq endl @ if number is 0, we are done
	push {r1} @ push number into the stack
	bl mul16 @ call mul16 subroutine
	pop {r1}
	add r2, r1 @ add result from mul16 to the counter
	@ add 0 if not multiple of 16 or add 1 if it is
	add r0, #4 @ point to next number
	b loop @ back to loop
endl:	str r2, [sp, #36] @ save result in the stack, replacing input value
	pop {r0 - r7, pc} @ recover values of registers and return
	
mul16:	push {r0 - r7, lr}
	ldr r0, [sp, #36]
	mov r1, #0xF
	and r0, r1
	cmp r0, #0
	beq ismul
	mov r2, #0
	b end
ismul:	mov r2, #1
end:	str r2, [sp, #36]
	pop {r0 - r7, pc}
