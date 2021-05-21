;Una o mas subrutinas, arreglo 1 byte. 10 numeros declarado en data
;separar pares e impares. pares en 0300H. impares 0320H. subir al github
;MAIN
        org		100h
        section .text
        xor     	SI, SI          ;SI = 0 (array)
        xor     	DI, DI          ;DI = 0
	xor		AX, AX		;AX = 0
	mov byte	[200h], 0	;200h esta mi contador de pares
	mov byte	[210h], 0	;210h esta mi contadores de impares
        mov    		BL, cte         ;preparando la division
	mov word	CX, 10d		;preparando el loop porque usa CX
Iterar:
        mov     	AL, [arr+SI]    ;moviendo cada valor a AL pq es dividendo
	mov		DL, [arr+SI]	;moviendo el item a DL para reubicar despues
	mov		AH, 00		;limpiando residuo de iteracion anterior
	inc		SI		;SI++
        div     	BL              ;AX/BL  AL cociente, AH residuo
        cmp     	AH, 0           ;verificando si residuo es cero (par)
        jz      	par             ;realizar funcion par
	jne		impar		;realizar funcion impar

Exit:
	int     	20h

        section .data
arr     db      	1,2,3,4,5,6,7,8,9,0
cte     equ     	2

;Funciones
par:
	mov		DI, [200h]	;obtenemos contador de pares
        mov     	[300h+DI], DL   ;colocando pares
        inc		DI		;contador pares++
	mov		[200h], DI	;reubicando contador actualizado
        loop		Iterar	        ;itera y cx--
	call		Exit		

impar:
	mov		DI, [210h]	;obtenemos contador de impares
        mov     	[320h+DI], DL   ;colocando impares
        inc		DI		;contador impares++
	mov		[210h], DI	;reubicando contador actualizado
	loop		Iterar		;itera y cx--
	call		Exit