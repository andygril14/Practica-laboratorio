# Imprimir mensaje de inicio
li $v0, 4
la $a0, fib_msg
syscall

# Calcular serie de Fibonacci
li $t0, 0 # t0 = 0
li $t1, 1 # t1 = 1
li $t2, 0 # contador = 0

.loop:
    bgt $t2, 5, .done # si contador > 5, salta a la etiqueta .done
    move $a0, $t0 # carga el valor de t0 en el registro $a0 para imprimir
    li $v0, 1 # código de servicio para imprimir un entero
    syscall
    add $t0, $t1, $t0 # t0 = t1 + t0
    move $t1, $a0 # t1 toma el valor anterior de t0
    addi $t2, $t2, 1 # incrementa el contador en 1
    j .loop # salta a la etiqueta .loop

.done:
    # Salir del programa
    li $v0, 10 # código de servicio para salir del programa
    syscall

.data
fib_msg: .asciiz "La serie de Fibonacci hasta el número 5 es: "