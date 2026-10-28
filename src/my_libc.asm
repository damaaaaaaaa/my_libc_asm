
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
    push rcx
    push rdx
    push rsi 

    mov rbx, rdi
    mov r12, rbx 

    mov rcx, -1
    
.primo_controllo:
    cmp byte [rbx], 0
    je .fine 

    cmp byte [rbx], '%'
    jne .secondo_controllo
    jmp .verifica_parametro_uno


.secondo_controllo:
    cmp byte [rsb], '\'
    je .verifica_a_capo 
    jmp .leggi 


.verifica_a_capo:
    inc rbx 
    cmp byte [rsb]: 'n'
    jne .leggi 
    jmp .write 
    jmp .leggi 


.leggi:
    dex rcx 
    inc rbx 
    jmp .primo_controllo


.verifica_parametro_uno:
    inc rbx 
    dec rcx 

    cmp byte [rbx], 's'
    jne .verifica_parametro_due
    sub rbx, 2 
    jmp write 
    add rbx, 2 
    mov r12, rbx 
    jmp .stampa_stringhe
    jmp .leggi 


.verifica_parametro_due:
    cmp byte [rbx], 'd'
    jne .leggi
    sub rbx, 2
    jmp .write  
    add rbx, 2

    jmp .calcola_numero


.calcola_numero:
    mov r0, 0 
    mov rdx, 0

    pop rax 
    div rax, 10 
    add rdx, 48

    push rdx

    dec rcx
    inc r0
    jmp .salva_numero_buffer

    cmp rax, 0 
    jne .calcola_numero
    mov r10, buffer_stampa_numero
    jmp .salva_numero_buffer


.salva_numero_buffer:
    cmp r0, 0 
    je .stampa_numero

    pop rax 

    mov byte [r10], al

    inc r10 
    dec r0

    jmp .salva_numero_buffer
    

.stampa_numero:
    mov rdi, 1 
    mov rsi, buffer_stampa_numero
    mov rdx, r10 

    mov rax, WRITE 
    syscall 


.stampa_stringhe:
    pop rdi 
    call my_strlen

    mov rdx, rax 
    mov rsi, rdi 
    mov rdi, 1

    mov rax, WRITE 
    syscall

    mov r12, rbx
    inc rbx
    dec rcx 


.write:
    mov rsi, r12 
    mov rdx, rbx 
    sub rdx, r12 

    mov rax, WRITE 
    syscall 

    inc rbx
    mov r12, rbx 
    dec rcx 

.fine:
    mov rsi, r12 
    mov rdx, rbx 
    sub rdx, r12 

    mov rax, WRITE 
    syscall 

    mov rax, -2 
    sub rax, rcx 
    ret 





    


    
    







