

;REMINDER! CHANGE CODE A LITTLE BIT THANKS!
;NAEEM UR RAHMAN SAJID



.model small
.data
S1  dw 0AH,0DH,"Enter the Number : $"
YES dw 0AH,0DH,"Yes, This Number is Fibacconi Series !$"
NO  dw 0AH,0DH,"No,  This Number is not in Fibacconi series!$" 
series db 100 
.code
main proc   
    
    MOV AX,@DATA
    MOV DS,AX
    ;Generate the fibonacci series in memoey
    
    MOV AL,0H
    MOV SI,offset series
    
    MOV [SI],AL
    
    INC SI
    ADD AL,01H
    MOV [SI],AL
    
    MOV CX,0AH
    SUB CX,02H
    
    L:
    MOV AL,[SI-1]
    ADD AL,[SI]
    
    INC SI
    MOV [SI],AL
    LOOP L
    ; print series
    
    mov cl,0Ah
    MOV SI,offset series
    nloop:
    
    
    mov al,[si]
    AAM
    mov dl,ah
    mov bl,al
    add dl,30h
    mov ah,02
    int 21h
    mov dl,bl
    add dl,30h
    mov ah,02
    int 21h
    inc si
    
    loop nloop
    
    ;Check the number is in fibonacci series or not
    
   
    
    MOV DX,OFFSET S1
    MOV AH,09H
    INT 21H
    
    MOV AH,01
    INT 21H
    
    MOV BL,AL
    SUB BL,30H
    
    MOV CX,0AH
    MOV SI,offset series
    
    M:
    MOV BH,[SI]
    CMP BL,BH
    JE N 
    INC SI
    
    LOOP M
    
    MOV DX,OFFSET NO
    MOV AH,09H
    INT 21H
    JMP END
    
    N:
    MOV DX,OFFSET YES
    MOV AH,09H
    INT 21H
    
    END:
    HLT
    
    main endp
end main


