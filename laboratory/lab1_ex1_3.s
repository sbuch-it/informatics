	.data
words:	.word 11, 0x11, 011, 0b11
	@ [0x20070000] <= 0x0000000B
	@ [0x20070004] <= 0x00000011
	@ [0x20070008] <= 0x00000009
	@ [0x2007000C] <= 0x00000003
	
	.text
stop:	wfi
