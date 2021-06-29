;Programa acceso con clave

;Main
	org	100h

	section	.text

	;Print mensaje inicial
	mov	DX, msg1
	call	EscribirCadena

	;Input password
	mov	BP, frase
	call	LeerCadena

	mov	BX, 00
	mov word	CX, 07d
Check:
	mov	AL,  [frase+BX]
	mov	DL,  [password+BX]
	cmp	AL, DL
	jne	Falla
	inc	BX
	loop	Check

	mov	BP, msg2
	call	EscribirCadena
	call	Salir

Falla:
	mov	BP, msg3
	call	EscribirCadena
	call	Salir

Salir:
	call	EsperarTecla
	int 	20h

	section	.data
password db	"12345", "$"
msg1	db	"Ingresa la contraseña: ", "$"
msg2 	db 	"BIENVENIDO", "$"
msg3	db	"INCORRECTO", "$"
frase 	times 	7  	db	" "

;Funciones

EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret

EscribirCadena:
	mov 	AH, 09h
	int 	21h
	ret	

LeerCadena:
        xor     SI, SI          ; SI = 0
while:  
        call    EsperarTecla    ; retorna un caracter en AL
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      exit            ; si AL == EnterKey, saltar a exit
        mov     [BP+SI], AL   	; guardar caracter en memoria
        inc     SI              ; SI++
        jmp     while           ; saltar a while
exit:
	mov 	byte [BP+SI], "$"	; agregar $ al final de la cadena
        ret