;Memoria de datos
		ORG 	1000H
VOC		DW		"AaEeIiOoUu"
F1		DW		?
STR 	DW		"js3wwrDAF3faRAS"
F2		DW		?

		;Subrutina ES_VOCAL
ES_VOCAL:PUSH	CX
		PUSH	BX
		PUSH	DX

		MOV		CL, 0		;Resultado 00H 0FFH
		MOV		BX, OFFSET VOCALES		;Dir de Arreglo
		MOV		DL, OFFSET F1 - OFFSET VOCALES		;Largo del string

		CMP		[BX],AL
		JZ		SUCC
		DEC		DL
		JNZ		ES_VOCAL
		JMP		FIN
SUCC:	MOV		CL,0FFH

FIN:	POP		DX
		POP		BX
		POP		CX
		RET

		;Subrutina VOCALES
		ORG		3500H
VOCALES:MOV		CL,0  			;DATO que me va a decir si es vocal o no
LAZO:	MOV		AL,[BX]
		CALL	ES_VOCAL
		CMP		CL,0FFH
		JNZ		FAIL
		INC		CH				;Aumenta el numero de vocales
FAIL:	INC		BX				;Incrementa el indice
		DEC 	DL
		JNZ		LAZO
		RET

		;Programa Principal
		ORG		2000H
		PUSH	AX
		PUSH	CX
		PUSH	BX

		MOV		CH, 0		;Cantidad de Vocales
		MOV		BX, OFFSET STR		;Dir de Arreglo
		MOV		DL, OFFSET F2 - OFFSET STR		;Largo del string
		CALL	VOCALES

		POP		BX
		POP		CX
		POP		AX
		HLT
		END
