		.data
A:		.word	1
B:		.word	2
C:		.word	3
D:		.word	0
		.code
		ld		r1,A(r0)
		ld		r2,B(r0)
		ld		r3,C(r0)
		ld		r4,D(r0)
		beq		r1,r3,sum1
		bne		r2,r3,fin
sum1: 	beq		r2,r3,fin2
		bne		r1,r2,fin	
fin1:	daddi	r4,r4,1
fin2:	daddi	r4,r4,2
fin: 	sd		r4,D(r0)
		halt	