	.data
sent:	.asciz "Cogito,   ergo sum (Rene Descartes)"
	.balign 4
words:	.space 4
	
	.text
	ldr r0, =sent @ r0: pointer to the character string
	mov r1, #0 @ r1: counter of words
	mov r2, #' ' @ r2: previous character
	
loop:	ldrb r3,[r0] @ r1: load characters from the string
	add r0, #1 @ condition update
	cmp r3, #0 @ exit condition
	beq fin @ if r3 == 0 then go to fin
	@ if current character is not uppercase, then
	@ it cannot be the start of a new word
	cmp r3, #'A'
	blt next
	cmp r3, #'Z'
	bgt next
	@ if current character is not a whitespace and the
	@ previous character was, then it is a new word
	cmp r3, #' '
	beq next
	cmp r2, #' '
	bne next
	add r1, #1 @ otherwise
	
next:	mov r2, r3 @ previous character <= current character
	b loop @ go back to loop
	
fin:	ldr r0, =words
	str r1, [r0]
	wfi
