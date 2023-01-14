.model small
.stack 100h
.data
filename dw "Naeem.txt",0
fileaddress dw ?
mydata dw 80h  DUP($)

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,3CH
    mov dx,offset filename
    mov cl,0h
    int 21h
    
    mov fileaddress ,ax
    mov si,offset mydata
    mov cx,0h
    
    again:
    
    mov ah,01
    int 21h
    
    cmp al,13
    
    JE end
    
    mov [SI],al
    inc si
    inc cx
    JMP again
    
    end:
    
    mov ah,3DH
    mov dx,offset filename
    mov al,02
    int 21h
    
    mov fileaddress,ax
    
    mov ah,40h
    mov dx,offset mydata
    mov bx,fileaddress
    int 21h
    
    
    