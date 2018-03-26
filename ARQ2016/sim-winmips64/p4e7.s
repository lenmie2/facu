		.data
TABLA:	.word	7,7,7,5,7,5,5,7,7,7
RES:	.word	0,0,0,0,0,0,0,0,0,0
LONG:	.word	10
NUM:	.word	5
CANT:	.word	0
		.code
		dadd	r1,r1,r0
		ld		r2,LONG(r0)
		ld		r3,CANT(r0)
		ld		r4,NUM(r0)
loop:	ld		r5,TABLA(r1)		
		ld		r6,RES(r1)
		slt		r6,r4,r5
		dadd	r3,r3,r6
		beqz 	r6,no
		beq 	r4,r5,no
		sd		r6,RES(r1)
no:		daddi	r1,r1,8
		daddi	r2,r2,-1
		bnez 	r2,loop
		sd		r3,CANT(r0)
		nop
		halt
