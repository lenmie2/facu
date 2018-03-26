			.data
tabla1: 	.word 		15, 8, 20, 45, 2, 53, 19, 61, 5, 34
mayor: 		.word 		0
control: 	.word32 	0x10000
data:		.word32 	0x10008
tabla2: 	.word 		0
		
			.code
			lwu 		$s0, data($0)
			lwu 		$s1, control($0)
			daddi		$t0, $0, 8
			sd			$t0, 0($s1)
			ld 			$t1, 0($s0)
			sd			$t1, mayor($0)
			dadd 		$a0, $0, $t1
			daddi 		$a1, $0, tabla1
			daddi		$a2, $0, tabla2
			daddi 		$a3, $0, 10
			jal 		generar
			dadd 		$a1, $0, $v0
			jal 		imprimir
			halt

generar: 	dadd 		$v0, $0, $0
			dadd 		$t0, $0, $0
loop:		dadd 		$t2, $0, $0
			ld 			$t1, tabla1($t0)
			slt 		$t2, $a0, $t1
			daddi 		$t0, $t0, 8
			bnez 		$t2, loop
			daddi 		$v0, $v0, 1
			sd 			$t1, 0($a2)
			daddi 		$a3, $a3, -1
			bnez 		$a3, loop
			jr 			$ra

imprimir: 	daddi 		$t4, $0, 0
			dadd 		$t2, $0, $0
loop2:		ld 			$t3, tabla2($t2)
			sd 			$t3, 0($t0)
			sd			$t4, 0($t1)
			daddi 		$v0, $v0, -1
			bnez 		$v0, loop2
			jr 			$ra



 
