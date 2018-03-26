		.data
valor1:	.word	16
valor2:	.word	4
result:	.word	0

		.text
		ld		$a0, valor1($0)
		ld		$a1, valor2($0)
		jal		pot
		sd		$v0, result($0)
		halt

pot:	daddi	$v0, $0, 1
lazo:	slt		$t1, $a1, $0
		bnez	$t1, fin
		daddi	$a1, $a1, -1
		dmul	$v0, $v0, $a0
		j 		lazo
fin:	jr		$ra
