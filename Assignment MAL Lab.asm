
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


.model small 
.data

A   db ?
B   db ?
Ans db ?
c   dw  0DH,0AH,"Enter the Value for 'A' : $"
d   dw  0DH,0AH,"Enter the Value for 'B' : $"
e   dw  0DH,0AH,"Answer for ((30-5)*(A-12))/B is : $"
.code
main proc
    
    ;Creating the path between data and code segments
    mov ax,@data
    mov ds,ax
    
    ;Printing the string c
    mov dx,offset c
    mov ah,09
    int 21h
    
    ;input value A
    mov ah,01
    int 21h
    mov A,al    
    sub A,30h
    
    ;Printing the string d
    mov dx,offset d
    mov ah,09
    int 21h
    
    ;input value B
    mov ah,01
    int 21h
    mov B,al
    sub B,30h
    ;(30+5)
    mov ah,1Eh
    add ah,05h
    mov ans,ah
    
    ;(A-12)
    mov al,A
    mov ah,0Ch
    sub al,ah 
    mov ah,0h
    
    ;(30-5)*(A-12)
    mul ans
    
    ; ((30-5)*(A-12))/B
    div B
    
    AAM
    
    mov cl,al
    mov ch,ah
    
    ;Printing the string e
    mov dx,offset e
    mov ah,09
    int 21h
    
    ;Printing output Answer
    mov dl,ch
    add dl,30h
    mov ah,02
    int 21h
    mov dl,cl
    add dl,30h
    mov ah,02
    int 21h 
    main endp
end main
ret




