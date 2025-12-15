.text

# ========================================================================
# TELA DE SPLASH (Intro) - MANTIDA
# ========================================================================
main:
    # 1. Configura Base do Display
    lui $t0, 0x1001         # Base do Display
    
    # 2. Limpa a tela (Fundo Preto)
    addi $t1, $0, 0x000000  # Cor Preta
    addi $t2, $0, 8192      # Total pixels (128x64)
    add  $t3, $t0, $0       # Copia endereço base
loop_clear_splash:
    beq $t2, $0, desenha_texto_splash
    sw $t1, 0($t3)
    sw $t1, 32768($t3)      # Shadow Buffer
    addi $t3, $t3, 4
    addi $t2, $t2, -1
    j loop_clear_splash

desenha_texto_splash:
    # --- TÍTULO: ASTEROIDS (Vermelho) ---
    addi $a1, $0, 0xFF0000  # Cor Vermelha
    addi $a0, $t0, 14476    # Posição Centro-Cima
    
    jal draw_A
    addi $a0, $a0, 16
    jal draw_S
    addi $a0, $a0, 16
    jal draw_T
    addi $a0, $a0, 16
    jal draw_E
    addi $a0, $a0, 16
    jal draw_R
    addi $a0, $a0, 16
    jal draw_O
    addi $a0, $a0, 16
    jal draw_I
    addi $a0, $a0, 16
    jal draw_D
    addi $a0, $a0, 16
    jal draw_S

    # --- SUBTÍTULO: BY CHAD AND AVILA (Branco) ---
    addi $a1, $0, 0xFFFFFF  # Cor Branca
    addi $a0, $t0, 21624    
    
    # "BY"
    jal draw_B
    addi $a0, $a0, 16
    jal draw_Y
    addi $a0, $a0, 16
    addi $a0, $a0, 16       # Espaço
    # "CHAD"
    jal draw_C
    addi $a0, $a0, 16
    jal draw_H
    addi $a0, $a0, 16
    jal draw_A
    addi $a0, $a0, 16
    jal draw_D
    addi $a0, $a0, 16
    addi $a0, $a0, 16       # Espaço
    # "E"
    jal draw_E
    addi $a0, $a0, 16
    addi $a0, $a0, 16       # Espaço
    # "AVILA"
    jal draw_A
    addi $a0, $a0, 16
    jal draw_V
    addi $a0, $a0, 16
    jal draw_I
    addi $a0, $a0, 16
    jal draw_L
    addi $a0, $a0, 16
    jal draw_A
    
    # 3. Espera 3 Segundos
    li $v0, 32
    li $a0, 3000
    syscall

    # 4. Vai para o jogo
    j inicio_jogo        

# ========================================================================
# ALFABETO (MANTIDO)
# ========================================================================
# ... (Funções de letras originais mantidas para economizar espaço visual,
#      elas funcionam exatamente como antes)

