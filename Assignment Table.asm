
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.data 

value dw "Enter the value : $ "
nline dw 0AH,0DH,"$"

print1 dw " X $"
print2 dw " = $"

table db 01,02,03,04,05,06,07,08,09,10
num db ?

.code
main proc
    mov AX,@data
    mov DS,AX
    
    mov dx, offset value
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    
    mov num,al
    
    mov bl,al  
    sub bl,30h
    mov cx,0Ah
    mov SI,offset table
    
    
    
    M:
    
    call newline
    call number
    call print
    
    
    mov AX,0h
    mov DX,0h
    mov AL,[SI]
    
    INC SI
    MUL BL
    AAM
    
    mov DL,AH
    mov BH,AL
    
    
    ADD DL,30h
    MOV AH,02
    INT 21h
    
    mov DL,BH
    
    ADD DL,30h
    MOV AH,02
    INT 21h
    
    loop M
    
    
    
    newline:
    mov dx, offset nline
    mov ah,09
    int 21h
    ret
    
    number:
    mov dl,num
    mov ah,02
    int 21h
    ret
    
    print:
    mov dx, offset print1
    mov ah,09
    int 21h
    
    mov dl,[SI]
    add dl,30h
    mov ah,02
    int 21h
    
    mov dx, offset print2
    mov ah,09
    int 21h
    ret
    main endp
end main
    
    
ret




