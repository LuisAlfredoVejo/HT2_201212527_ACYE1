;--------------------------------------MACROS------------------------------------------
imprimir macro buffer ;imprime cadena
    mov ax, @data
    mov ds, ax
    mov ah, 09h
    mov dx, offset buffer
    int 21h
endm

close macro
    mov ah, 4ch
    xor al, al
    int 21h
endm

;-----------------------------------Programa-------------------------------------------
.model small
.stack 64 
.data

lista1 dw 20, 50, 98, 54, 35, 789, 415, 347, 500, 600  ;Lista 1 con sus valores
lista2 dw 10, 5, 2, 5, 7, 63, 11, 21, 50, 60           ;Lista 2 con sus valores
residuo db 0    ;residuo al realizar la division

;----------------Mensajes de Texto para mostrar----------------------------------------

msg1 db 10,13, "|-----Luis Vejo - 201212527 - HT2-----|$"
msg2 db 10,13, "|       Division de las listas        |$"
msg3 db 10,13, "|--------------Divisible--------------|$"
msg4 db 10,13, "|-------------No-Divisible------------|$"

;-------------------------Inicio del programa------------------------------------------

.code
begin proc far

xor cx, cx  
mov si, offset lista1 ;se mueve a si la lista 1
mov di, offset lista2 ;se mueve a di la lista 2
mov cl, 0 ;se inicializa cl en 0 porque se usa como contador

imprimir msg1 ;se imprime el mensaje 1 con el macro de imprimir
imprimir msg2 ;se imprime el mensaje 2 con el macro de imprimir

CicloGeneral: ;inicia el ciclo que maneja toda la division de las listas

    cmp cl, 10 ;comparamos el valor de cl con 10
    jl primerciclo ; si el valor de cl es menor a 10 salta al ciclo 1
    jmp finprimerCiclo ;si el valor de cl es mayo a 10 se termina el ciclo 1
    
    primerCiclo: ;inicio del ciclo 1

        xor ax, ax ;se limpia el registro ax para que este vacio al momento de iniciar el programa
        xor bx, bx ;se limpia el registro bx para que este vacio al momento de iniciar el programa

        mov ax, [si] ;movemos a ax la lista 1 desde la posicion 0
        mov bl, [di] ;movemos a bl la lista 2 desde la posicion 0
        div bl ;

        mov residuo, ah
        cmp residuo, 0h 
        je segundoCiclo
        jne tercerCiclo
    
    segundoCiclo:
        imprimir msg3
        jmp cuartoCiclo
    
    tercerCiclo:
        imprimir msg4
        jmp cuartoCiclo

    cuartoCiclo:
        inc si
        inc si
        inc di
        inc di
        inc cl

        jmp CicloGeneral
    
    finprimerCiclo:
        close

begin endp
end

