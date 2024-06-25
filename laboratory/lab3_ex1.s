	.data
string:	.ascii "100 - Be water my friend!."
	.balign 4
upper:	.space 4
lower:	.space 4
nums:	.space 4
	
	.text
	ldr r0, =string @ r0: pointer to the character string
	mov r1, #0 @ r1: counter of uppercase letters
	mov r2, #0 @ r2: counter of lowercase letters
	mov r3, #0 @ r3: counter of numeric characters
	
loop:	ldrb r4, [r0] @ r4: load characters from the string
	cmp r4, #'.'
	beq fin @ if r4 == '.' then go to fin
	cmp r4, #'0'
	blt write @ if r4 before '0' then write the same character
	cmp r4, #'9'
	ble isnum @ if r4 before '9' then it is a number
	cmp r4, #'A'
	blt write @ if r4 before 'A' then write the same character
	cmp r4, #'Z'
	ble isupp @ if r4 before 'Z' then it is an uppercase letter
	cmp r4, #'a'
	blt write @ if r4 before 'a' then write the same character
	cmp r4, #'z'
	ble islow @ if r4 before 'Z' then it is a lowercase letter
	b write @ otherwise write the same character
	
isnum:	add r3, #1
	b write
	
isupp:	add r4, #32
	add r1, #1
	b write
	
islow:	sub r4, #32
	add r2, #1
	b write
	
write:	strb r4, [r0]
	add r0, #1 @ condition update
	b loop @ go back to loop
	
fin:	ldr r0, =upper
	str r1, [r0]
	ldr r0, =lower
	str r2, [r0]
	ldr r0, =nums
	str r3, [r0]
	wfi
