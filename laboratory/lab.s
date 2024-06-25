.text
mov r0, #7
push {r0}
bl is_even
pop {r0}
mov r1, #4
push {r1}
bl is_even
pop {r1}
wfi

is_even:
push {r0 - r7, lr}
ldr r0, [sp, #36]
mov r1, #0x1 @ mask
and r0, r1
cmp r0, #0
beq yes
mov r2, #0
b skip
yes: mov r2, #1
skip: str r2, [sp, #36]
pop {r0 - r7, pc}
