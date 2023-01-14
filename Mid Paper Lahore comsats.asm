
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.data
A db 2
B db 5
C db 4
D db 4
sA dw "A is Greater $ " 
sB dw "B is Greater $ "
sC dw "C is Greater $ "
.code
main proc
    mov ax,@data
    mov ds,ax
    
    ;Part A
    
    ; mov all values in registers
    mov al,A
    mov bl,B
    mov cl,C
    mov dl,D
    
    ;if (A<B)
    cmp al,bl
    
    Jl AlessB
    
    AlessB:
    ;if (B>C || A<C)
    cmp cl,bl
    Jl ClessB
    
    cmp al,dl
    Jl AlessD
    
    ClessB:
    AlessD:
    ;if (C<=D)
    
    cmp dl,cl
    JGE ClessD
    
    ClessD:
    
    ;D = 2A + 2(C-D)+6B
    mov ah,C
    mov al,D
    sub ah,al
    mov al,ah
    mov bh,2
    mul bh
    mov D,al
    mov al,A
    mov bh,2
    mul bh
    Add al,D
    mov D,al
    mov al,B
    mov bh,6
    mul bh
    add al,D
    mov D,al
    
    ; A=-A
    mov al,A
    neg al
    mov A,al
    
    ;Part b
    
    
    mov al,A
    mov bl,B
    mov cl,C
    mov dl,D
    
    ;if (A>B && A>C)
    cmp bl,al
    Jl Ag1
    
    ;else if(B>A && B>C)
    cmp al,bl
    Jl Bg1
    
    Ag1:
    cmp cl,al
    Jl Ag2
    Ag2:
    mov dx,offset sA
    mov ah,09h
    int 21h
    jmp end
    
    Bg1:
    cmp cl,bl
    Jl Bg2
    
    ;else
    mov dx,offset sC
    mov ah,9h
    int 21h
    jmp end 
    
    Bg2:
    mov ax,0h
    mov dx,offset sB
    mov ah,9h
    int 21h
    jmp end
    
    
    
    end: 
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
    
    mov al,A
    mov bl,B
    mov cl,C
    mov dl,D
    main endp
end main


ret




