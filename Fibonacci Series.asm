

;REMINDER! CHANGE CODE A LITTLE BIT THANKS!
;NAEEM UR RAHMAN SAJID



.model small
.data
S1  dw 0AH,0DH,"Enter the Number : $"
YES dw 0AH,0DH,"Yes, This Number is Fibacconi Series !$"
NO  dw 0AH,0DH,"No,  This Number is not in Fibacconi series!$"
.code
main proc   
    
    ;Generate the fibonacci series in memoey
    
    MOV AL,0H
    MOV SI,400H
    
    MOV [SI],AL
    
    INC SI
    ADD AL,01H
    MOV [SI],AL
    
    MOV CX,10H
    SUB CX,02H
    
    L:
    MOV AL,[SI-1]
    ADD AL,[SI]
    
    INC SI
    MOV [SI],AL
    LOOP L
    
    
    ;Check the number is in fibonacci series or not
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV DX,OFFSET S1
    MOV AH,09H
    INT 21H
    
    MOV AH,01
    INT 21H
    
    MOV DL,AL
    SUB DL,30H
    
    MOV CX,10H
    MOV SI,400H
    
    M:
    CMP DL,[SI]
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


