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
	
	@ check if the string is a palindrome
	ldr r0, =sent @ r0: pointer to the string
	ldr r1, =rever @ r1: pointer to the reverse string
	
loop3:
load_sent:
	ldrb r2, [r0] @ r2: load characters from sent
	cmp r2, #' '
	bne load_rever @ skip the spaces in the string
	add r0, #1
	b load_sent
load_rever:
	ldrb r3, [r1] @ r3: load characters from rever
	cmp r3, #' '
	bne char_cmp @ skip the spaces in the string
	add r1, #1
	b load_rever
char_cmp:
	@ if characters are not equal, then
	@ it is not a palindrome
	cmp r2, r3
	bne nopal
	@ if 0 was loaded, then the string is over
	@ so it a palindrom
	cmp r2, #0
	beq ispal
	@ otherwise, advance pointers and continue
	add r0, #1
	add r1, #1
	b loop3
	
ispal:	ldr r0, =pal
	mov r1, #'Y'
	strb r1, [r0]
	wfi
	
nopal:	ldr r0, =pal
	mov r1, #'N'
	strb r1, [r0]
	wfi
