section .data

msg db "\int_0^2 (4+3x-3x^2) \,dx",0Dh,0Ah,'$0'
leng1 equ $ - msg ;Longitud del mensaje

msg3 db 0Dh,0Ah, "4x= ",'$0'
leng3 equ $ - msg3

msg4 db 0Dh,0Ah,"3/2 x^2= ",'$0'
leng4 equ $ - msg3

msg5 db 0Dh,0Ah,"x^3= ",'$0'
leng5 equ $ - msg3

msg2 db "la integral es:4x+((3x^2)/2)-((3x^3)/3)",'$0'
leng2 equ $ - msg2

msg6 db 0Dh,0Ah, "RESULTADO: ",'$0'
leng6 equ $ - msg2

segment .bss
v1 resb 1
res1 resb 1
v2 resb 1
v3 resb 1
resultado resb 2

section .text  ;indica el cuerpo del programa
global _start  ;para especificar cual ee el main
_start:

mov ah,09 ;instruccion para imprimir en pantalla
mov dl, msg ;Pongo en dl el número a imprimir
int 21h ;interrupcion pantalla

mov ah,09 ;instruccion para imprimir en pantalla
mov dl, msg2 ;Pongo en dl el número a imprimir
int 21h ;interrupcion pantalla
;----------ECUACION UNO-------------------------
mov al,4
mov bl,2
mul bl

mov ah,09 ;instruccion para imprimir en pantalla
mov dl, msg3 ;Pongo en dl el número a imprimir
int 21h ;interrupcion pantalla

add al, 30h

     ; paso el resultado de la suma a caracter



mov [v1],al
mov ah,	0x0E	; imprimir lo que esta en al

int 0x10


int 21h ;interrupcion pantalla
;----------ECUACION DOS-------------------------
mov al,2
mov bl,2
mul bl ;mult al=al*bl
mov bl,3
mul bl 
mov bl,2
div bl  

mov ah,09 ;instruccion para imprimir en pantalla
mov dl, msg4 ;Pongo en dl el número a imprimir
int 21h ;interrupcion pantalla

add al, 30h

     ; paso el resultado de la suma a caracter



mov [v2],al
mov ah,	0x0E	; imprimir lo que esta en al

int 0x10


int 21h ;interrupcion pantalla

;----------ECUACION TRES-------------------------
mov al,2
mov bl,2
mul bl
mov bl,2
mul bl

mov ah,09 ;instruccion para imprimir en pantalla
mov dl, msg5 ;Pongo en dl el número a imprimir
int 21h ;interrupcion pantalla

add al, 30h

     ; paso el resultado de la suma a caracter



mov [v3],al
mov ah,	0x0E	; imprimir lo que esta en al

int 0x10


int 21h ;interrupcion pantalla
;----------operaciones-------------------------

mov bl,[v1]
mov al,[v2]
mov cl,[v3]

add bl,al
sub bl,cl

mov ah,09 ;instruccion para imprimir en pantalla
mov dl, msg6 ;Pongo en dl el número a imprimir
int 21h ;interrupcion pantalla

mov [resultado],al
mov ah,	0x0E	; imprimir lo que esta en al

int 0x10


int 21h ;interrupcion pantalla

salida: 
mov ah,00h	
int 21h	