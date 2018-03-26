			.data
CONTROL:	.word32		0x10000
DATA:		.word32		0x10008
texto: 		.byte 		0
			
			.code

			lwu 		$s0, DATA($0) 
			lwu 		$s1, CONTROL($0)
			dadd 		$s2, $0, $0
			daddi 		$t1, $0, texto
			daddi 	 	$t2, $0, 0x48

			daddi 		$t0, $0, 6
			sd			$t0, 0($s1)

loop:		daddi 		$t0, $0, 9
			sd 			$t0, 0($s1)

			lbu 		$t0, 0($s0)
			sd 			$t0, texto($s2)
			
			sd 			$t1, 0($s0)
			daddi 		$s2, $s2, 1
			dsub 		$t3, $t2, $t0
			beqz 		$t3, fin
			j 			loop


fin:		sd 			$t1, 0($s0)

			daddi 		$t0, $0, 4
			sd 			$t0, 0($s1)
			halt
