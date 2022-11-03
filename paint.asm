org 0

init:

mov P0,#0FFh
mov P1,#0FFh
mov R0,#80h
mov R1,#80h

loop:

jnb P2.0,right
jnb P2.1,left
jnb P2.2,up
jnb P2.3,down
jnb P2.4,enter

ljmp loop

right:

CLR C
mov A,R0
RR A
mov R0,A

waitright:
jb P2.0,loop
ljmp waitright

left:

up:

down:

CLR C
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

mov A,R0
POP A
mov R1,A
POP A
mov R0,A

end