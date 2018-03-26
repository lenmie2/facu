;p3e3
;Escribir un programa que encienda una luz a la vez, de las ocho conectadas al puerto paralelo del ;microprocesador a traves de la PIO, en el siguiente orden 0-1-2-3-4-5-6-7-6-5-4-3-2-1-0-1-2...
;Cada luz debe estar encendida por un segundo.

TIMER	EQU		10H
PIC		EQU		20H
PIO		EQU		30H
N_CLK	EQU		10

		ORG		40
IP_CLK	DW		RUT_CLK

		ORG		1000H
INICIO	DB 		1

		ORG		2000H
		CLI
		MOV		AL, 0FDH
		OUT		PIC+1, AL
		MOV 	AL, N_CLK
		OUT		PIC+5, AL
		MOV		AL, 1
		OUT 	TIMER+1, AL
		MOV 	AL, 0
		OUT 	TIMER, AL
		OUT 	PIO+3,AL
		OUT		PIO+1,AL
		STI
ARR:	MOV 	AL,INICIO
		ADD 	INICIO,AL
		CMP 	INICIO,80H
		JNZ 	ARR
ABA:	DEC 	INICIO
		JNZ 	ABA
		END
		ORG 	3000H
RUT_CLK: MOV		AL, INICIO
		OUT 	PIO+1, AL
		MOV 	AL, 0
		OUT 	TIMER, AL
		MOV 	AL, 20H
		OUT 	PIC, AL
		IRET
