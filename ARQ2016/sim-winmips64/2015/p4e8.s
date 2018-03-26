		.data
x:		.word	1
y:		.word	2
a:		.word	3
		.code
		ld		r1,x(r0)
		ld		r2,y(r0)
		ld		r3,a(r0)
loop:	dadd	r1,r2,r1
		daddi	r3,r3,-1
		bnez	r3,loop
		sd		r1,y(r0)
		halt
