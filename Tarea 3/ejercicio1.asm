org 100h
section .text
    XOR SI, SI ; Limpiar SI
    XOR DI, DI ; Limpiar DI
    XOR AX, AX
    MOV byte [200h], 0d ;00076708
    MOV byte [201h], 0d
    MOV byte [202h], 0d
    MOV byte [203h], 7d
    MOV byte [204h], 6d
    MOV byte [205h], 7d
    MOV byte [206h], 0d
    MOV byte [207h], 8d
    MOV word CX, 8d ; colocar 8d en CX pq el loop lo usa para iterar
    jmp iterar

iterar:
    MOV byte DL, [200h+SI]
    ADD AL, DL
    INC SI
    LOOP iterar ;usa CX para iterar y agrega CX--

    ;en AL ya esta el dividendo (la suma)
    MOV BL, 8d ;para dividir entre 8 y sacar promedio
    DIV BL ;hace AX/BL   guarda cociente en AL
    MOV [20Ah], AL ;moviendo el cociente
exit:
    int 20h