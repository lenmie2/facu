		.data
base:	.double		5.85
altura:	.double		13.47
res:	.double		0
		.code
		l.d 		f1,base(r0)
		l.d 		f2,altura(r0)
		daddi		r1, r0, 2 	
		mtc1 		r1, f3 			
		cvt.d.l 	f3, f3
		mul.d 		f4, f1, f2
		div.d 		f4, f4, f3
		s.d 		f4, res(r0)
		halt
