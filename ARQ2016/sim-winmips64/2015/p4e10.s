		.data
cadena:	.asciiz	"aspfmsbmsdsdfasfbsdfc"
car:	.asciiz	"d"
cant:	.word	0
		.code
		lbu		r1,car(r0)
		ld		r2,cant(r0)
		daddi	r3,r3,0
loop:	lbu		r4,cadena(r3)
		bne		r4,r1,sig
		daddi	r2,r2,1
sig:	daddi	r3,r3,1
		bnez	r4,loop
		sd		r2,cant(r0)
		halt
