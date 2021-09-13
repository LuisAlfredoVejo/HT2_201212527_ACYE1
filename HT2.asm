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
        div bl ;se dividen las listas que estan en ax/bl

        mov residuo, ah ;se almacena el residuo de la division en ah ya que ahi es donde lo manda div
        cmp residuo, 0h ; verificamos si el residuo es 0 ya que asi se sabe si es divisible o no
        je segundoCiclo ;si es 0 se salta al ciclo 2
        jne tercerCiclo ; si es diferente de 0 se salta al ciclo 3
    
    segundoCiclo: ;inicio del ciclo 2
        imprimir msg3 ;se imprime mensaje "Divisible"
        jmp cuartoCiclo ;se salta al ciclo 4
    
    tercerCiclo: ;inicio del ciclo 3
        imprimir msg4 ;se imprime mensaje "No Divisible"
        jmp cuartoCiclo ;se salta al ciclo 4

    cuartoCiclo: ;inicio del ciclo 4
        inc si
        inc si ;se incrementa 2 veces si ya que se usa un tipo dw 
        inc di
        inc di ;se incrementa 2 veces di ya que se usa un tipo dw
        inc cl ;se incrementa 1 el contador cl 

        jmp CicloGeneral ;regresamos al inicio del ciclo que maneja toda la division
    
    finprimerCiclo: ;se termina el ciclo 1
        close ;se cierra el programa con el macro close

begin endp
end

