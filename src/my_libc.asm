
global my_strlen, my_strcpy

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

    

    







