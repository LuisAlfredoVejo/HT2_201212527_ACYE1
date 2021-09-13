;--------------------------------------MACROS------------------------------------------
imprimir macro buffer ;imprime cadena
    mov ax, @data
    mov ds, ax
    mov ah, 09h
    mov dx, offset buffer
    int 21h
endm

;-----------------------------------Programa-------------------------------------------
.model small
.stack 64 
.data

lista1 dw 20, 50, 98, 54, 35, 789, 415, 347, 500, 600 
lista2 dw 10, 5, 2, 5, 7, 63, 11, 21, 50, 60
msg1 db 10,13, "|-----Luis Vejo - 201212527 - HT2-----|$"
msg2 db 10,13, "|       Division de las listas        |$"

.code
begin proc far

    imprimir msg1
    imprimir msg2
    
begin endp
end

