		;Memoria de Datos
		ORG 	1000H
NUM1	DB		5H
NUM2	DB		3H
		;Memoria de Instrucciones
		;Subrutina MUL
		ORG		3000H
MUL:	CMP		AL,0
		JZ		FIN
		CMP		CL,0
		JZ		FIN
		MOV		AH,0
		MOV		DX,0
LAZO:	ADD		DX,AX
		DEC		CL
		JNZ		LAZO
FIN:	RET
