HAND	EQU	40H
		ORG	1000H
MSJ		DB	"FACULTAD DE		"
		DB	"INFOMATICA"
FIN		DB	?

		ORG	2000H
		IN 	AL, HAND+1
		AND	AL,	7FH			;fuerza el 7mo bit a 0
		OUT	HAND+1, AL
		MOV BX, OFFSET MSJ
		MOV	CL, OFFSET FIN-OFFSET MSJ
POLL:	IN 	AL,	HAND+1 		;poll hasta que la 7mo bit vuelva a 1
		AND	AL,	1
		JNZ	POLL
		MOV	AL, [BX]		;pasaje de datos a DATOS
		OUT	HAND,AL 
		INC BX			
		DEC CL
		JNZ POLL
		INT 0
		END
