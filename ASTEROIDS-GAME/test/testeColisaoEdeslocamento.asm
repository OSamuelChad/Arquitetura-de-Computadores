.text

main: 
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
# . CONFIGURAÇÃO E LOOP PRINCIPAL 
# ========================================================================

setup_inicial:
	# Define posição inicial da nave (Centro da tela)
	lui $s0, 0x1001
	addi $s0, $s0, 16640   # $s0 guarda a POSIÇÃO CENTRO da nave

	# --- CONFIGURAÇÃO DOS ASTEROIDES ---
	# $s1 = Esquerda, $s2 = Cima, $s3 = Baixo, $s4 = Direita
	
	lui $s1, 0x1001 
	addi $s1, $s1, 16392
	
	lui $s2, 0x1001 
	addi $s2, $s2, 1280
	
	lui $s3, 0x1001 
	addi $s3, $s3, 29952
	
	lui $s5, 0x1001 
	addi $s5, $s5, 16864 # ASTEROIDE DIREITA

	# --- ZERA CONTADORES DE VELOCIDADE ---
	add $t4, $0, $0   # Contador Asteroide 1 (Esq)
	add $t5, $0, $0   # Contador Asteroide 2 (Cima)
	add $t6, $0, $0   # Contador Asteroide 3 (Baixo)
	add $t7, $0, $0   # Contador Asteroide 4 (Dir)

	# Desenha a nave inicial
	addi $9, $0, 0xFFFFFF 
	add $8, $s0, $0
	addi $20, $8, 32768
	
	sw $9, 0($8) 
	sw $9, 0($20)
	sw $9, 508($8) 
	sw $9, 508($20)
	sw $9, 516($8) 
	sw $9, 516($20)
	sw $9, 1020($8) 
	sw $9, 1020($20)
	sw $9, 1028($8) 
	sw $9, 1028($20)
	sw $9, 1532($8) 
	sw $9, 1532($20)
	sw $9, 1536($8) 
	sw $9, 1536($20)
	sw $9, 1540($8) 
	sw $9, 1540($20)
	sw $9, 2044($8) 
	sw $9, 2044($20)
	sw $9, 2052($8) 
	sw $9, 2052($20)

game_loop:
	
	# ==========================================================
	# LOGICA DE VELOCIDADE INDEPENDENTE
	# ==========================================================
	
	# --- ASTEROIDE 1 (ESQUERDA) ---
	addi $t4, $t4, 1        # Incrementa contador
	addi $at, $0, 70       # DEFINIR VELOCIDADE (Maior = Mais lento)
	bne $t4, $at, skip_ast1
	add $t4, $0, $0         # Reseta contador
	jal update_ast_esquerda # Move
skip_ast1:

	# --- ASTEROIDE 2 (CIMA) ---
	addi $t5, $t5, 1
	addi $at, $0, 100        
	bne $t5, $at, skip_ast2
	add $t5, $0, $0
	jal update_ast_cima
	
skip_ast2:

	# --- ASTEROIDE 3 (BAIXO) ---
	addi $t6, $t6, 1
	addi $at, $0, 165        
	bne $t6, $at, skip_ast3
	
	add $t6, $0, $0
	jal update_ast_baixo
	
skip_ast3:

	# --- ASTEROIDE 4 (DIREITA) ---
	addi $t7, $t7, 1
	addi $at, $0, 70         
	bne $t7, $at, skip_ast4
	
	add $t7, $0, $0
	jal update_ast_direita
	
skip_ast4:

	# ==========================================================
	# LEITURA DE TECLADO E ATRASO
	# ==========================================================
	
check_teclado:
	lui $t0, 0xffff        
	lw $t1, 0($t0)         
	andi $t1, $t1, 0x0001  
	beq $t1, $0, delay     

	lw $k0, 4($t0)         
	addi $a0, $0, 0x000000
	jal pinta_quadrado_centro # Apaga Nave

	addi $t2, $0, 119 
	beq $k0, $t2, nave_cima      # W
	addi $t2, $0, 115 
	beq $k0, $t2, nave_baixo     # S
	addi $t2, $0, 97 
	beq $k0, $t2, nave_esquerda  # A
	addi $t2, $0, 100
	beq $k0, $t2, nave_direita   # D
	addi $t2, $0, 113 
	beq $k0, $t2, nave_nw        # Q
	addi $t2, $0, 101 
	beq $k0, $t2, nave_ne        # E
	addi $t2, $0, 122 
	beq $k0, $t2, nave_sw        # Z
	addi $t2, $0, 120 
	beq $k0, $t2, nave_se        # X
	
	j delay 

