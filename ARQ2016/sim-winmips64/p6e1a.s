			.data
control:	.word32		0x10000
data:		.word32		0x10008
cadena:		.asciiz		"ingrese un caracter\n"
frase:		.space 		225

			.code
			lwu			$v0, control($0)
			lwu			$v1, data($0)
			daddi		$t2, $0, 46
			daddi 		$t4, $0, 0
			daddi 		$t0, $0, 6
			sd			$t0, 0($v0)

loop:		daddi 		$t7, $0, cadena
			sd 			$t7, 0($v1)
			daddi		$t7, $0, 4
			sd			$t7, 0($v0)
			daddi		$t0, $0, 9
			sd			$t0, 0($v0)
			
			lbu 		$t1, 0($v1)
			beq 		$t1, $t2, fin
			sb			$t1, frase($t4)
			daddi		$t4, $t4, 1
			j 			loop

fin: 		sb			$0, frase($t4)
			daddi		$t5, $0, frase
			sd			$t5, 0($v1)
			daddi		$t0, $0, 4
			sd			$t0, 0($v0)
			halt

