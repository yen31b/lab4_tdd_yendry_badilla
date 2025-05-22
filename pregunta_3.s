.global _start

_start:
    MOV R0, #0            
    LDR R1, =0x2000       // Direccion del contador
    STR R0, [R1]          // Guardar 0 en direccion 0x2000

    LDR R8, =0x1000       // Direccion del teclado
    LDR R2, =0xE048       // Codigo de flecha arriba
    LDR R3, =0xE050       // Código de flecha abajo
    LDR R10, =1000000     // Valor para el retardo

    
    LDR R9, =0xE030       // Primer valor
    STR R9, [R8]          // Escritura inicial en 0x1000

loop:
    LDR R4, [R8]          // Leer valor de la tecla en R4
    MOV R7, R4            
    LDR R5, [R1]          // Leer valor actual del contador en R5

    CMP R4, R2            // Prueba si la flecha es la de arriba
    BEQ up                

    CMP R4, R3            // Prueba si la flecha es la de abajo
    BEQ down               

    B loop                

up:
    ADD R5, R5, #1        
    STR R5, [R1]          // Guardar nuevo valor
    MOV R7, R5            // Ver nuevo valor en R7
    B loop

down:
    SUB R5, R5, #1        
    STR R5, [R1]          
    MOV R7, R5            
    B loop