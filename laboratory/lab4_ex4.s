	.data
bcd:	.word 0x12345678
	
	.text
	mov r0, #0 @ r0: binary representation of the number
	ldr r1, =bcd @ pointer to the bcd label
	ldr r1, [r1] @ r1: BCD representation of the number 
	mov r2, #10 @ r2: auxiliary constant = 10
	mov r3, #1 @ r3: multiplication factor
	mov r4, #0xF @ r4: mask to isolate BCD digits
	
	@ isolate one BCD digit in each iteration,
	@ starting with the least significant one
loop:	cmp r1, #0
	beq fin
	mov r5, r1 @ r5: copy of BCD number
	and r5, r4 @ isolate least significant digit
	mul r5, r3 @ multiply by 10^(iteration number)
	add r0, r5
	mul r3, r2 @ update multiplication factor
	lsr r1, #4 @ discard least significant BCD digit
	b loop @ go back to loop
	
fin:	wfi