# ========================================================================
# FUNÇÕES DE ATUALIZAÇÃO INDIVIDUAL (PARA CADA ASTEROIDE)
# ========================================================================

update_ast_esquerda:
	add $s7, $ra, $0        # Salva retorno
	add $a0, $s1, $0 
	jal desenha_bloco_asteroide_preto # Apaga
	
	addi $s1, $s1, 4        # Move DIREITA
	beq $s1, $s0, fimJogo   # Colisão?
	
	add $a0, $s1, $0 
	jal desenha_bloco_asteroide_branco # Desenha
	jr $s7

update_ast_cima:
	add $s7, $ra, $0
	add $a0, $s2, $0 
	jal desenha_bloco_asteroide_preto
	
	addi $s2, $s2, 512      # Move BAIXO
	beq $s2, $s0, fimJogo
	
	add $a0, $s2, $0 
	jal desenha_bloco_asteroide_branco
	jr $s7

update_ast_baixo:
	add $s7, $ra, $0
	add $a0, $s3, $0 
	jal desenha_bloco_asteroide_preto
	
	addi $s3, $s3, -512     # Move CIMA
	beq $s3, $s0, fimJogo
	add $a0, $s3, $0 
	
	jal desenha_bloco_asteroide_branco
	jr $s7

update_ast_direita:
	add $s7, $ra, $0
	add $a0, $s5, $0 
	jal desenha_bloco_asteroide_preto # Apaga
	
	addi $s5, $s5, -4       # Move ESQUERDA
	beq $s5, $s0, fimJogo   # Colisão?
	add $a0, $s5, $0
	jal desenha_bloco_asteroide_branco # Desenha
	jr $s7

# --- AUXILIARES DE DESENHO DO ASTEROIDE ---
desenha_bloco_asteroide_preto:
	addi $9, $0, 0x000000
	j desenha_bloco_comum
	
desenha_bloco_asteroide_branco:
	addi $9, $0, 0xFFFFFF
	
desenha_bloco_comum:
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

fimJogo:
	addi $v0, $0, 10
	syscall

# ========================================================================
# . ROTINAS DE DESENHO (SPRITES DA NAVE) - MANTIDAS
# ========================================================================

nave_cima:  # Tecla W
	addi $9, $0, 0xFFFFFF 
	add $8, $s0, $0
	addi $20, $8, 32768 
	   
	sw $9, 0($8) 
	sw $9, 0($20)
	sw $9, 508($8) 
	sw $9, 508($20)
	sw $9, 516($8) 
	sw $9, 516($20)
	sw $9, 1020($8) 
	sw $9, 1020($20)
	sw $9, 1028($8) 
	sw $9, 1028($20)
	sw $9, 1532($8) 
	sw $9, 1532($20)
	sw $9, 1536($8) 
	sw $9, 1536($20)
	sw $9, 1540($8) 
	sw $9, 1540($20)
	sw $9, 2044($8) 
	sw $9, 2044($20)
	sw $9, 2052($8) 
	sw $9, 2052($20)
	
	j delay

nave_baixo: # Tecla S
	addi $9, $0, 0xFFFFFF 
	add $8, $s0, $0
	addi $20, $8, 32768    
	sw $9, 2048($8) 
	sw $9, 2048($20)
	sw $9, 1532($8) 
	sw $9, 1532($20)
	sw $9, 1540($8)
	sw $9, 1540($20)
	sw $9, 1020($8) 
	sw $9, 1020($20)
	sw $9, 1028($8) 
	sw $9, 1028($20)
	sw $9, 508($8) 
	sw $9, 508($20)
	sw $9, 512($8) 
	sw $9, 512($20)
	sw $9, 516($8)
	sw $9, 516($20)
	sw $9, -4($8)
	sw $9, -4($20)
	sw $9, 4($8) 
	sw $9, 4($20)
	
	j delay

