PIC     EQU     20h
HAND    EQU     40h
DMA     EQU     50h
N_DMA   EQU     20

	ORG     80
IP_DMA  DW      RUT_DMA

	ORG     1000h
MSJ     DB      " INFORMATICA"
FIN     DB      ?
FLAG    DB      0

	ORG     3000h
RUT_DMA:MOV     AL, 0
	OUT     HAND + 1, AL
	MOV     FLAG, 1
	MOV     AL, 0FFh
	OUT     PIC + 1, AL
	MOV     AL, 20h
	OUT     PIC, AL
	IRET

	ORG     2000h
	CLI
	MOV     AL, N_DMA
	OUT     PIC + 7, AL

	MOV     AX, OFFSET MSJ
	OUT     DMA, AL
	MOV     AL, AH
	OUT     DMA + 1, AL

	MOV     AX, OFFSET FIN - OFFSET MSJ
	OUT     DMA + 2, AL
	MOV     AL, AH
	OUT     DMA + 3, AL

	MOV     AL, 4
	OUT     DMA + 6, AL

	MOV AL, 0F7h
	OUT     PIC + 1, AL
	OUT     DMA + 7, AL
	MOV     AL, 80h
	OUT     HAND + 1, AL
	STI

LAZO:   CMP     FLAG, 1
	JNZ     LAZO

	INT 0
	END
