	.data
strg1:	.asciz "HELLO!" @ string terminated with 0
strg2:	.ascii "goodbye?" @ string not terminated with 0
byte:	.byte 0xff
	@ [0x20070000] <= 0x4C4C4548
	@ [0x20070000] <= 0x6700214F
	@ [0x20070000] <= 0x62646F6F
	@ [0x20070000] <= 0xFF3F6579
	
	.text
stop:	wfi
