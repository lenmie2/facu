		.data
A:		.word		1
B:		.word		2
C:		.word		4
D:		.word		0
		.code
		ld		r1,A(r0)
		ld		r2,B(r0)
		ld		r3,C(r0)
		dadd	r4,r4,r0
		beq		r1,r2,si
		bne		r1,r3,fin
si:		daddi	r4,r4,2	
		bne		r2,r3,fin
		daddi	r4,r4,1
fin:	halt
