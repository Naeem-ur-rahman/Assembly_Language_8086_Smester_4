
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.stack 100h
.data

filename dw "Naeem.txt",0
fileaddress dw ?
a db "Boaring Lab$"
b dw 100 DUP($)

.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;mov ah,3ch
    ;mov dx,offset filename
    ;mov cl,0
    ;int 21h
    
    
    mov ah,3dh
    mov dx,offset filename
    mov al,02
    int 21h
    
    mov fileaddress ,ax
    
    
    mov si,offset b
    mov cx,0
    
    again:
    
    mov ah,01
    int 21h
    cmp al,13
     
    
    Je exit
    
    mov [si],al
    inc si
    inc cx
    
    jmp again
    
    exit:
    
    mov ah, 40h
     
    
    mov bx,fileaddress
    mov dx,offset b
    int 21h 
    


ret




