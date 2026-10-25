
global my_strlen 

EXIT    equ 60

section .text 

my_strlen:
    cld 
    xor al, al 
    mov rcx,-1  
    repne scasb 
    mov rax, -2 
    sub rax, rcx 
    ret  

 



