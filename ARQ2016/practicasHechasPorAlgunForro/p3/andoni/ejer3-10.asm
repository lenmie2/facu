PIC     EQU     20h
DMA     EQU     50h
N_DMA   EQU     20

	ORG 80

IP_DMA  DW      RUT_DMA

	ORG 1000H
MSJ     DB      "FACULTAD DE"
	DB      " INFORMATICA"
FIN     DB ?
NCHAR   DB ?

	ORG 1500H
COPIA   DB ?

	ORG 3000H
RUT_DMA:MOV     AL, 0FFH ; inhabilito las interrupciones
	OUT     PIC+1, AL
	MOV     BX, OFFSET COPIA
	MOV     AL, NCHAR
	INT     7
	MOV     AL, 20h
	OUT     PIC, AL ; EOI
	IRET

	ORG 2000H
	CLI
	MOV     AL, N_DMA
	OUT     PIC + 7, AL

	MOV     AX,     OFFSET MSJ
	OUT     DMA, AL
	MOV     AL, AH
	OUT     DMA+1,AL

	MOV     AX, OFFSET FIN-OFFSET MSJ
	OUT     DMA+2, AL
	MOV     AL, AH
	OUT     DMA+3, AL

	MOV     AX, OFFSET COPIA
	OUT     DMA+4, AL
	MOV     AL, AH
	OUT     DMA+5, AL

	MOV     AL, 0Ah
	OUT     DMA + 6, AL

	MOV     AL, 0F7h
	OUT     PIC + 1, AL

	STI
	MOV     BX, OFFSET MSJ
	MOV     AL, OFFSET FIN - OFFSET MSJ
	MOV     NCHAR, AL
	INT     7
	MOV     AL, 7h
	OUT     DMA + 7, AL
	INT     0
	END



