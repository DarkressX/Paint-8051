org 0

init:

mov P0,#0FFh
mov P1,#0FFh
mov R0,#80h
mov R1,#80h

MOV P0,#0h
MOV P1,#0h

loop:

CLR PSW.3
CLR PSW.4

jnb P2.0,right
jnb P2.1,left
jnb P2.2,up
jnb P2.3,down
jnb P2.4,enter

SETB PSW.3
SETB PSW.4

MOV P1,#080h
MOV P0,R0
MOV P0,#0h
MOV P1,#040h
MOV P0,R1
MOV P0,#0h
MOV P1,#020h
MOV P0,R2
MOV P0,#0h
MOV P1,#010h
MOV P0,R3
MOV P0,#0h
MOV P1,#08h
MOV P0,R4
MOV P0,#0h
MOV P1,#04h
MOV P0,R5
MOV P0,#0h
MOV P1,#02h
MOV P0,R6
MOV P0,#0h
MOV P1,#01h
MOV P0,R7
MOV P0,#0h
MOV P1,#0h

ljmp loop

right:
mov A,R0
RR A
mov R0,A
waitright:
jb P2.0,loop
ljmp waitright

left:
mov A,R0
RL A
mov R0,A
waitleft:
jb P2.1,loop
ljmp waitleft

up:
mov A,R1
RL A
mov R1,A
waitup:
jb P2.2,loop
ljmp waitup

down:
mov A,R1
RR A
mov R1,A
waitdown:
jb P2.3,loop
ljmp waitdown

enter:

PUSH 0
PUSH 1

SETB PSW.4

POP A

JB A.0,row0
JB A.1,row1
JB A.2,row2
JB A.3,row3
JB A.4,row4
JB A.5,row5
JB A.6,row6
JB A.7,row7


LJMP loop

row0:

SETB PSW.3
POP A
XRL A,R7
MOV R7,A

LJMP loop

row1:

SETB PSW.3
POP A
XRL A,R6
MOV R6,A

LJMP loop

row2:

SETB PSW.3
POP A
XRL A,R5
MOV R5,A

LJMP loop

row3:

SETB PSW.3
POP A
XRL A,R4
MOV R4,A

LJMP loop

row4:

SETB PSW.3
POP A
XRL A,R3
MOV R3,A

LJMP loop

row5:

SETB PSW.3
POP A
XRL A,R2
MOV R2,A

LJMP loop

row6:

SETB PSW.3
POP A
XRL A,R1
MOV R1,A

LJMP loop

row7:

SETB PSW.3
POP A
XRL A,R0
MOV R0,A

LJMP loop

end