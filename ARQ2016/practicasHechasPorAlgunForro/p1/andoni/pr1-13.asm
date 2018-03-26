ORG 3000H
MUL: CMP AX, 0
     JZ FIN
     ADD CX, AX
     DEC AX
     CALL MUL
FIN: RET


ORG 2000H
     MOV CX, 0
     MOV AX, 3
     CALL MUL
     HLT

END
