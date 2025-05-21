
_start:
    LDR r1, =array    // Carga direccion base del arreglo en r1
    LDR r2, =y      // Carga la direccion de 'y' en r2
    LDR r2, [r2]   // Carga valor de 'y' desde memoria
    MOV r0, #0     // Inicializa el indice i = 0

loop_start:
    CMP r0, #10   // Compara indice i con 10 (longitud del arreglo)
    BGE loop_end   // i >= 10 termina el loop

    LDR r3, [r1, r0, LSL #2] // Cargar array[i] en r3 (cada elemento ocupa 4 bytes)

    CMP r3, r2              // Comparar array[i] con y
    BLT do_add         // Si array[i] < y, va a la rama de suma

    // Multiplicacion: array[i] = array[i] * y
    MUL r4, r3, r2          // r4 = array[i] * y
    STR r4, [r1, r0, LSL #2] // Guardar el resultado en array[i]
    B next_iter     // Ir a la siguiente iteracion

do_add:
    // Suma: array[i] = array[i] + y
    ADD r4, r3, r2          // r4 = array[i] + y
    STR r4, [r1, r0, LSL #2] // Guardar el resultado en array[i]

next_iter:
    ADD r0, r0, #1   // Incrementa indice i
    B loop_start     // Vuelve al inicio del loop

loop_end:
    // Salir del programa
    MOV r7, #1              
    MOV r0, #0              
    SWI 0  // Interrupción para salir

    .section .data    
array:
    .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 // Array de ejemplo
y:
    .word 10  // var y