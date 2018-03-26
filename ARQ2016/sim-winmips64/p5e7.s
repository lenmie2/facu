		.data
M:		.word		5
tabla:	.word		7,7,3,7,7,3,7,7,3,3
long:	.word		10
cant:	.word		0		
		
		.code
		ld			$a0, M($0)
		ld			$a1, tabla($0)
		ld			$a2, long($0)
		jal			contar
		sd			$v0, cant($0)
		halt

contar:	dadd		$v0, $0, $0
		daddi		$t0, $0, $0		
loop:	slt			$t1, $a1, $a0		
		bnez		$t1, no
		daddi		$v0, $v0, 1
no:		daddi		$t0, $t0, 8
		ld			$a1,tabla($t0)
		daddi		$a2, $a2, -1 		
		bnez		$a2, loop
		jr			$ra

