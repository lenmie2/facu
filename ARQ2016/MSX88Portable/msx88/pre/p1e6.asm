	ORG	1000H
N1	DW	2222H
N2	DW	1111H
	
	ORG	3000H
SWAP:	MOV	BX,AX	;stackeo los valores
	MOV	DX,[BX]
	PUSH	DX

	MOV	BX,CX
	MOV	DX,[BX]
	PUSH	DX
		
		;realizo el intercambio
	MOV	BX,AX
	POP	DX
	MOV	[BX],DX
	MOV	AX,[BX]

	MOV	BX,CX
	POP	DX
	MOV	[BX],DX
	MOV	CX,[BX]	
	RET		

	ORG	2000H
	PUSH	AX
	PUSH	CX
	MOV	AX,OFFSET N1
	MOV	CX,OFFSET N2
	CALL	SWAP	
	POP	CX
	POP	AX
	HLT
	END