draw_A: add $t9, $ra, $0
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    sw $a1, 520($a0)
    sw $a1, 33288($a0)
    sw $a1, 1024($a0)
    sw $a1, 33792($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 1032($a0)
    sw $a1, 33800($a0)
    sw $a1, 1536($a0)
    sw $a1, 34304($a0)
    sw $a1, 1544($a0)
    sw $a1, 34312($a0)
    sw $a1, 2048($a0)
    sw $a1, 34816($a0)
    sw $a1, 2056($a0)
    sw $a1, 34824($a0)
    jr $t9
draw_S: add $t9, $ra, $0
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 8($a0)
    sw $a1, 32776($a0)
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    sw $a1, 1024($a0)
    sw $a1, 33792($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 1032($a0)
    sw $a1, 33800($a0)
    sw $a1, 1544($a0)
    sw $a1, 34312($a0)
    sw $a1, 2048($a0)
    sw $a1, 34816($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    sw $a1, 2056($a0)
    sw $a1, 34824($a0)
    jr $t9
draw_T: add $t9, $ra, $0
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 8($a0)
    sw $a1, 32776($a0)
    sw $a1, 516($a0)
    sw $a1, 33284($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 1540($a0)
    sw $a1, 34308($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    jr $t9
draw_E: add $t9, $ra, $0
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    sw $a1, 1024($a0)
    sw $a1, 33792($a0)
    sw $a1, 1536($a0)
    sw $a1, 34304($a0)
    sw $a1, 2048($a0)
    sw $a1, 34816($a0)
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 8($a0)
    sw $a1, 32776($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    sw $a1, 2056($a0)
    sw $a1, 34824($a0)
    jr $t9
draw_R: add $t9, $ra, $0
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    sw $a1, 1024($a0)
    sw $a1, 33792($a0)
    sw $a1, 1536($a0)
    sw $a1, 34304($a0)
    sw $a1, 2048($a0)
    sw $a1, 34816($a0)
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 520($a0)
    sw $a1, 33288($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 1540($a0)
    sw $a1, 34308($a0)
    sw $a1, 2056($a0)
    sw $a1, 34824($a0)
    jr $t9
draw_O: add $t9, $ra, $0
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    sw $a1, 1024($a0)
    sw $a1, 33792($a0)
    sw $a1, 1536($a0)
    sw $a1, 34304($a0)
    sw $a1, 520($a0)
    sw $a1, 33288($a0)
    sw $a1, 1032($a0)
    sw $a1, 33800($a0)
    sw $a1, 1544($a0)
    sw $a1, 34312($a0)
    jr $t9
draw_I: add $t9, $ra, $0
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 8($a0)
    sw $a1, 32776($a0)
    sw $a1, 2048($a0)
    sw $a1, 34816($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    sw $a1, 2056($a0)
    sw $a1, 34824($a0)
    sw $a1, 516($a0)
    sw $a1, 33284($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 1540($a0)
    sw $a1, 34308($a0)
    jr $t9
draw_D: add $t9, $ra, $0
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    sw $a1, 1024($a0)
    sw $a1, 33792($a0)
    sw $a1, 1536($a0)
    sw $a1, 34304($a0)
    sw $a1, 2048($a0)
    sw $a1, 34816($a0)
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 32776($a0)
    sw $a1, 520($a0)
    sw $a1, 33288($a0)
    sw $a1, 1032($a0)
    sw $a1, 33800($a0)
    sw $a1, 1544($a0)
    sw $a1, 34312($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    sw $a1, 34824($a0)
    jr $t9
draw_B: add $t9, $ra, $0
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    sw $a1, 1024($a0)
    sw $a1, 33792($a0)
    sw $a1, 1536($a0)
    sw $a1, 34304($a0)
    sw $a1, 2048($a0)
    sw $a1, 34816($a0)
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    sw $a1, 520($a0)
    sw $a1, 33288($a0)
    sw $a1, 1544($a0)
    sw $a1, 34312($a0)
    jr $t9
draw_Y: add $t9, $ra, $0
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    sw $a1, 8($a0)
    sw $a1, 32776($a0)
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    sw $a1, 520($a0)
    sw $a1, 33288($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 1540($a0)
    sw $a1, 34308($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    jr $t9
draw_C: add $t9, $ra, $0
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 8($a0)
    sw $a1, 32776($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    sw $a1, 2056($a0)
    sw $a1, 34824($a0)
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    sw $a1, 1024($a0)
    sw $a1, 33792($a0)
    sw $a1, 1536($a0)
    sw $a1, 34304($a0)
    jr $t9
draw_H: add $t9, $ra, $0
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    sw $a1, 1536($a0)
    sw $a1, 34304($a0)
    sw $a1, 2048($a0)
    sw $a1, 34816($a0)
    sw $a1, 8($a0)
    sw $a1, 32776($a0)
    sw $a1, 520($a0)
    sw $a1, 33288($a0)
    sw $a1, 1544($a0)
    sw $a1, 34312($a0)
    sw $a1, 2056($a0)
    sw $a1, 34824($a0)
    sw $a1, 1024($a0)
    sw $a1, 33792($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 1032($a0)
    sw $a1, 33800($a0)
    jr $t9
draw_V: add $t9, $ra, $0
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    sw $a1, 8($a0)
    sw $a1, 32776($a0)
    sw $a1, 520($a0)
    sw $a1, 33288($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 1540($a0)
    sw $a1, 34308($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    jr $t9
draw_L: add $t9, $ra, $0
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    sw $a1, 1024($a0)
    sw $a1, 33792($a0)
    sw $a1, 1536($a0)
    sw $a1, 34304($a0)
    sw $a1, 2048($a0)
    sw $a1, 34816($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    sw $a1, 2056($a0)
    sw $a1, 34824($a0)
    jr $t9

inicio_jogo: 
	add $1, $0, $0
	add $2, $0, $0
	lui $8, 0x1001 

# --- BACKGROUND (PRETO) ---
	addi $10, $0, 8192      
	addi $9, $0, 0x000000   

loop_bg:
	beq $10, $0, estrelas
	sw $9, 0($8)
	sw $9, 32768($8)        
	addi $8, $8, 4
	addi $10, $10, -1
	j loop_bg

# --- ESTRELAS ---
estrelas: 
	# Cinzas
	addi $9, $0, 0xcfd8dc 
	lui $8, 0x1001
	addi $8, $8, 2120
	sw $9, 0($8)
	sw $9, 32768($8)
	
	lui $8, 0x1001
	addi $8, $8, 8176
	sw $9, 0($8)
	sw $9, 32768($8)

	# Amarelas
	addi $9, $0, 0xffc107 
	lui $8, 0x1001
	addi $8, $8, 5672
	sw $9, 0($8)
	sw $9, 32768($8)
	
	lui $8, 0x1001
	addi $8, $8, 14788
	sw $9, 0($8)
	sw $9, 32768($8)

	# Azul
	addi $9, $0, 0x42a5f5 
	lui $8, 0x1001
	addi $8, $8, 13360
	sw $9, 0($8)
	sw $9, 32768($8)

	# Roxo
	addi $9, $0, 0xaa00ff 
	lui $8, 0x1001
	addi $8, $8, 2976
	sw $9, 0($8)
	sw $9, 32768($8)

# --- VIDAS (CORAÇÕES) ---
desenha_vidas:
	addi $11, $0, 0xFFFFFF  
	addi $12, $0, 0xFF0000  
	lui $8, 0x1001
	addi $8, $8, 1424       
	addi $13, $0, 3         

loop_vidas:
	beq $13, $0, setup_inicial  # PULA PONTUAÇÃO STATIC, VAMOS USAR DINAMICA
	addi $20, $8, 32768     
	
	sw $11, 4($8) 
	sw $11, 4($20)
	sw $11, 8($8) 
	sw $11, 8($20)
	sw $11, 16($8) 
	sw $11, 16($20)
	sw $11, 20($8) 
	sw $11, 20($20)
	sw $11, 512($8) 
	sw $11, 512($20)
	sw $12, 516($8) 
	sw $12, 516($20)
	sw $12, 520($8) 
	sw $12, 520($20)
	sw $11, 524($8) 
	sw $11, 524($20)
	sw $12, 528($8) 
	sw $12, 528($20)
	sw $12, 532($8) 
	sw $12, 532($20)
	sw $11, 536($8) 
	sw $11, 536($20)
	sw $11, 1024($8) 
	sw $11, 1024($20)
	sw $12, 1028($8) 
	sw $12, 1028($20)
	sw $12, 1032($8) 
	sw $12, 1032($20)
	sw $12, 1036($8) 
	sw $12, 1036($20)
	sw $12, 1040($8) 
	sw $12, 1040($20)
	sw $12, 1044($8) 
	sw $12, 1044($20)
	sw $11, 1048($8) 
	sw $11, 1048($20)
	sw $11, 1540($8) 
	sw $11, 1540($20)
	sw $12, 1544($8) 
	sw $12, 1544($20)
	sw $12, 1548($8) 
	sw $12, 1548($20)
	sw $12, 1552($8) 
	sw $12, 1552($20)
	sw $11, 1556($8) 
	sw $11, 1556($20)
	sw $11, 2056($8) 
	sw $11, 2056($20)
	sw $12, 2060($8) 
	sw $12, 2060($20)
	sw $11, 2064($8) 
	sw $11, 2064($20)
	sw $11, 2572($8) 
	sw $11, 2572($20)

	addi $8, $8, 36         
	addi $13, $13, -1
	j loop_vidas

# ========================================================================
# . CONFIGURAÇÃO E LOOP PRINCIPAL 
# ========================================================================

setup_inicial:
    # --- CONFIGURA VIDAS E PLACAR ---
    addi $v1, $0, 3        # 3 Vidas
    
    # --- NOVO: CONFIGURA PLACAR ---
    xor $fp, $fp, $fp      # Zera a Pontuação ($fp)
    xor $gp, $gp, $gp      # Zera o Cronômetro ($gp)
    
    # Desenha o '0000' inicial
    jal draw_score_logic

reset_fase:
    # --- POSIÇÃO DA NAVE (CENTRO) ---
    lui $s0, 0x1001
    addi $s0, $s0, 16640   # Centro da tela
    
    # --- RESET DA BALA ---
    add $s6, $0, $0        # Sem bala ativa
    add $s7, $0, $0        # Sem velocidade
    addi $t8, $0, -512     # Direção padrão (Cima)
    add $s4, $0, $0        # Timer da bala zerado

    # --- CONFIGURAÇÃO DOS ASTEROIDES ---
    lui $s1, 0x1001 
    addi $s1, $s1, 16392 # Esq
    lui $s2, 0x1001 
    addi $s2, $s2, 1280  # Cima
    lui $s3, 0x1001 
    addi $s3, $s3, 29952 # Baixo
    lui $s5, 0x1001 
    addi $s5, $s5, 16864 # Dir

    # --- ZERA CONTADORES ---
    add $t4, $0, $0   # Esq
    add $t5, $0, $0   # Cima
    add $t6, $0, $0   # Baixo
    add $t7, $0, $0   # Dir

    # --- DESENHA A NAVE INICIAL ---
    addi $9, $0, 0xFFFFFF 
    add $8, $s0, $0
    addi $20, $8, 32768
    
    sw $9, 0($8)    
    sw $9, 0($20)    # Centro
    sw $9, -512($8) 
    sw $9, -512($20) # Ponta
    sw $9, 508($8)  
    sw $9, 508($20)  # Asa Esq
    sw $9, 516($8)  
    sw $9, 516($20)  # Asa Dir

game_loop:
    # ==========================================================
    # 0. ATUALIZA PONTUAÇÃO (TEMPO DE SOBREVIVÊNCIA)
    # ==========================================================
    addi $gp, $gp, 1        # Incrementa Cronômetro
    addi $at, $0, 20        # Velocidade do Score (Aumente p/ ficar mais lento)
    bne $gp, $at, skip_score
    
    add $gp, $0, $0         # Reseta Timer
    addi $fp, $fp, 1        # Aumenta Pontuação
    jal draw_score_logic    # Desenha na tela

skip_score:

    # ==========================================================
    # 1. ATUALIZA BALA
    # ==========================================================
    beq $s6, $0, skip_bala
    
    addi $s4, $s4, 1
    addi $at, $0, 2          
    blt $s4, $at, skip_bala
    
    add $s4, $0, $0
    jal update_bala
    
skip_bala:

    # ==========================================================
    # 2. MOVIMENTO DOS ASTEROIDES (SPEED HARD!)
    # ==========================================================
    
    # Asteroide 1 (Esquerda)
    addi $t4, $t4, 1        
    addi $at, $0, 10        
    bne $t4, $at, skip_ast1
    add $t4, $0, $0
    
    add $a0, $s1, $0        
    addi $9, $0, 0x000000   
    jal desenha_bloco_comum_interno
    addi $s1, $s1, 4        
    sub $t1, $s1, $s0       
    abs $t1, $t1
    blt $t1, 40, colisao_nave
    add $a0, $s1, $0
    addi $9, $0, 0xFFFFFF   
    jal desenha_bloco_comum_interno
skip_ast1:

    # Asteroide 2 (Cima)
    addi $t5, $t5, 1
    addi $at, $0, 15        
    bne $t5, $at, skip_ast2
    add $t5, $0, $0
    
    add $a0, $s2, $0        
    addi $9, $0, 0x000000   
    jal desenha_bloco_comum_interno
    addi $s2, $s2, 512      
    sub $t1, $s2, $s0
    abs $t1, $t1
    blt $t1, 40, colisao_nave
    add $a0, $s2, $0
    addi $9, $0, 0xFFFFFF   
    jal desenha_bloco_comum_interno
skip_ast2:

    # Asteroide 3 (Baixo)
    addi $t6, $t6, 1
    addi $at, $0, 25        
    bne $t6, $at, skip_ast3
    add $t6, $0, $0
    
    add $a0, $s3, $0        
    addi $9, $0, 0x000000   
    jal desenha_bloco_comum_interno
    addi $s3, $s3, -512     
    sub $t1, $s3, $s0
    abs $t1, $t1
    blt $t1, 40, colisao_nave
    add $a0, $s3, $0
    addi $9, $0, 0xFFFFFF   
    jal desenha_bloco_comum_interno
skip_ast3:

    # Asteroide 4 (Direita)
    addi $t7, $t7, 1
    addi $at, $0, 10        
    bne $t7, $at, skip_ast4
    add $t7, $0, $0
    
    add $a0, $s5, $0        
    addi $9, $0, 0x000000   
    jal desenha_bloco_comum_interno
    addi $s5, $s5, -4       
    sub $t1, $s5, $s0
    abs $t1, $t1
    blt $t1, 40, colisao_nave
    add $a0, $s5, $0
    addi $9, $0, 0xFFFFFF   
    jal desenha_bloco_comum_interno
skip_ast4:

# ==========================================================
# 3. LEITURA DE TECLADO E DESENHO DA NAVE
# ==========================================================
	
check_teclado:
	lui $t0, 0xffff        
	lw $t1, 0($t0)         
	andi $t1, $t1, 0x0001  
	beq $t1, $0, delay     

	lw $k0, 4($t0)         
	
	# --- TIRO (Espaço = 32) ---
	addi $t2, $0, 32
	beq $k0, $t2, atirar

	# --- MOVIMENTO DA NAVE ---
	addi $a0, $0, 0x000000
	jal pinta_quadrado_centro 

	addi $t2, $0, 119 
	beq $k0, $t2, nave_cima      
	addi $t2, $0, 115 
	beq $k0, $t2, nave_baixo     
	addi $t2, $0, 97 
	beq $k0, $t2, nave_esquerda  
	addi $t2, $0, 100
	beq $k0, $t2, nave_direita   
	addi $t2, $0, 113 
	beq $k0, $t2, nave_nw        
	addi $t2, $0, 101 
	beq $k0, $t2, nave_ne        
	addi $t2, $0, 122 
	beq $k0, $t2, nave_sw        
	addi $t2, $0, 120 
	beq $k0, $t2, nave_se        
	
	j delay 

# ========================================================================
# . FUNÇÕES AUXILIARES
# ========================================================================

delay:
	li $v0, 32
	li $a0, 30
	syscall
	j game_loop 

atirar:
    bne $s6, $0, delay     
    add $s6, $s0, $0       
    add $s7, $t8, $0       
    add $s4, $0, $0        
    j delay

# --- LÓGICA DE DESENHO DO PLACAR (NUMÉRICO) ---
draw_score_logic:
    add $t9, $ra, $0        # Salva retorno
    
    addi $a1, $0, 0xFFFFFF  # Cor Branca
    lui $a0, 0x1001
    addi $a0, $a0, 1044     # Posição Topo Esquerda

    # --- Separar Digitos ---
    add $t0, $fp, $0        # Copia score total

    # Milhares
    addi $t2, $0, 1000
    div $t0, $t2
    mflo $a2                # Valor do digito
    mfhi $t0                # Resto
    jal draw_digit_selector
    addi $a0, $a0, 32       # Avança Espaço

    # Centenas
    addi $t2, $0, 100
    div $t0, $t2
    mflo $a2
    mfhi $t0
    jal draw_digit_selector
    addi $a0, $a0, 32

    # Dezenas
    addi $t2, $0, 10
    div $t0, $t2
    mflo $a2
    mfhi $t0
    jal draw_digit_selector
    addi $a0, $a0, 32

    # Unidades
    add $a2, $t0, $0        # O que sobrou é unidade
    jal draw_digit_selector
    
    jr $t9

draw_digit_selector:
    # Escolhe qual numero desenhar com base em $a2
    # Precisamos limpar a área antes de desenhar o novo numero
    # (Opcional se o fundo for preto e desenharmos tudo, mas melhor garantir)
    
    sw $a1, 0($a0) # Dummy write para garantir
    
    beq $a2, 0, draw_0
    beq $a2, 1, draw_1
    beq $a2, 2, draw_2
    beq $a2, 3, draw_3
    beq $a2, 4, draw_4
    beq $a2, 5, draw_5
    beq $a2, 6, draw_6
    beq $a2, 7, draw_7
    beq $a2, 8, draw_8
    beq $a2, 9, draw_9
    jr $ra

# --- SPRITES NUMÉRICOS (3x5) ---
# Usam $a0 como base e $a1 como cor.
# Shadow buffer incluso (+32768)

draw_0:
    sw $a1, 0($a0)       
    sw $a1, 32768($a0)
    sw $a1, 4($a0)       
    sw $a1, 32772($a0)
    sw $a1, 8($a0)       
    sw $a1, 32776($a0)
    sw $a1, 512($a0)     
    sw $a1, 33280($a0)
    sw $a1, 520($a0)     
    sw $a1, 33288($a0)
    sw $a1, 1024($a0)    
    sw $a1, 33792($a0)
    sw $a1, 1032($a0)    
    sw $a1, 33800($a0)
    sw $a1, 1536($a0)    
    sw $a1, 34304($a0)
    sw $a1, 1544($a0)    
    sw $a1, 34312($a0)
    sw $a1, 2048($a0)    
    sw $a1, 34816($a0)
    sw $a1, 2052($a0)    
    sw $a1, 34820($a0)
    sw $a1, 2056($a0)    
    sw $a1, 34824($a0)
    # Limpa meio (caso fosse 8)
    addi $t3, $0, 0x000000
    sw $t3, 1028($a0)    
    sw $t3, 33796($a0)
    jr $ra

draw_1:
    addi $t3, $0, 0x000000 # Limpa laterais
    sw $t3, 0($a0)       
    sw $t3, 32768($a0)
    sw $t3, 8($a0)       
    sw $t3, 32776($a0)
    sw $t3, 512($a0)     
    sw $t3, 33280($a0)
    sw $t3, 520($a0)     
    sw $t3, 33288($a0)
    sw $t3, 1024($a0)    
    sw $t3, 33792($a0)
    sw $t3, 1032($a0)    
    sw $t3, 33800($a0)
    sw $t3, 1536($a0)    
    sw $t3, 34304($a0)
    sw $t3, 1544($a0)    
    sw $t3, 34312($a0)
    sw $t3, 2048($a0)    
    sw $t3, 34816($a0)
    sw $t3, 2056($a0)    
    sw $t3, 34824($a0)
    
    sw $a1, 4($a0)       
    sw $a1, 32772($a0)
    sw $a1, 516($a0)    
    sw $a1, 33284($a0)
    sw $a1, 1028($a0)    
    sw $a1, 33796($a0)
    sw $a1, 1540($a0)    
    sw $a1, 34308($a0)
    sw $a1, 2052($a0)    
    sw $a1, 34820($a0)
    jr $ra

draw_2:
    # Topo, DirCima, Meio, EsqBaixo, Baixo
    # Limpa o que nao usa
    addi $t3, $0, 0x000000
    sw $t3, 512($a0)     
    sw $t3, 33280($a0)
    sw $t3, 1544($a0)    
    sw $t3, 34312($a0)
    
    sw $a1, 0($a0)       
    sw $a1, 32768($a0)
    sw $a1, 4($a0)       
    sw $a1, 32772($a0)
    sw $a1, 8($a0)       
    sw $a1, 32776($a0)
    sw $a1, 520($a0)     
    sw $a1, 33288($a0)
    sw $a1, 1024($a0)    
    sw $a1, 33792($a0)
    sw $a1, 1028($a0)    
    sw $a1, 33796($a0)
    sw $a1, 1032($a0)    
    sw $a1, 33800($a0)
    sw $a1, 1536($a0)    
    sw $a1, 34304($a0)
    sw $a1, 2048($a0)    
    sw $a1, 34816($a0)
    sw $a1, 2052($a0)    
    sw $a1, 34820($a0)
    sw $a1, 2056($a0)    
    sw $a1, 34824($a0)
    jr $ra

draw_3:
    # Topo, DirCima, Meio, DirBaixo, Baixo
    addi $t3, $0, 0x000000
    sw $t3, 512($a0)     
    sw $t3, 33280($a0)
    sw $t3, 1536($a0)    
    sw $t3, 34304($a0)
    
    sw $a1, 0($a0)       
    sw $a1, 32768($a0)
    sw $a1, 4($a0)       
    sw $a1, 32772($a0)
    sw $a1, 8($a0)       
    sw $a1, 32776($a0)
    sw $a1, 520($a0)    
    sw $a1, 33288($a0)
    sw $a1, 1024($a0)    
    sw $a1, 33792($a0)
    sw $a1, 1028($a0)    
    sw $a1, 33796($a0)
    sw $a1, 1032($a0)    
    sw $a1, 33800($a0)
    sw $a1, 1544($a0)    
    sw $a1, 34312($a0)
    sw $a1, 2048($a0)    
    sw $a1, 34816($a0)
    sw $a1, 2052($a0)   
    sw $a1, 34820($a0)
    sw $a1, 2056($a0)    
    sw $a1, 34824($a0)
    jr $ra

draw_4:
    # EsqCima, Meio, DirCima, DirBaixo
    addi $t3, $0, 0x000000
    sw $t3, 4($a0)       
    sw $t3, 32772($a0)
    sw $t3, 0($a0)       
    sw $t3, 32768($a0) # Topo esq aberto ou fechado? 4 aberto em cima
    sw $t3, 1536($a0)    
    sw $t3, 34304($a0)
    sw $t3, 2048($a0)    
    sw $t3, 34816($a0)
    sw $t3, 2052($a0)    
    sw $t3, 34820($a0)
    
    sw $a1, 0($a0)       
    sw $a1, 32768($a0)
    sw $a1, 8($a0)       
    sw $a1, 32776($a0)
    sw $a1, 512($a0)     
    sw $a1, 33280($a0)
    sw $a1, 520($a0)     
    sw $a1, 33288($a0)
    sw $a1, 1024($a0)    
    sw $a1, 33792($a0)
    sw $a1, 1028($a0)    
    sw $a1, 33796($a0)
    sw $a1, 1032($a0)    
    sw $a1, 33800($a0)
    sw $a1, 1544($a0)    
    sw $a1, 34312($a0)
    sw $a1, 2056($a0)    
    sw $a1, 34824($a0)
    jr $ra

draw_5:
    # Topo, EsqCima, Meio, DirBaixo, Baixo
    addi $t3, $0, 0x000000
    sw $t3, 520($a0)  
    sw $t3, 33288($a0)
    sw $t3, 1536($a0)    
    sw $t3, 34304($a0)
    
    sw $a1, 0($a0)       
    sw $a1, 32768($a0)
    sw $a1, 4($a0)       
    sw $a1, 32772($a0)
    sw $a1, 8($a0)       
    sw $a1, 32776($a0)
    sw $a1, 512($a0)    
    sw $a1, 33280($a0)
    sw $a1, 1024($a0)    
    sw $a1, 33792($a0)
    sw $a1, 1028($a0)    
    sw $a1, 33796($a0)
    sw $a1, 1032($a0)    
    sw $a1, 33800($a0)
    sw $a1, 1544($a0)    
    sw $a1, 34312($a0)
    sw $a1, 2048($a0)    
    sw $a1, 34816($a0)
    sw $a1, 2052($a0)    
    sw $a1, 34820($a0)
    sw $a1, 2056($a0)    
    sw $a1, 34824($a0)
    jr $ra

draw_6:
    addi $t3, $0, 0x000000
    sw $t3, 520($a0)     
    sw $t3, 33288($a0)
    
    sw $a1, 0($a0)       
    sw $a1, 32768($a0)
    sw $a1, 4($a0)       
    sw $a1, 32772($a0)
    sw $a1, 8($a0)       
    sw $a1, 32776($a0)
    sw $a1, 512($a0)     
    sw $a1, 33280($a0)
    sw $a1, 1024($a0)    
    sw $a1, 33792($a0)
    sw $a1, 1028($a0)    
    sw $a1, 33796($a0)
    sw $a1, 1032($a0)    
    sw $a1, 33800($a0)
    sw $a1, 1536($a0)    
    sw $a1, 34304($a0)
    sw $a1, 1544($a0)    
    sw $a1, 34312($a0)
    sw $a1, 2048($a0)    
    sw $a1, 34816($a0)
    sw $a1, 2052($a0)    
    sw $a1, 34820($a0)
    sw $a1, 2056($a0)    
    sw $a1, 34824($a0)
    jr $ra

draw_7:
    addi $t3, $0, 0x000000
    sw $t3, 512($a0)     
    sw $t3, 33280($a0)
    sw $t3, 1024($a0)    
    sw $t3, 33792($a0)
    sw $t3, 1028($a0)    
    sw $t3, 33796($a0)
    sw $t3, 1536($a0)    
    sw $t3, 34304($a0)
    sw $t3, 2048($a0)    
    sw $t3, 34816($a0)
    sw $t3, 2052($a0)    
    sw $t3, 34820($a0)
    
    sw $a1, 0($a0)       
    sw $a1, 32768($a0)
    sw $a1, 4($a0)       
    sw $a1, 32772($a0)
    sw $a1, 8($a0)       
    sw $a1, 32776($a0)
    sw $a1, 520($a0)     
    sw $a1, 33288($a0)
    sw $a1, 1032($a0)    
    sw $a1, 33800($a0)
    sw $a1, 1544($a0)    
    sw $a1, 34312($a0)
    sw $a1, 2056($a0)    
    sw $a1, 34824($a0)
    jr $ra

draw_8:
    # Tudo preenchido exceto meio centro? (8 full)
    # A logica do 0 ja limpa o meio, o 8 desenha o meio.
    sw $a1, 0($a0)       
    sw $a1, 32768($a0)
    sw $a1, 4($a0)       
    sw $a1, 32772($a0)
    sw $a1, 8($a0)       
    sw $a1, 32776($a0)
    sw $a1, 512($a0)     
    sw $a1, 33280($a0)
    sw $a1, 520($a0)     
    sw $a1, 33288($a0)
    sw $a1, 1024($a0)    
    sw $a1, 33792($a0)
    sw $a1, 1028($a0)    
    sw $a1, 33796($a0)
    sw $a1, 1032($a0)    
    sw $a1, 33800($a0)
    sw $a1, 1536($a0)    
    sw $a1, 34304($a0)
    sw $a1, 1544($a0)    
    sw $a1, 34312($a0)
    sw $a1, 2048($a0)    
    sw $a1, 34816($a0)
    sw $a1, 2052($a0)    
    sw $a1, 34820($a0)
    sw $a1, 2056($a0)    
    sw $a1, 34824($a0)
    jr $ra

draw_9:
    addi $t3, $0, 0x000000
    sw $t3, 1536($a0)    
    sw $t3, 34304($a0)
    
    sw $a1, 0($a0)       
    sw $a1, 32768($a0)
    sw $a1, 4($a0)       
    sw $a1, 32772($a0)
    sw $a1, 8($a0)       
    sw $a1, 32776($a0)
    sw $a1, 512($a0)     
    sw $a1, 33280($a0)
    sw $a1, 520($a0)     
    sw $a1, 33288($a0)
    sw $a1, 1024($a0)    
    sw $a1, 33792($a0)
    sw $a1, 1028($a0)    
    sw $a1, 33796($a0)
    sw $a1, 1032($a0)    
    sw $a1, 33800($a0)
    sw $a1, 1544($a0)    
    sw $a1, 34312($a0)
    sw $a1, 2048($a0)    
    sw $a1, 34816($a0)
    sw $a1, 2052($a0)    
    sw $a1, 34820($a0)
    sw $a1, 2056($a0)    
    sw $a1, 34824($a0)
    jr $ra

# --- ROTINAS DE DESENHO DA NAVE (MANTIDAS) ---

nave_cima:
    addi $t8, $0, -512      # Define Direção
    addi $9, $0, 0xFFFFFF   # Cor Branca
    add $8, $s0, $0
    addi $20, $8, 32768
    
    sw $9, 0($8)    
    sw $9, 0($20)    # Centro
    sw $9, -512($8) 
    sw $9, -512($20) # Ponta Cima
    sw $9, 508($8)  
    sw $9, 508($20)  # Asa Esq
    sw $9, 516($8)  
    sw $9, 516($20)  # Asa Dir
    j delay

nave_baixo:
    addi $t8, $0, 512
    addi $9, $0, 0xFFFFFF 
    add $8, $s0, $0
    addi $20, $8, 32768
    
    sw $9, 0($8)    
    sw $9, 0($20)
    sw $9, 512($8)  
    sw $9, 512($20)  # Ponta Baixo
    sw $9, -508($8) 
    sw $9, -508($20) # Asa
    sw $9, -516($8) 
    sw $9, -516($20) # Asa
    j delay

nave_esquerda:
    addi $t8, $0, -4
    addi $9, $0, 0xFFFFFF 
    add $8, $s0, $0
    addi $20, $8, 32768
    
    sw $9, 0($8)    
    sw $9, 0($20)
    sw $9, -4($8)   
    sw $9, -4($20)   # Ponta Esq
    sw $9, -508($8) 
    sw $9, -508($20) # Asa
    sw $9, 516($8)  
    sw $9, 516($20)  # Asa
    j delay

nave_direita:
    addi $t8, $0, 4
    addi $9, $0, 0xFFFFFF 
    add $8, $s0, $0
    addi $20, $8, 32768
    
    sw $9, 0($8)    
    sw $9, 0($20)
    sw $9, 4($8)    
    sw $9, 4($20)    # Ponta Dir
    sw $9, -516($8) 
    sw $9, -516($20)
    sw $9, 508($8)  
    sw $9, 508($20)
    j delay

nave_nw: 
    addi $t8, $0, -516
    addi $9, $0, 0xFFFFFF 
    add $8, $s0, $0
    addi $20, $8, 32768
    
    sw $9, 0($8)    
    sw $9, 0($20)
    sw $9, -516($8) 
    sw $9, -516($20) # Ponta Diag
    sw $9, -512($8) 
    sw $9, -512($20)
    sw $9, -4($8)   
    sw $9, -4($20)
    j delay

nave_ne: 
    addi $t8, $0, -508
    addi $9, $0, 0xFFFFFF 
    add $8, $s0, $0
    addi $20, $8, 32768
    
    sw $9, 0($8)    
    sw $9, 0($20)
    sw $9, -508($8) 
    sw $9, -508($20)
    sw $9, -512($8) 
    sw $9, -512($20)
    sw $9, 4($8)    
    sw $9, 4($20)
    j delay

nave_sw: 
    addi $t8, $0, 508
    addi $9, $0, 0xFFFFFF 
    add $8, $s0, $0
    addi $20, $8, 32768
    sw $9, 0($8)    
    sw $9, 0($20)
    sw $9, 508($8)  
    sw $9, 508($20)
    sw $9, 512($8)  
    sw $9, 512($20)
    sw $9, -4($8)   
    sw $9, -4($20)
    j delay

nave_se: 
    addi $t8, $0, 516
    addi $9, $0, 0xFFFFFF 
    add $8, $s0, $0
    addi $20, $8, 32768
    
    sw $9, 0($8)    
    sw $9, 0($20)
    sw $9, 516($8)  
    sw $9, 516($20)
    sw $9, 512($8)  
    sw $9, 512($20)
    sw $9, 4($8)    
    sw $9, 4($20)
    j delay

# --- UPDATE BALA ---
update_bala:
    add $t9, $ra, $0        # Salva retorno
    
    # Apaga Bala
    addi $9, $0, 0x000000
    sw $9, 0($s6) 
    sw $9, 32768($s6)

    # Move Bala
    add $s6, $s6, $s7       
    
    # Limites
    lui $t1, 0x1001
    blt $s6, $t1, destroi_bala
    addi $t1, $t1, 32768
    bgt $s6, $t1, destroi_bala

    # Colisões com Asteroides
    sub $t1, $s6, $s1
    abs $t1, $t1
    blt $t1, 40, colisa_ast1  

    sub $t1, $s6, $s2
    abs $t1, $t1
    blt $t1, 40, colisa_ast2
    
    sub $t1, $s6, $s3
    abs $t1, $t1
    blt $t1, 40, colisa_ast3
    
    sub $t1, $s6, $s5
    abs $t1, $t1
    blt $t1, 40, colisa_ast4

    # Desenha Bala
    addi $9, $0, 0xFFFF00
    sw $9, 0($s6) 
    sw $9, 32768($s6)
    jr $t9

colisa_ast1: # Esquerda -> Respawn Esquerda
    add $a0, $s1, $0        
    addi $9, $0, 0x000000   
    jal desenha_bloco_comum_interno 
    lui $s1, 0x1001         
    addi $s1, $s1, 16392    
    j destroi_bala
    
colisa_ast2: # Cima -> Respawn Cima
    add $a0, $s2, $0        
    addi $9, $0, 0x000000   
    jal desenha_bloco_comum_interno
    lui $s2, 0x1001         
    addi $s2, $s2, 1280     
    j destroi_bala

colisa_ast3: # Baixo -> Respawn Baixo
    add $a0, $s3, $0        
    addi $9, $0, 0x000000   
    jal desenha_bloco_comum_interno
    lui $s3, 0x1001         
    addi $s3, $s3, 29952    
    j destroi_bala

colisa_ast4: # Direita -> Respawn Direita
    add $a0, $s5, $0        
    addi $9, $0, 0x000000   
    jal desenha_bloco_comum_interno
    lui $s5, 0x1001         
    addi $s5, $s5, 16864    
    j destroi_bala

destroi_bala:
    add $s6, $0, $0
    jr $t9

# --- COLISÃO NAVE (Perde Vida) ---
colisao_nave:
    addi $v1, $v1, -1
    
    # Apaga Coração
    addi $t1, $0, 36       
    mult $v1, $t1          
    mflo $t1               
    lui $t2, 0x1001
    addi $t2, $t2, 1424    
    add $a0, $t2, $t1      
    addi $9, $0, 0x000000  
    jal desenha_bloco_coracao_preto
    
    beq $v1, $0, fimJogo
    
    # Delay e Reset
    li $v0, 32
    li $a0, 500
    syscall
    
    # Apaga tudo antes de resetar
    addi $a0, $0, 0x000000
    jal pinta_quadrado_centro
    
    add $a0, $s1, $0 
    jal desenha_bloco_comum_interno
    
    add $a0, $s2, $0 
    jal desenha_bloco_comum_interno
    
    add $a0, $s3, $0 
    jal desenha_bloco_comum_interno
    
    add $a0, $s5, $0 
    jal desenha_bloco_comum_interno
    
    j reset_fase 

# --- DESENHO ASTEROIDE ---
desenha_bloco_comum_interno:
	addi $20, $a0, 32768
	sw $9, 4($a0)   
	sw $9, 4($20)
	sw $9, 8($a0)   
	sw $9, 8($20)
	sw $9, 12($a0)  
	sw $9, 12($20)
	sw $9, 16($a0)  
	sw $9, 16($20)
	sw $9, 512($a0) 
	sw $9, 512($20)
	sw $9, 532($a0) 
	sw $9, 532($20)
	sw $9, 1024($a0) 
	sw $9, 1024($20)
	sw $9, 1044($a0) 
	sw $9, 1044($20)
	sw $9, 1536($a0) 
	sw $9, 1536($20)
	sw $9, 1556($a0) 
	sw $9, 1556($20)
	sw $9, 2048($a0) 
	sw $9, 2048($20)
	sw $9, 2068($a0) 
	sw $9, 2068($20)
	sw $9, 2564($a0) 
	sw $9, 2564($20)
	sw $9, 2568($a0) 
	sw $9, 2568($20)
	sw $9, 2572($a0) 
	sw $9, 2572($20)
	sw $9, 2576($a0) 
	sw $9, 2576($20)
	jr $ra

# --- APAGA NAVE (Área Limpa) ---
pinta_quadrado_centro:
	addi $8, $s0, -512      
	addi $20, $8, 32768
	     
	sw $a0, -4($8) 
	sw $a0, -4($20) 
	sw $a0, 0($8)  
	sw $a0, 0($20) 
	sw $a0, 4($8)  
	sw $a0, 4($20)
	
	addi $8, $8, 512 
	addi $20, $20, 512
	
	sw $a0, -4($8) 
	sw $a0, -4($20) 
	sw $a0, 0($8)  
	sw $a0, 0($20) 
	sw $a0, 4($8)  
	sw $a0, 4($20)
	
	addi $8, $8, 512 
	addi $20, $20, 512
	
	sw $a0, -4($8) 
	sw $a0, -4($20) 
	sw $a0, 0($8)  
	sw $a0, 0($20) 
	sw $a0, 4($8)  
	sw $a0, 4($20)
	
	jr $ra

# --- APAGA CORAÇÃO ---
desenha_bloco_coracao_preto:
    addi $20, $a0, 32768 
    sw $9, 4($a0)   
    sw $9, 4($20)
    sw $9, 8($a0)   
    sw $9, 8($20)
    sw $9, 16($a0)  
    sw $9, 16($20)
    sw $9, 20($a0)  
    sw $9, 20($20)
    sw $9, 512($a0) 
    sw $9, 512($20)
    sw $9, 516($a0) 
    sw $9, 516($20)
    sw $9, 520($a0) 
    sw $9, 520($20)
    sw $9, 524($a0) 
    sw $9, 524($20)
    sw $9, 528($a0) 
    sw $9, 528($20)
    sw $9, 532($a0) 
    sw $9, 532($20)
    sw $9, 536($a0) 
    sw $9, 536($20)
    sw $9, 1024($a0) 
    sw $9, 1024($20)
    sw $9, 1028($a0) 
    sw $9, 1028($20)
    sw $9, 1032($a0) 
    sw $9, 1032($20)
    sw $9, 1036($a0) 
    sw $9, 1036($20)
    sw $9, 1040($a0) 
    sw $9, 1040($20)
    sw $9, 1044($a0) 
    sw $9, 1044($20)
    sw $9, 1048($a0) 
    sw $9, 1048($20)
    sw $9, 1540($a0) 
    sw $9, 1540($20)
    sw $9, 1544($a0) 
    sw $9, 1544($20)
    sw $9, 1548($a0) 
    sw $9, 1548($20)
    sw $9, 1552($a0) 
    sw $9, 1552($20)
    sw $9, 1556($a0) 
    sw $9, 1556($20)
    sw $9, 2056($a0) 
    sw $9, 2056($20)
    sw $9, 2060($a0) 
    sw $9, 2060($20)
    sw $9, 2064($a0) 
    sw $9, 2064($20)
    sw $9, 2572($a0) 
    sw $9, 2572($20)
    jr $ra

fimJogo:
	addi $v0, $0, 10
	syscall