nave_esquerda: # Tecla A
	addi $9, $0, 0xFFFFFF 
	add $8, $s0, $0
	addi $20, $8, 32768    
	sw $9, 1020($8) 
	sw $9, 1020($20)
	sw $9, 512($8) 
	sw $9, 512($20)
	sw $9, 1536($8) 
	sw $9, 1536($20)
	sw $9, 4($8) 
	sw $9, 4($20)
	sw $9, 2052($8) 
	sw $9, 2052($20)
	sw $9, 516($8) 
	sw $9, 516($20)
	sw $9, 1028($8) 
	sw $9, 1028($20)
	sw $9, 1540($8) 
	sw $9, 1540($20)
	
	j delay

nave_direita: # Tecla D
	addi $9, $0, 0xFFFFFF 
	add $8, $s0, $0
	addi $20, $8, 32768    
	sw $9, 1028($8) 
	sw $9, 1028($20)
	sw $9, 516($8) 
	sw $9, 516($20)
	sw $9, 1540($8) 
	sw $9, 1540($20)
	sw $9, -4($8) 
	sw $9, -4($20)
	sw $9, 2044($8) 
	sw $9, 2044($20)
	sw $9, 508($8) 
	sw $9, 508($20)
	sw $9, 1020($8) 
	sw $9, 1020($20)
	sw $9, 1532($8) 
	sw $9, 1532($20)
	
	j delay

# --- DIAGONAIS ---
nave_nw: # Q
	addi $9, $0, 0xFFFFFF 
	add $8, $s0, $0 
	addi $20, $8, 32768
	
	sw $9, -4($8) 
	sw $9, -4($20)
	sw $9, 508($8) 
	sw $9, 508($20) 
	sw $9, 512($8) 
	sw $9, 512($20)
	sw $9, 1024($8)
	sw $9, 1024($20) 
	sw $9, 1028($8) 
	sw $9, 1028($20)
	sw $9, 1540($8) 
	sw $9, 1540($20)
	
	j delay

nave_ne: # E
	addi $9, $0, 0xFFFFFF 
	add $8, $s0, $0 
	addi $20, $8, 32768
	sw $9, 4($8) 
	sw $9, 4($20)
	sw $9, 516($8) 
	sw $9, 516($20) 
	sw $9, 512($8) 
	sw $9, 512($20)
	sw $9, 1024($8) 
	sw $9, 1024($20)
	sw $9, 1020($8) 
	sw $9, 1020($20)
	sw $9, 1532($8) 
	sw $9, 1532($20)
	
	j delay

nave_sw: # Z
	addi $9, $0, 0xFFFFFF 
	add $8, $s0, $0
	addi $20, $8, 32768
	sw $9, 4($8) 
	sw $9, 4($20)
	sw $9, 516($8) 
	sw $9, 516($20) 
	sw $9, 512($8) 
	sw $9, 512($20)
	sw $9, 1024($8) 
	sw $9, 1024($20) 
	sw $9, 1020($8) 
	sw $9, 1020($20)
	sw $9, 1532($8)
	sw $9, 1532($20)
	
	j delay

nave_se: # X
	addi $9, $0, 0xFFFFFF 
	add $8, $s0, $0 
	addi $20, $8, 32768
	
	sw $9, -4($8) 
	sw $9, -4($20)
	sw $9, 508($8) 
	sw $9, 508($20) 
	sw $9, 512($8) 
	sw $9, 512($20)
	sw $9, 1024($8) 
	sw $9, 1024($20) 
	sw $9, 1028($8) 
	sw $9, 1028($20)
	sw $9, 1540($8) 
	sw $9, 1540($20)
	
	j delay

delay:
	addi $23, $0, 2000
wait:	
	addi $23, $23, -1
	bne $23, $0, wait
	j game_loop

# --- FUNÇÃO AUXILIAR: APAGA CENTRO ---
pinta_quadrado_centro:
	add $8, $s0, $0         
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