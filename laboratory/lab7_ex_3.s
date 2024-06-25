	.data
string:	.ascii "Every Tuesday has its Sunday."
letter:	.ascii "s"
	
	.text
	ldr r0, =string
	ldr r1, =letter
	ldrb r1, [r1]
	push {r0, r1}
	bl findChar
	pop {r0 - r3}
	wfi
	
findChar:
	ldr r0, [sp] @ r0: pointer to the string
	ldrb r1, [sp, #4] @ r1: character to find
	mov r2, #0 @ r2: number of occurrences
	mov r3, #0 @ r3: address of the last occurrence
	push {r4} @ save value of r4 on the stack
	@ (necessary to follow the ARM calling convention)
	
loop:	ldrb r4, [r0] @ r4: load characters from the string
	cmp r4, #'.'
	beq endl @ if character is a period, we are done
	cmp r4, #'A'
	blt next @ if character is lower than 'A', it is not a letter
	cmp r4, #'Z'
	bgt check @ if character is greater than 'Z', check character
	add r4, #32 @ if character is uppercase, convert to lowercase
check:	cmp r4, r1
	bne next @ @ if letters are not equal, go to the next character
	add r2, #1 @ if letters are equal, add 1 to the counter
	mov r3, r0 @ copy the address of the ocurrence to r3
next:	add r0, #1 @ point to the next character
	b loop
	
endl:	cmp r2, #0
	bne skip
	mov r3, r0 @ if no occurrences, copy address of period to r3
skip:	pop {r4} @ recover saved value of r4
	push {r2} @ number of occurrences at the bottom of the stack
	push {r3} @ address of last occurrence at the top of the stack
	mov pc, lr @ return
