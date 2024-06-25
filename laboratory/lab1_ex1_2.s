	.data
word1:	.word 11 @ [0x20070000] <= 0x0000000B
word2:	.word 0x11 @ [0x20070004] <= 0x00000011
word3:	.word 011 @ [0x20070008] <= 0x00000009
word4:	.word 0b11 @ [0x2007000C] <= 0x00000003
	
	.text
stop:	wfi
