
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.model small
.code
main proc
   
    mov ax,0

    cmp ax,0

    JG greater
    JE equal
    JL smaller


    smaller:
    mov bx,-1
    jmp end

    equal:
    mov bx,0
    jmp end

    greater:
    mov bx,1
    jmp end
    end:
    
    main endp
end main

    
ret




