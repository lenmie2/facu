		.data
long:	.word	10
tabla:	.word	1,2,3,4,5,6,7,8,9,10
cant:	.word	0
x:		.word	5
res:	.word	0
		.code
		dadd	r1,r0,r0
		ld		r2,long(r0)
		ld		r3,cant(r0)
		ld		r4,x(r0)
loop:	ld		r6,tabla(r1)
		slt		r5,r4,r6
		beqz	r5,sig
		daddi	r3,r3,1
sig:	sd		r5,res(r1f)
		daddi	r2,r2,-1
		daddi	r1,r1,8
		bnez	r2,loop
		sd		r3,cant(r0)
		halt
