# Establecer las constantes
    .data
num1_prompt: .asciiz "Ingrese el primer número: "
num2_prompt: .asciiz "Ingrese el segundo número: "
num3_prompt: .asciiz "Ingrese el tercer número: "
resultado_prompt: .asciiz "El número mayor es: "

    .text
    .globl main

main:
    # Imprimir los mensajes de entrada
    la $a0, num1_prompt
    li $v0, 4
    syscall

    # Leer el primer número
    li $v0, 5
    syscall
    move $t0, $v0

    la $a0, num2_prompt
    li $v0, 4
    syscall

    # Leer el segundo número
    li $v0, 5
    syscall
    move $t1, $v0

    la $a0, num3_prompt
    li $v0, 4
    syscall

    # Leer el tercer número
    li $v0, 5
    syscall
    move $t2, $v0

    # Comparar los números
    move $t3, $t0 # Asignar el primer número como mayor por defecto
    ble $t1, $t0, compare1
    move $t3, $t1
compare1:
    ble $t2, $t3, imprimir_resultado
    move $t3, $t2

imprimir_resultado:
    # Imprimir el resultado
    la $a0, resultado_prompt
    li $v0, 4
    syscall

    move $a0, $t3
    li $v0, 1
    syscall

    # Salir del programa
    li $v0, 10
    syscall