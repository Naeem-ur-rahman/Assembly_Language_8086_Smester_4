
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.data

print dw "Enter the Hex value (0-9) : $"

ans dw "You Enter value in decimal is = $"

newline dw 0Ah,0Dh,"$"

input dw 0Ah,0Dh,"Invalid Input $"

useagain dw "Do you want to use it again ? : $"

.code
main proc
    mov ax,@data
    mov ds,ax
    
    again:
    
    mov dx,offset print
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    
    mov bl,al
    
    cmp al,2Fh
    jg yes
    
    jle invalid
    
    yes:
    
    cmp al,3Ah
    
    jl yesagain
    
    jge invalid 
    
    invalid:
    
    cmp al,'A'
    jge yeshex
    jl Invalidfinal 
    
    yeshex:
    cmp al,'F'
    jle yeshexagain
    jg invalidFinal
    
    yeshexagain:
    call new
 
    mov dx,offset ans
    mov ah,09
    int 21h
    
    mov dx,0h
    mov dl,'1'
    mov ah,02
    int 21h
    
    mov dl,bl
    sub dl,11h
    mov ah,02
    int 21h
    jmp askuser
    
    Invalidfinal:
    
    mov dx,offset input
    mov ah,09
    int 21h 
    call new
    jmp again
    
    yesagain:
    
    call new
 
    mov dx,offset ans
    mov ah,09
    int 21h
    
    mov dx,0h
    mov dl,bl
    
    mov ah,02
    int 21h
    
    askuser:
    
    call new
    
    mov dx,offset useagain
    mov ah,09
    int 21h
    
    mov ah,01
    int 21h
    mov bh,al
    
    call new
    
    cmp bh,'y'
    Je again
    
    cmp bh,'Y'
    Je again
    
    JMP end
    
    
    new:
    mov dx,offset newline
    mov ah,09
    int 21h
    ret
    
    end:
    
    
    
    
        
ret




