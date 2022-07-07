%include "io.inc"

extern _puts                                                                                    
extern _putchar                                         
extern _printf                                          
extern _scanf                                           
extern ___main 

section .text
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax

        push    ebp                                     
        mov     ebp, esp                                
        sub     esp, 192                                
        call    ___main                         
        mov     dword [esp+0BCH], -1 ;aux                  
        mov     dword [esp+98H], 0   ;aux2                
        mov     byte [esp+1BH], 97   ;inicialização do vetor alfabeto ate linha 46               
        mov     byte [esp+1CH], 98                    
        mov     byte [esp+1DH], 99                   
        mov     byte [esp+1EH], 100                   
        mov     byte [esp+1FH], 101                  
        mov     byte [esp+20H], 102                
        mov     byte [esp+21H], 103                 
        mov     byte [esp+22H], 104                 
        mov     byte [esp+23H], 105                  
        mov     byte [esp+24H], 106                   
        mov     byte [esp+25H], 107                 
        mov     byte [esp+26H], 108                 
        mov     byte [esp+27H], 109                    
        mov     byte [esp+28H], 110                    
        mov     byte [esp+29H], 111                     
        mov     byte [esp+2AH], 112                  
        mov     byte [esp+2BH], 113                   
        mov     byte [esp+2CH], 114                   
        mov     byte [esp+2DH], 115                   
        mov     byte [esp+2EH], 116                  
        mov     byte [esp+2FH], 117                  
        mov     byte [esp+30H], 118                  
        mov     byte [esp+31H], 119                   
        mov     byte [esp+32H], 120                
        mov     byte [esp+33H], 121                  
        mov     byte [esp+34H], 122                  
        mov     dword [esp+0B8H], 0                   
        jmp     ?_002                                  

;input da string
?_001:  lea     edx, [esp+35H]  ;calcula endereço do ponteiro do vetor e joga em edx                       
        mov     eax, dword [esp+0B8H] ;pega a letra que ta na posiçao [esp+0B8H] e joga em edx                
        add     eax, edx                              
        mov     dword [esp+4H], eax ;insere caracteres no vetor da "stringRemovida"                   
        mov     dword [esp], ?_023                   
        call    _scanf  ;chama função pra fazer o scanf
        
        ; passo 1 abaixo                               
        add     dword [esp+0B8H], 1 ;incrementa o indice do loop                 
?_002:  cmp     dword [esp+0B8H], 64 ;compara se o ponteiro é <= 64                  
        jle     ?_001  ;enquanto <= vai pro rotulo 001 que faz o scanf                               
        mov     dword [esp+0B4H], 0                    
        jmp     ?_005                                  

?_003:  cmp     dword [esp+0B4H], 17  ;verifica se ponteiro aponta a partir da 17º posicao da string                
        jle     ?_004                                  
        cmp     dword [esp+0B4H], 50  ;verifica se ja atingiu o limite da string (pos 50)                
        jg      ?_004                                 
        add     dword [esp+0BCH], 1   ;incrementa em 1  (aux)               
        lea     edx, [esp+35H]   ;calcula endereço do ponteiro do vetor                     
        mov     eax, dword [esp+0B4H]                  
        add     eax, edx                               
        movzx   eax, byte [eax]                        
        lea     ecx, [esp+76H]   ;pega o endereço em esp+76H e joga no ecx                    
        mov     edx, dword [esp+0BCH]                  
        add     edx, ecx                               
        mov     byte [edx], al                         
?_004:  add     dword [esp+0B4H], 1 ;incrementa "indice do for externo"                   
?_005:  cmp     dword [esp+0B4H], 65 ;verifica se esp+0B4H <= 65                    
        jle     ?_003  ;se linha 81 == true, sobe para 003                               
        mov     dword [esp], ?_024                     
        call    _printf                               
        mov     dword [esp+0B0H], 0                   
        jmp     ?_007 
                                      
;(Imprime questão A)
?_006:  lea     edx, [esp+76H]     ;calcula endereço                   
        mov     eax, dword [esp+0B0H]                  
        add     eax, edx                             
        movzx   eax, byte [eax] ;pega o byte do endereço e joga em eax                       
        movsx   eax, al ;move caracter pro eax                             
        mov     dword [esp], eax  ;poe o caracter no reg                    
        call    _putchar ;chama funcao que imprime caracter citado acima                          
        add     dword [esp+0B0H], 1   ;incrementa               
?_007:  cmp     dword [esp+0B0H], 32  ;verifica se valor do endereço é <= 32               
        jle     ?_006                                                         
        NEWLINE     
        mov     dword [esp], ?_025 ;imprime: A)                  
        call    _printf                               
        mov     dword [esp+0ACH], 31 ;inicio do indice do "for" questão B                 
        jmp     ?_009                                 

;Questão B
?_008:  lea     edx, [esp+76H]                        
        mov     eax, dword [esp+0ACH]                 
        add     eax, edx                              
        movzx   eax, byte [eax]                     
        movsx   eax, al                               
        mov     dword [esp], eax                        
        call    _putchar                               
        sub     dword [esp+0ACH], 1  ;decrementa em 1                   
