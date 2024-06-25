	.data
numA:	.word 54
numB:	.word 15
sum:	.space 4
diff:	.space 4
mult:	.space 4
quot:	.space 4
rem:	.space 4
	
	.text
	ldr r0, =numA
	ldr r0, [r0]
	ldr r1, =numB
	ldr r1, [r1]
	push {r0, r1}
	bl calc
	pop {r0 - r6}
	ldr r7, =sum
	str r4, [r7]
	ldr r7, =diff
	str r3, [r7]
	ldr r7, =mult
	str r2, [r7]
	ldr r7, =quot
	str r1, [r7]
	ldr r7, =rem
	str r0, [r7]
	wfi
	
calc:	ldr r0, [sp] @ r0: numA
	ldr r1, [sp, #4] @ r1: numB
	add r2, r0, r1 @ r2 = r0 + r1
	push {r2} @ push sum to the stack
	sub r2, r0, r1 @ r2 = r0 - r1
	push {r2} @ push difference to the stack
	mov r2, r0
	mul r2, r1 @ r2 = r2 * r1
	push {r2} @ push product to the stack
	
	mov r2, #0 @ r2: quotient
loop:	cmp r0, r1 @ if numA < numB, end division
	blt endl
	sub r0, r1 @ numA = numA - numB
	add r2, #1 @ quotient = quotient + 1
	b loop
endl:	push {r2} @ push quotient to the stack
	push {r0} @ push remainder to the stack
	mov pc, lr @ return
