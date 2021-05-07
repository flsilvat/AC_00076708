org 100h

; 5!(120d 78h) y guardar en 20Bh  
        MOV byte CL, 05d ;x!
        XOR AX, AX
        MOV byte AL, 01d
        CMP CL, 00 ;if CL==0
        JZ salto1 ;salta si CL=0
condic:
        MUL CX  ;(CX) * AX  res en AX
        LOOP condic ;CX--
salto1:
        MOV [020Bh], AL;moviendo resultado

        int 20h