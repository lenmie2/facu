		.data
cadena:	.asciiz		"adbbdcdedfdgdhdidd"
car:	.asciiz		"d"
cant:	.word		0

		.code
		dadd		r1,r1,r0
		lbu			r2,car(r0)
		ld			r3,cant(r0)
loop:	lbu			r4,cadena(r1)
		bne			r4,r2,forw 	
		nop
		daddi		r3,r3,1
forw:	daddi		r1,r1,1
		bnez		r4,loop
		sd			r3,cant(r0)
		nop
		halt