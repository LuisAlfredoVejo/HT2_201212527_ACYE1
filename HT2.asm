.model small
.stack 64
.data

numero1 db 0
numero2 db 0
division db 0
residuo db 0

msg1 db 10,13, "Ingrese el primer numero: " , '$'
msg2 db 10,13, "Ingrese el segundo numero: " , '$'
msg3 db 10,13, "Resultado: " , '$'

.code
begin proc far
mov ax, @data
mov ds, ax

mov ah, 09
lea dx, msg1
int 21h
mov ah, 01
int 21h
sub al, 30h
mov numero1, al

mov ah, 09
lea dx, msg2
int 21h
mov ah, 01
int 21h
sub al, 30h
mov numero2, al

mov al, numero1
div numero2
mov division, al

mov al, numero1
div numero2
mov residuo, ah

mov ah, 09
lea dx, msg3
int 21h
mov dl, residuo
add dl, 30h
mov ah, 02
int 21h

mov ah, 4ch
int 21h

begin endp
end


