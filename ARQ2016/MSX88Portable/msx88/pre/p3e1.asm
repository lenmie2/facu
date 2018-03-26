PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

ORG 2000H
MOV AL, 0 ; PA entradas (Microconmutadores)
OUT CA, AL
MOV AL, 0FFH ; PB salidas (Luces)
OUT CB, AL
POLL: IN AL, PA
OUT PB, AL
JMP POLL
END
		