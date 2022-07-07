%include "io.inc"

extern _putchar                                         
extern _puts                                           
extern _printf                                         
extern ___main 

section .data
?_003:                                                 
        outStr: db "Mova o disco 1 da base %c para a base %c",0       

?_004:                                                  
        outStr1: db "Mova o disco %d da base %c para a base %c",0        
        
msg1:                                                  
        outStr2: db "OBS: Quanto maior o numero, maior o disco",0

section .text

global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
     push    ebp  ;backup de esp                                   
        mov     ebp, esp                                                        
        sub     esp, 32                                 
        call    ___main                                 
        mov     dword [esp+1CH], 4 ;declarando qtd discos                    
        mov     dword [esp],msg1                      
        call    _puts 
        NEWLINE
        ;letras referente as torres A, C, B 44 - 46                                          
        mov     dword [esp+0CH], 66                     
        mov     dword [esp+8H], 67                      
        mov     dword [esp+4H], 65                      
        mov     eax, dword [esp+1CH]                    
        mov     dword [esp], eax  ;passando parametro                    
        call    _hanoi                                       
        NEWLINE                                
        mov     eax, 0                                  
        leave                                           
        ret                                             
; Fim função main

        nop                      
_hanoi:
        push    ebp                                     
        mov     ebp, esp                                
        push    ebx                                     
        sub     esp, 36   ;$ 
        ;criando funcao hanoi com os parametros                             
        mov     ecx, dword [ebp+0CH]                    
        mov     edx, dword [ebp+10H]                    
        mov     eax, dword [ebp+14H]                          
        mov     byte [ebp-0CH], cl   
        mov     byte [ebp-10H], dl                      
        mov     byte [ebp-14H], al                      
        cmp     dword [ebp+8H], 1  ; compara se a qtd de torres == 1                     
        jnz     ?_001                                   
        movsx   edx, byte [ebp-10H]                     
        movsx   eax, byte [ebp-0CH]                     
        mov     dword [esp+8H], edx                     
        mov     dword [esp+4H], eax                     
        mov     dword [esp], ?_003                      
        call    _printf             
        NEWLINE                   
        jmp     ?_002                                   

;chama novamente a funçao hanoi empilhando os valores para por no parametro (até linha 82)
?_001:  movsx   ecx, byte [ebp-10H]                     
        movsx   edx, byte [ebp-14H]                     
        movsx   eax, byte [ebp-0CH]                     
        mov     ebx, dword [ebp+8H]                     
        sub     ebx, 1                                  
        mov     dword [esp+0CH], ecx                    
        mov     dword [esp+8H], edx                     
        mov     dword [esp+4H], eax                     
        mov     dword [esp], ebx                        
        call    _hanoi
        ;imprime as torres dinamicamente (ate linha 91)                                  
        movsx   edx, byte [ebp-10H]                     
        movsx   eax, byte [ebp-0CH]                     
        mov     dword [esp+0CH], edx                    
        mov     dword [esp+8H], eax                     
        mov     eax, dword [ebp+8H]                     
        mov     dword [esp+4H], eax                     
        mov     dword [esp], ?_004                      
        call    _printf                 
        NEWLINE
        ;chama novamente a função Hanoi com os parametros e decrementando "n"           
        movsx   ecx, byte [ebp-0CH]                     
        movsx   edx, byte [ebp-10H]                     
        movsx   eax, byte [ebp-14H]                     
        mov     ebx, dword [ebp+8H]                     
        sub     ebx, 1                                  
        mov     dword [esp+0CH], ecx                    
        mov     dword [esp+8H], edx                     
        mov     dword [esp+4H], eax                     
        mov     dword [esp], ebx                        
        call    _hanoi                                  
?_002:  add     esp, 36                                 
        pop     ebx                                     
        pop     ebp                                     
        ret 
          