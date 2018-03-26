		.data	
n1:		.double	5
d1:		.double	2.55
n2:		.double	0
d2:		.double	0

		.code
		l.d 		f1, d1(r0)
		ld			r1, n1(r0)
		cvt.d.l 	f2,f1
		cvt.l.d 	f3,f2
		halt
