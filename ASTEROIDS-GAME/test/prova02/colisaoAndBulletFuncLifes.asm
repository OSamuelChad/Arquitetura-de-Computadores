.text

# ========================================================================
# TELA DE SPLASH (Intro)
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
    sw $t1, 32768($t3)      # Shadow Buffer (garantia)
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
    
    # Cálculo da posição (Linha 42, centralizado aprox)
    # Offset = (42 * 512) + (30 * 4) = 21504 + 120 = 21624
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
# ALFABETO SIMPLIFICADO (3x5 pixels)
# $a0 = Posição na memória, $a1 = Cor
# ========================================================================

draw_pixel: 
    # Função auxiliar interna
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    jr $ra

draw_A:
    add $t9, $ra, $0        # Salva retorno
    # Topo
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    # Lados
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    sw $a1, 520($a0)
    sw $a1, 33288($a0)
    # Meio
    sw $a1, 1024($a0)
    sw $a1, 33792($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 1032($a0)
    sw $a1, 33800($a0)
    # Pernas
    sw $a1, 1536($a0)
    sw $a1, 34304($a0)
    sw $a1, 1544($a0)
    sw $a1, 34312($a0)
    sw $a1, 2048($a0)
    sw $a1, 34816($a0)
    sw $a1, 2056($a0)
    sw $a1, 34824($a0)
    jr $t9

draw_S:
    add $t9, $ra, $0
    # Topo
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 8($a0)
    sw $a1, 32776($a0)
    # Esq Cima
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    # Meio
    sw $a1, 1024($a0)
    sw $a1, 33792($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 1032($a0)
    sw $a1, 33800($a0)
    # Dir Baixo
    sw $a1, 1544($a0)
    sw $a1, 34312($a0)
    # Baixo
    sw $a1, 2048($a0)
    sw $a1, 34816($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    sw $a1, 2056($a0)
    sw $a1, 34824($a0)
    jr $t9

draw_T:
    add $t9, $ra, $0
    # Topo
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 8($a0)
    sw $a1, 32776($a0)
    # Coluna
    sw $a1, 516($a0)
    sw $a1, 33284($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 1540($a0)
    sw $a1, 34308($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    jr $t9

draw_E:
    add $t9, $ra, $0
    # Coluna Esq
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
    # Barras
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

draw_R:
    add $t9, $ra, $0
    # Coluna
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
    # Curva
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 520($a0)
    sw $a1, 33288($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    # Perna
    sw $a1, 1540($a0)
    sw $a1, 34308($a0)
    sw $a1, 2056($a0)
    sw $a1, 34824($a0)
    jr $t9

draw_O:
    add $t9, $ra, $0
    # Topo e Base
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    # Lados
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

draw_I:
    add $t9, $ra, $0
    # Topo e Base
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
    # Meio
    sw $a1, 516($a0)
    sw $a1, 33284($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 1540($a0)
    sw $a1, 34308($a0)
    jr $t9

draw_D:
    add $t9, $ra, $0
    # Coluna
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
    # Curva
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    #sw $a1, 8($a0)
    sw $a1, 32776($a0)
    
    sw $a1, 520($a0)
    sw $a1, 33288($a0)
    sw $a1, 1032($a0)
    sw $a1, 33800($a0)
    sw $a1, 1544($a0)
    sw $a1, 34312($a0)
    
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    #sw $a1, 2056($a0)
    sw $a1, 34824($a0)
    jr $t9
    
    # --- NOVAS LETRAS PARA O SUBTITULO ---

draw_B:
    add $t9, $ra, $0
    # Coluna Esq
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
    # Topo, Meio, Baixo
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    # Lado Dir (fechando)
    sw $a1, 520($a0)
    sw $a1, 33288($a0)
    sw $a1, 1544($a0)
    sw $a1, 34312($a0)
    jr $t9

draw_Y:
    add $t9, $ra, $0
    # V de cima
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    sw $a1, 8($a0)
    sw $a1, 32776($a0)
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    sw $a1, 520($a0)
    sw $a1, 33288($a0)
    # Haste central
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 1540($a0)
    sw $a1, 34308($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    jr $t9

draw_C:
    add $t9, $ra, $0
    # Topo e Baixo
    sw $a1, 4($a0)
    sw $a1, 32772($a0)
    sw $a1, 8($a0)
    sw $a1, 32776($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    sw $a1, 2056($a0)
    sw $a1, 34824($a0)
    # Coluna Esq
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    sw $a1, 1024($a0)
    sw $a1, 33792($a0)
    sw $a1, 1536($a0)
    sw $a1, 34304($a0)
    jr $t9

draw_H:
    add $t9, $ra, $0
    # Colunas
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
    # Meio
    sw $a1, 1024($a0)
    sw $a1, 33792($a0)
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 1032($a0)
    sw $a1, 33800($a0)
    jr $t9

draw_V:
    add $t9, $ra, $0
    # Topo aberto
    sw $a1, 0($a0)
    sw $a1, 32768($a0)
    sw $a1, 512($a0)
    sw $a1, 33280($a0)
    
    sw $a1, 8($a0)
    sw $a1, 32776($a0)
    sw $a1, 520($a0)
    sw $a1, 33288($a0)
    
    # Meio fechando
    sw $a1, 1028($a0)
    sw $a1, 33796($a0)
    sw $a1, 1540($a0)
    sw $a1, 34308($a0)
    sw $a1, 2052($a0)
    sw $a1, 34820($a0)
    jr $t9

draw_L:
    add $t9, $ra, $0
    # Coluna Esq
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
    # Base
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
	addi $10, $0, 8192      # Total de pixels (128x64)
	addi $9, $0, 0x000000   # Preto

loop_bg:
	beq $10, $0, estrelas
	sw $9, 0($8)
	sw $9, 32768($8)        # Shadow Buffer
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
	addi $11, $0, 0xFFFFFF  # Branco (Borda)
	addi $12, $0, 0xFF0000  # Vermelho (Recheio)
	lui $8, 0x1001
	addi $8, $8, 1424       # Topo Direita
	addi $13, $0, 3         # 3 Vidas

loop_vidas:
	beq $13, $0, desenha_pontuacao
	addi $20, $8, 32768     
	
	# Linha 0 (Topo)
	sw $11, 4($8) 
	sw $11, 4($20)
	sw $11, 8($8) 
	sw $11, 8($20)
	sw $11, 16($8) 
	sw $11, 16($20)
	sw $11, 20($8) 
	sw $11, 20($20)
	
	# Linha 1
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
	
	# Linha 2
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
	
	# Linha 3
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
	
	# Linha 4
	sw $11, 2056($8) 
	sw $11, 2056($20)
	sw $12, 2060($8) 
	sw $12, 2060($20)
	sw $11, 2064($8) 
	sw $11, 2064($20)
	
	# Linha 5
	sw $11, 2572($8) 
	sw $11, 2572($20)

	addi $8, $8, 36         # Avança para o próximo coração
	addi $13, $13, -1
	j loop_vidas

# --- PONTUAÇÃO (GRANDE) ---
desenha_pontuacao:
	addi $9, $0, 0xFFFFFF   # Branco
	lui $8, 0x1001
	addi $8, $8, 1044       # Topo Esquerda
	addi $13, $0, 4         # 4 Digitos

loop_pontos:
	beq $13, $0, setup_inicial 
	addi $20, $8, 32768     

	# Linha 0 (Topo)
	sw $9, 4($8) 
	sw $9, 4($20)
	sw $9, 8($8) 
	sw $9, 8($20)
	sw $9, 12($8) 
	sw $9, 12($20)
	sw $9, 16($8) 
	sw $9, 16($20)
	
	# Linha 1 (Lados)
	sw $9, 512($8) 
	sw $9, 512($20)
	sw $9, 532($8) 
	sw $9, 532($20)
	
	# Linha 2 (Lados)
	sw $9, 1024($8) 
	sw $9, 1024($20)
	sw $9, 1044($8) 
	sw $9, 1044($20)
	
	# Linha 3 (Meio)
	sw $9, 1540($8) 
	sw $9, 1540($20)
	sw $9, 1544($8) 
	sw $9, 1544($20)
	sw $9, 1548($8) 
	sw $9, 1548($20)
	sw $9, 1552($8) 
	sw $9, 1552($20)
	
	# Linha 4 (Lados)
	sw $9, 2048($8) 
	sw $9, 2048($20)
	sw $9, 2068($8) 
	sw $9, 2068($20)
	
	# Linha 5 (Lados)
	sw $9, 2560($8) 
	sw $9, 2560($20)
	sw $9, 2580($8) 
	sw $9, 2580($20)
	
	# Linha 6 (Base)
	sw $9, 3076($8) 
	sw $9, 3076($20)
	sw $9, 3080($8) 
	sw $9, 3080($20)
	sw $9, 3084($8) 
	sw $9, 3084($20)
	sw $9, 3088($8) 
	sw $9, 3088($20)

	addi $8, $8, 32         # Avança para o próximo dígito
	addi $13, $13, -1
	j loop_pontos

# ========================================================================
# . CONFIGURAÇÃO E LOOP PRINCIPAL (FINAL E CORRIGIDO)
# ========================================================================

setup_inicial:
    # --- CONFIGURA VIDAS ---
    addi $v1, $0, 3        # 3 Vidas

reset_fase:
    # --- POSIÇÃO DA NAVE (CENTRO) ---
    lui $s0, 0x1001
    addi $s0, $s0, 16640   # Centro da tela
    
    # --- RESET DA BALA ---
    add $s6, $0, $0        # Sem bala ativa
    add $s7, $0, $0        # Sem velocidade
    addi $t8, $0, -512     # Direção padrão (Cima)
    add $s4, $0, $0        # Timer da bala zerado

    # --- CONFIGURAÇÃO DOS ASTEROIDES (DIAGONAIS PARA O CENTRO) ---
    # Matemática: Centro (16640) +/- (Passos * Vetor)
    # Garante que eles vão bater na nave se ela ficar parada
    
    # 1. Topo-Esquerda (Vetor +516) -> Nasce em 1160
    lui $s1, 0x1001 
    addi $s1, $s1, 1160    
    
    # 2. Topo-Direita (Vetor +508) -> Nasce em 1400
    lui $s2, 0x1001 
    addi $s2, $s2, 1400   
    
    # 3. Baixo-Esquerda (Vetor -508) -> Nasce em 31880
    lui $s3, 0x1001 
    addi $s3, $s3, 31880   
    
    # 4. Baixo-Direita (Vetor -516) -> Nasce em 32120
    lui $s5, 0x1001 
    addi $s5, $s5, 32120   

    # --- ZERA CONTADORES ---
    add $t4, $0, $0
    add $t5, $0, $0
    add $t6, $0, $0
    add $t7, $0, $0

    # --- DESENHA A NAVE INICIAL (Apontando p/ Cima) ---
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
    # 1. ATUALIZA BALA
    # ==========================================================
    beq $s6, $0, skip_bala
    
    addi $s4, $s4, 1
    addi $at, $0, 2          # Velocidade Bala
    blt $s4, $at, skip_bala
    
    add $s4, $0, $0
    jal update_bala
    
skip_bala:

    # ==========================================================
    # 2. MOVIMENTO DOS ASTEROIDES (DIAGONAIS FIXAS)
    # ==========================================================
    
    addi $a3, $0, 15         # Velocidade Asteroides (Maior = Mais lento)
    
    # --- ASTEROIDE 1 (Vem do Topo-Esq -> +516) ---
    addi $t4, $t4, 1
    bne $t4, $a3, skip_ast1
    add $t4, $0, $0
    
    add $a0, $s1, $0        
    addi $9, $0, 0x000000   # Apaga
    jal desenha_bloco_comum_interno
    
    addi $s1, $s1, 516      # Move Diagonal (+516)
    
    sub $t1, $s1, $s0
    abs $t1, $t1
    blt $t1, 150, colisao_nave
    
    add $a0, $s1, $0
    addi $9, $0, 0xFFFFFF   # Desenha
    jal desenha_bloco_comum_interno
    
skip_ast1:

    # --- ASTEROIDE 2 (Vem do Topo-Dir -> +508) ---
    addi $t5, $t5, 1
    bne $t5, $a3, skip_ast2
    add $t5, $0, $0
    
    add $a0, $s2, $0        
    addi $9, $0, 0x000000   
    jal desenha_bloco_comum_interno
    
    addi $s2, $s2, 508      # Move Diagonal (+508)
    
    sub $t1, $s2, $s0
    abs $t1, $t1
    blt $t1, 150, colisao_nave
    
    add $a0, $s2, $0
    addi $9, $0, 0xFFFFFF   
    jal desenha_bloco_comum_interno
    
skip_ast2:

    # --- ASTEROIDE 3 (Vem de Baixo-Esq -> -508) ---
    addi $t6, $t6, 1
    bne $t6, $a3, skip_ast3
    add $t6, $0, $0
    
    add $a0, $s3, $0        
    addi $9, $0, 0x000000   
    jal desenha_bloco_comum_interno
    
    addi $s3, $s3, -508     # Move Diagonal (-508)
    
    sub $t1, $s3, $s0
    abs $t1, $t1
    blt $t1, 150, colisao_nave
    
    add $a0, $s3, $0
    addi $9, $0, 0xFFFFFF   
    jal desenha_bloco_comum_interno
    
skip_ast3:

    # --- ASTEROIDE 4 (Vem de Baixo-Dir -> -516) ---
    addi $t7, $t7, 1
    bne $t7, $a3, skip_ast4
    add $t7, $0, $0
    
    add $a0, $s5, $0        
    addi $9, $0, 0x000000   
    jal desenha_bloco_comum_interno
    
    addi $s5, $s5, -516     # Move Diagonal (-516)
    
    sub $t1, $s5, $s0
    abs $t1, $t1
    blt $t1, 150, colisao_nave
    
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
	jal pinta_quadrado_centro # Apaga nave antiga

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
    bne $s6, $0, delay     # Se já tem bala, sai
    add $s6, $s0, $0       # Nasce na nave
    add $s7, $t8, $0       # Pega direção atual da nave ($t8)
    add $s4, $0, $0        
    j delay

# --- ROTINAS DE DESENHO DA NAVE (CADA UMA COM SEU SPRITE) ---

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
    
    # Ast 1
    sub $t1, $s6, $s1
    abs $t1, $t1
    blt $t1, 150, colisa_ast1  # Hitbox maior para garantir

    # Ast 2
    sub $t1, $s6, $s2
    abs $t1, $t1
    blt $t1, 150, colisa_ast2
    
    # Ast 3
    sub $t1, $s6, $s3
    abs $t1, $t1
    blt $t1, 150, colisa_ast3
    
    # Ast 4
    sub $t1, $s6, $s5
    abs $t1, $t1
    blt $t1, 150, colisa_ast4

    # Desenha Bala
    addi $9, $0, 0xFFFF00
    sw $9, 0($s6) 
    sw $9, 32768($s6)
    jr $t9

colisa_ast1:
    add $a0, $s1, $0        
    addi $9, $0, 0x000000   
    jal desenha_bloco_comum_interno 
    lui $s1, 0x1001         
    addi $s1, $s1, 1160     # Respawn Topo-Esq
    j destroi_bala
    
colisa_ast2:
    add $a0, $s2, $0        
    addi $9, $0, 0x000000   
    jal desenha_bloco_comum_interno
    lui $s2, 0x1001         
    addi $s2, $s2, 1400     # Respawn Topo-Dir
    j destroi_bala

colisa_ast3:
    add $a0, $s3, $0        
    addi $9, $0, 0x000000   
    jal desenha_bloco_comum_interno
    lui $s3, 0x1001         
    addi $s3, $s3, 31880    # Respawn Baixo-Esq
    j destroi_bala

colisa_ast4:
    add $a0, $s5, $0        
    addi $9, $0, 0x000000   
    jal desenha_bloco_comum_interno
    lui $s5, 0x1001         
    addi $s5, $s5, 32120    # Respawn Baixo-Dir
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
    # Cobre uma área 3x3 para garantir que apaga qualquer rotação da nave
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