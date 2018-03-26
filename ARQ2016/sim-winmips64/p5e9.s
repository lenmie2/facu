		.data
valor:	.word	5
result: .word 	0
	
		.code
		daddi	$sp, $0, 0x400
		ld		$a0, valor($0)
		jal		facto
		sd		$v0, result($0)
		halt

facto:	dadd 	$t0, $0, $a0
		daddi 	$v0, $0, 1
		daddi 	$sp, $sp, -8
		sd		$ra, 0($sp)	
		daddi 	$sp, $sp, -8
		sd 		$s0, 0($sp)

carga:	daddi 	$sp, $sp, -8
		sd		$a0, 0($sp)
		daddi	$a0, $a0, -1
		beqz 	$a0, calc
		j 		carga

calc:	ld 		$s0, 0($sp)
		daddi 	$sp, $sp, 8

		dmulu 	$v0, $v0, $s0

		daddi 	$t0, $t0, -1
		bnez 	$t0, calc


		ld 		$s0, 0($sp)
		daddi 	$sp, $sp, 8
		ld 		$ra, 0($sp)
		jr 		$ra

