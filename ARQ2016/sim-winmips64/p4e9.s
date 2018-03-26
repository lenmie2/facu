		.data
A:		.word	6
X:		.word	1
Y:		.word	2	

		.code
		ld		r1,A(r0)
		ld		r2,X(r0)
		ld		r3,Y(r0)
loop:	dadd	r2,r2,r3
		daddi	r1,r1,-1
		bnez	r1,loop
		sd 		r1,A(r0)
		sd		r2,X(r0)
		sd		r3,Y(r0)
		nop
		halt
