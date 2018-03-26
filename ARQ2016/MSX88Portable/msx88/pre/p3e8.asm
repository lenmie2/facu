PIC		EQU	20H
HAND	EQU	40H
N_HND	EQU	10

	ORG	40H					;
IP_HND	DW	RUT_HND			;ruta interrupcion

	ORG	1000H					;
MSJ		DB	"FACULTAD DE	"
		DB	"INFORMATICA"
FIN		DB
	
	ORG	3000H
RUT_HND:PUSH AX			;salva estado anterior
		MOV AL, [BX]	;muevo el dato de el msj a al	
		OUT	HAND, AL 	;lo ubico en DATO (se imprime?)
		INC BX			;incremento el valor del indice del arreglo
		DEC CL 			;decremento el contador de chars
		MOV	AL, 20H 	; para terminar la interrupcion
		OUT	PIC, AL 	
		POP AX 			;retorno al estado anterior
		IRET

		ORG	2000H
		MOV	BX,	OFFSET MSJ					
		MOV	CL, OFFSET FIN-OFFSET MSJ
		CLI
		MOV	AL, 0FBH				; 1111 1011	
		OUT	PIC+1, AL				; 				NO TENGO IDEA
		MOV	AL, N_HND				
		OUT	PIC+6, AL				;  <- INT 2?
		MOV	AL, 80H					;				TAMPOCO NADA FUFFKKFKFCKF
		OUT	HAND+1, AL				
		STI
LAZO:	CMP CL,0  					;	lazo termina despues de imprimir
		JNZ lazo 					
		IN AL, HAND+1 				;	fuerzo el estado a 0?
		AND AL, 7FH
		OUT	HAND+1, AL				
		INT0
		END
