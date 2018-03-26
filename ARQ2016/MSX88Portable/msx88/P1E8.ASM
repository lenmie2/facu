		ORG		1000H
DATO	DB		5H		;Byte a rotar
ROT		DB		3 		;Cantidad de rotaciones
		
		ORG		3000H
ROTARIZ:PUSH	DX
		PUSH	AX
		MOV		DL,0
		ADC 	AL,AL
		ADC		DL,0
		ADD		AL,DL
		DEC		DH
		CMP		DH,0
		POP		AX
		POP		DX
		RET

		ORG		3250H		;Repito 3 veces ROTARIZ
ROTADER:PUSH	AX
		MOV		AL,3
		CALL	REPE
		POP		AX
		RET

		ORG		3500H		;Por valor las veces que deseo repetir
REPE:	PUSH	AX
		CALL	ROTARIZ
		CMP		AL,0
		JNZ		REPE
		POP		AX
		RET

		ORG		2000H
		PUSH	AX
		PUSH	DX
		MOV		DL,DATO
		MOV		DH,ROT
		CALL	ROTADER
		POP		DX
		POP		AX
		HLT
		END

