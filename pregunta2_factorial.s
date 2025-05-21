.global _start
// Calculo de factorial de n! 
_start:

mov r0, #1 // resultado
mov r1, #5 // valor de n, n=5

loop:

cmp r1, #1 //compara r1 (n) con 1
ble _end   // termina si r1(n) es = 1
mul r0, r1 //multiplicacion resultado = resultado*n
sub r1, r1, #1 // n = n - 1
bal loop

_end:
mov r7, #1 //return de int
swi #0	// interrupcion para terminar