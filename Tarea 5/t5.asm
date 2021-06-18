org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d

    MOV DH, 10 ;fila en la que se mostrará el cursor
    MOV DL, 20 ;columna en la que se mostrará el cursor

    call modotexto

    ITERAR:
    ;Loop para mover el cursor y el caracter a imprimir en pantalla
        call movercursor ;llamada a mover cursor
        MOV CL, [cadena+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter; Llamada a escribircaracter
        INC SI ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI ; contador para terminar la ejecución del programa al llegar a 10
        CMP DI, 9d ; Comparación de DI con 10d
        JB ITERAR ; si DI es menor a 10, entonces que siga iterando.

    MOV DH, 12 ;fila en la que se mostrará el cursor
    MOV DL, 20 ;columna en la que se mostrará el cursor
    MOV SI, 0
    MOV DI, 0d
    iterar2:
        call movercursor 
        MOV CL, [cadena2+SI]
        call escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP DI, 4d 
        JB iterar2

    MOV DH, 14 ;fila en la que se mostrará el cursor
    MOV DL, 20 ;columna en la que se mostrará el cursor
    MOV SI, 0
    MOV DI, 0d
    iterar3:
        call movercursor 
        MOV CL, [cadena3+SI]
        call escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP DI, 5d 
        JB iterar3

    MOV DH, 16 ;fila en la que se mostrará el cursor
    MOV DL, 20 ;columna en la que se mostrará el cursor
    MOV SI, 0
    MOV DI, 0d
    iterar4:
        call movercursor 
        MOV CL, [cadena4+SI]
        call escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP DI, 6d 
        JB iterar4
        jmp esperartecla

    modotexto: 
     ;Similar a usar una función en alto nivel
        ;Modotexto(parametro1)
        ;Donde: parametro1= AL (modo gráfico deseado)
        MOV AH, 0h ; activa modo texto
        MOV AL, 03h ; modo gráfico deseado
        INT 10h
        RET
    movercursor:
      ;Similar a usar una función en alto nivel
        ;MoverCursor(parametro1, parametro2, parametro3,...)
        ;Donde: Parametro1 = DH (fila del cursor), parametro2 = DL (columna del cursor), 
        ;parametro 3 = BH (número de página)
        MOV AH, 02h ; posiciona el cursor en pantalla.
 
        MOV BH, 0h 
        INT 10h
        RET
    escribircaracter:
       ;Similar a usar una función en alto nivel
        ;EscribirCaracter(parametro1, parametro2, parametro3,...)
        ;Donde: parametro1 = AL (caracter), parametro2 = BH (número de página), 
        ;parametro3 = BL (estilo del texto en 8 bits)...
        MOV AH, 0Ah ; escribe caracter en pantalla según posición del cursor
        MOV AL, CL ; denotamos el caracter a escribir en pantalla, 
        ;           los valores deben ser según código hexadecimal de tabla ASCII
        MOV BH, 0h ; número de página
        MOV CX, 1h ; número de veces a escribir el caracter
        INT 10h
        RET

    esperartecla:
    ;Se espera que el usuario presione una tecla
        MOV AH, 00h ;espera buffer del teclado para avanzar en la siguiente instrucción
        INT 16h
    exit:
        int 20h



    section .data

    cadena DB 'Francisco'
    cadena2 DB 'Luis'
    cadena3 DB 'Silva'
    cadena4 DB 'Torres'
    