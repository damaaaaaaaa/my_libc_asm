
global my_strlen, my_strcpy, my_memcpy, my_strncpy 
global my_printf

WRITE equ 1 

section .bss 
    buffer_stampa_numero resb 32 

section .text 


my_strlen:
    cld 

    xor al, al 
    mov rcx,-1  
    repne scasb 
    mov rax, -2 

    sub rax, rcx 
    ret  


my_strcpy:
   mov rax, rdi 

.copy_loop:
    mov cl, byte [rsi]
    mov byte [rdi], cl 

    inc rsi 
    inc rdi 

    cmp cl, 0 
    jne .copy_loop

    ret 

    
my_memcpy:
    mov rax, rdi 
    mov rcx, rdx 

    rep movsb 

    ret 
    
    
my_strncpy:
   mov rax, rdi 

.ncopy_loop:
    cmp rdx, 0 
    je .esci 
    dec rdx
    mov cl, byte [rsi]
    mov byte [rdi], cl 
    

    inc rsi 
    inc rdi 

    cmp cl, 0 
    jne .ncopy_loop

.esci:
    ret





my_printf:
    push rbp
    mov rbp, rsp

    push rcx
    push rdx
    push rsi 

    mov rbx, rdi
    mov r12, rbx 

    mov r13, -1
    
.controllo:
    cmp byte [rbx], 0
    je .fine 

    cmp byte [rbx], '%'
    je .verifica_parametro_uno

    cmp byte [rbx], 10
    je .salto_a_write

    jmp .leggi 


.salto_a_write:
    inc rbx
    call .write
    mov r12, rbx
    jmp .leggi 


.verifica_a_capo:
    inc rbx 
    cmp byte [rbx], 'n'
    jne .leggi 

    call .write 
    inc rbx 
    dec rbx 

    jmp .leggi 


.leggi:
    dec r13 
    inc rbx 
    jmp .controllo


.verifica_parametro_uno:
    inc rbx 
    dec r13 

    cmp byte [rbx], 's'
    jne .verifica_parametro_due

    sub rbx, 2 
    call .write 
    add rbx, 2 
    mov r12, rbx

    jmp .stampa_stringhe
    jmp .leggi 


.verifica_parametro_due:
    cmp byte [rbx], 'd'
    jne .leggi
    sub rbx, 2

    call .write  
    add rbx, 2 
    inc rbx 
    mov r12, rbx 

    jmp .calcola_numero


.calcola_numero:
    mov r8, 0
    pop rax
    mov r11, 10


.loop_calcola_numero:
    mov rdx, 0

    div r11 
    add rdx, 48

    push rdx

    dec r13
    inc r8

    cmp rax, 0 
    jne .loop_calcola_numero

    mov r10, buffer_stampa_numero
    mov r9, r8


.salva_numero_buffer:
    cmp r8, 0 
    je .stampa_numero

    pop rax 

    mov byte [r10], al

    inc r10 
    dec r8

    jmp .salva_numero_buffer
    

.stampa_numero:
    mov rdi, 1 
    mov rsi, buffer_stampa_numero
    mov rdx, r9 

    mov rax, WRITE 
    syscall 

    jmp .leggi


.stampa_stringhe:
    pop rdi 
    mov r14, rdi 
    call my_strlen

    mov rdx, rax 
    mov rsi, r14 
    mov rdi, 1

    mov rax, WRITE 
    syscall

    inc rbx
    mov r12, rbx
    dec r13 

    jmp .leggi


.write:
    mov rdi, 1
    mov rsi, r12 
    mov rdx, rbx 
    sub rdx, r12 

    mov rax, WRITE 
    syscall 
    ret 

.fine:
    mov rdi, 1
    mov rsi, r12 
    mov rdx, rbx 
    sub rdx, r12 

    mov rax, WRITE 
    syscall 

    mov rax, -2 
    sub rax, r13

    mov rsp, rbp 
    pop rbp
    ret 





    


    
    







