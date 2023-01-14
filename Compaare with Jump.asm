
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.data

a dw 0Dh,"Equal Numbers! $"
b dw 0Ah,0Dh,"Not Equal Numbers! $"

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov al,10
    mov ah,5
    CMP al,ah
    
    JNE d
    JE  c
    
     d:
    mov dx,offset b
    mov ah,09
    int 21h
    jmp naeem
     c:
    mov dx,offset a
    mov ah,09
    int 21h
    naeem:
    
    

ret




