		.data
cade1:	.asciiz		"javier"
cade2:	.asciiz		"javeer"
pos:	.word		0
		
		.code
		lbu			$a0, cade1($0)
		lbu			$a1, cade2($0)
		jal			diff
		sd			$v0, pos($0)
		halt

diff:	dadd		$t0, $0 , $0
		daddi 		$t1, $0 , 1
		

loop:	bne			$a1, $a0, succ
		bnez 		$a0, sig
		beqz 		$a1, fail 		

sig:	dadd		$t0, $t0, $t1
		lbu			$a0, cade1($t0)
		lbu			$a1, cade2($t0)
		j 			loop
succ:	dadd 		$v0, $0, $t0
		jr 			$ra
fail:	daddi 		$v0, $0 , -1
		jr 			$ra