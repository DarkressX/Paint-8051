start:
  mov R0,#10h
  mov R1,#20h
  mov a,#55h
weiter:
  lcall Ausgabe
  inc R0
  lcall warte200ms
  djnz R1,weiter
  lcall warte200ms
  ljmp start

Ausgabe:
  push acc
  mov a,R0
  cpl A
  mov P1,A
  pop acc
  ret

warte40ms:
  push 0
  push 1
  mov R0,#250
w1:
  mov R1,#160
w2:
  ;djnz R1,w2
  ;djnz R0,w1
  pop  1
  pop  0
  ret
  
warte200ms:
  push 0
  mov R0,#1
  
w3:
  lcall warte40ms
  ;djnz R0,w3
  pop 0
  ret
end