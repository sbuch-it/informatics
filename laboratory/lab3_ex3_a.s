	.data
pal:	.space 1
sent:	.asciz "sit  on a  potato pan  otis"
rever:	.space .-sent
	
	.text
	ldr r0, =sent @ r0: pointer to the string
	mov r1, #0 @ r1: size of the string
	
	@ move the pointer to the end of the string,
	@ advance pointer until 0 is found and keep
	@ track of the length of the string
loop1:	ldrb r2, [r0] @ r2:  load character from the string
	cmp r2, #0
	beq endl1
	add r0, #1
	add r1, #1
	b loop1
	
endl1:	sub r0, #1 @ r0 points at the last character
	
	@ write the string in reverse
	ldr r3, =rever @ r3: pointer used to write the reverse
loop2:	cmp r1, #0
	beq endl2
	sub r1, #1
	ldrb r2, [r0]
	strb r2, [r3]
	sub r0, #1
	add r3, #1
	b loop2
	
endl2:	mov r2, #0
	strb r2, [r3] @ zero-terminated string
	wfi
