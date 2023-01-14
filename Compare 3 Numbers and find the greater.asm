
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.data 

s1 dw "1st Number is Larger! $"
s2 dw "2nd Number is Larger! $"
s3 dw "3rd Number is Larger! $"

A db 40h
B db 5h
C db 20h
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    mov al,A
    mov ah,B
    
    CMP al,ah
    
    jc  e
    
    jnc f
    
    e:  
    
    Cmp ah,C
    jc  g
    jnc i
    
    g:
    mov dx,offset s3
    mov ah,09
    int 21h
    jmp ans
    
    i:
    mov dx,offset s2
    mov ah,09
    int 21h
    jmp ans
    
    f:
    Cmp al,C
    jc  j
    jnc k
    j:
    mov dx,offset s3
    mov ah,09
    int 21h
    jmp ans
    
    k:
    mov dx,offset s1
    mov ah,09
    int 21h
    jmp ans
    ans:
    
ret