?_009:  cmp     dword [esp+0ACH], 0  ;compara se valor do ponteiro é >=0                  
        jns     ?_008 ;enquanto linha 114 >=0 chama o 008                                       
        NEWLINE                             
        mov     dword [esp], ?_026                      
        call    _printf                                
        mov     dword [esp+0A8H], 0                    
        jmp     ?_012                                  

;Questão C
?_010:  lea     edx, [esp+76H]                       
        mov     eax, dword [esp+0A8H]                
        add     eax, edx                                
        movzx   eax, byte [eax]                      
        cmp     al, 32    ;compara se o valor do al é caracter vazio                            
        jz      ?_011     ;se a linha 129 conter o 32, chama rotulo 011                             
        lea     edx, [esp+76H]  ;calcula o endereço e joga no edx                       
        mov     eax, dword [esp+0A8H] ;pega o char do endereço e joga no eax                  
        add     eax, edx                               
        movzx   eax, byte [eax]                        
        movsx   eax, al                                 
        mov     dword [esp], eax                       
        call    _putchar   ;chama extern pra imprimir o char                           
?_011:  add     dword [esp+0A8H], 1  ;incrementa em 1                 
?_012:  cmp     dword [esp+0A8H], 31 ;verifica se o valor do reg <= 31                  
        jle     ?_010  ;chama rotulo que percorre o vetor para imprimir a string                               
        NEWLINE                            
        mov     dword [esp], ?_027                    
        call    _printf                               
        mov     dword [esp+0A4H], 0  ;inicio do loop do "for" da questao D                 
        jmp     ?_016   
                                      
;Questão D
?_013:  lea     edx, [esp+76H]                          
        mov     eax, dword [esp+0A4H]                   
        add     eax, edx                                
        movzx   eax, byte [eax]                         
        movsx   eax, al                                 
        mov     dword [esp+98H], eax ;aux2 recebendo o char                  
        mov     eax, dword [esp+0A4H]                   
        and     eax, 01H                           
        test    eax, eax   ;verifica se a posiçao atual e par ou impar                            
        jnz     ?_014      ;se for impar (retorna != 0) chama rotulo que imprime o char normalmente                            
        sub     dword [esp+98H], 32 ;se for posiçao par, subtrai o char que ta em aux2 por 32 e devolve em aux2                   
        mov     eax, dword [esp+98H] ;move o char pra eax                   
        mov     dword [esp], eax  ;eax joga o char na pilha e o imprime na linha abaixo                      
        call    _putchar                                
        jmp     ?_015                                   

?_014:  lea     edx, [esp+76H]                          
        mov     eax, dword [esp+0A4H]                   
        add     eax, edx                                
        movzx   eax, byte [eax]                         
        movsx   eax, al                                 
        mov     dword [esp], eax                        
        call    _putchar                                
?_015:  add     dword [esp+0A4H], 1                     
?_016:  cmp     dword [esp+0A4H], 31                   
        jle     ?_013                                  
        NEWLINE                                               
        mov     dword [esp], ?_028                      
        call    _puts                                   
        mov     dword [esp+0A0H], 0  ;indice do for externo                  
        jmp     ?_022 
                                           
;Questão E)
?_017:  lea     edx, [esp+76H]                         
        mov     eax, dword [esp+0A0H]                  
        add     eax, edx                               
        movzx   eax, byte [eax]                        
        mov     byte [esp+97H], al ;auxLetra recebe o char a ser comparado com 'alfabeto'                    
        mov     dword [esp+9CH], 0                     
        jmp     ?_020                                  

?_018:  lea     edx, [esp+1BH]                        
        mov     eax, dword [esp+9CH]                   
        add     eax, edx                               
        movzx   eax, byte [eax]                       
        cmp     al, byte [esp+97H]  ;verifica se o char é igual ao da posiçao atual do vetor alfabeto                   
        jnz     ?_019  ;se diferente, chama rotulo de incremento e segue o loop                              
        mov     eax, dword [esp+9CH]                  
        lea     edx, [eax+1H]                         
        movsx   eax, byte [esp+97H]                   
        mov     dword [esp+8H], edx ;insere a letra da string              
        mov     dword [esp+4H], eax ;insere pos do vetor alfabeto                   
        mov     dword [esp], ?_029                   
        call    _printf                               
        NEWLINE                              
        jmp     ?_021                                 

?_019:  add     dword [esp+9CH], 1                    
?_020:  cmp     dword [esp+9CH], 26                 
        jle     ?_018                               
?_021:  add     dword [esp+0A0H], 1                  
?_022:  cmp     dword [esp+0A0H], 31                
        jle     ?_017                             
        mov     eax, 0                              
        leave                                         
        ret                                        

        nop                                          
        nop                                        
        nop        
    ret


SECTION .data   
?_024:                                                  
        letra_A: db "A) ",0                           ; 0003 _ A) .

?_025:                                                 
        letra_B: db "B) ",0                           ; 0007 _ B) .

?_026:                                                  
        letra_C: db "C) ",0                           ; 000B _ C) .

?_027:                                                 
        letra_D: db "D) ",0                           ; 000F _ D) .

?_028:                                                 
        letra_E: db "E) ",0                           ; 0013 _ E) .

?_029:                                                  
          
        impressao: db "%c -> %d", 0                   ; 0017 _ %c -> %d
        db 00H                                          ; 001F _ .

?_023:                                                  
                               
        simbolo: db "%c", 0                           ; 0000 _ %c.
 


