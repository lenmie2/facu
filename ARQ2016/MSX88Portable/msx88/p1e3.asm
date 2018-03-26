		;Memoria de datos
		;N1 Y N2 deben ser mayores que cero		
		ORG 	1000H
NUM1	DW		5H
NUM2	DW		3H

		;Memoria de Instrucciones
		;Subrutina MUL
		ORG 	3000H
MUL:	MOV		DX,0
LAZO:	MOV		BX,AX
		ADD		DX,[BX]
		PUSH	DX
		MOV		BX,CX
		MOV		DX,[BX]
		DEC		DX
		MOV		[BX], DX
		POP		DX
		JNZ		LAZO
		RET

		;Programa Principal
		ORG		2000H
		MOV		AX,OFFSET NUM1
		MOV		CX,OFFSET NUM2
		CALL	MUL
		HLT
		END
