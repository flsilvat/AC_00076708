	org	100h

	section .text

;Escribiendo iniciales de nombre FLST
	mov	byte [200h], "F"
	mov	byte [201h], "L"
	mov	byte [202h], "S"
	mov	byte [203h], "T"

;Copiar el valor de 200h a AX usando direccionamiento directo.
	mov	AX, [200h]

;Copiar el valor de 201h a CX usando direccionamiento indirecto por registro.
	mov	BX, 201h
	mov	CX, [BX]

;Copiar el valor de 202h a DX usando direccionamiento indirecto base más índice.
	mov	BX, 202h
	mov	DX, [BX+DI]

;Copiar el valor de 203h a DI usando direccionamiento relativo por registro.
	mov	DI, [DI+203h]

	int     20h