		.data
imc:	.double		0 
estado:	.word		0
peso:	.double		100.0
estat:	.double		1.55
infra:	.double 	18.5
norm:	.double		25.0
sobre:	.double		30.0

		.code
		l.d 		f2,peso(r0)
		l.d 		f3,estat(r0)
		l.d 		f4,infra(r0)
		dadd 		r1,r0,r0
		mul.d 		f3,f3,f3
		l.d 		f5,norm(r0)
		div.d 		f1,f2,f3
		l.d 		f6,sobre(r0)

		c.lt.d 		f1,f4
		bc1t 		inf
		c.lt.d 		f1,f5
		bc1t 		nor
		c.lt.d 		f1,f6
		bc1t 		sob
		nop		
		daddi 		r1,r1,4
		j 			fin
		nop

inf:	daddi 		r1,r1,1 			;infrapeso
		j			fin
		nop
nor: 	daddi 		r1,r1,2 			;normal
		j			fin
		nop
sob: 	daddi 		r1,r1,3 			;sobrepeso
		j			fin
		nop
fin:	sd 			r1,estado(r0)
		s.d			f1,imc(r0)
		halt
