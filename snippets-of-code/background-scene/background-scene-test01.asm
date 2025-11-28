
.text
# ASTEROIDS - 512x256px - Unidade 4

main: 
	reiniciodojogo:
	add $1, $0, $0
	add $2, $0, $0
	add $3, $0, $0
	add $4, $0, $0
	add $5, $0, $0
	add $6, $0, $0
	add $7, $0, $0
	add $8, $0, $0
	add $9, $0, $0
	add $10, $0, $0
	add $11, $0, $0
	add $12, $0, $0
	add $13, $0, $0
	add $14, $0, $0
	add $15, $0, $0
	add $16, $0, $0
	add $17, $0, $0
	add $18, $0, $0
	add $19, $0, $0
	add $20, $0, $0
	add $21, $0, $0
	add $22, $0, $0
	add $23, $0, $0
	add $24, $0, $0
	add $25, $0, $0
	add $26, $0, $0
	add $27, $0, $0
	add $28, $0, $0
	add $29, $0, $0
	add $30, $0, $0
	add $31, $0, $0
	lui $8, 0x1001 # move 16 bits e adiciona primeira posi??o

# pinta tela de 8 cores - efeito background
# usa sem preservar: $9 - $10
# $8 - relacionado a posi??o na mem?ria
# $9 - fica com o c?digo das cores
# $10 - funciona como um registrador de itera??o 

# CENÁRIO DO JOGO
	addi $10, $0, 1024 # quantidade de pixels de cada faixa de cor. 128 x 8 = 1024
	addi $9, $0, 0x000000 # faixa de cor 1 (ALTERADO PARA PRETO)
for1:	beq $10, $0, for2i
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	addi $8, $8, 4
	addi $10, $10, -1
	j for1
	
for2i:	addi $10, $0, 1024
	addi $9, $0, 0x000000 # faixa de cor 2 (ALTERADO PARA PRETO)
for2:	beq $10, $0, for3i
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	addi $8, $8, 4
	addi $10, $10, -1
	j for2
	
for3i:	addi $10, $0, 1024
	addi $9, $0, 0x000000 # faixa de cor 3 (ALTERADO PARA PRETO)
for3:	beq $10, $0, for4i
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	addi $8, $8, 4
	addi $10, $10, -1
	j for3
	
for4i:  addi $10, $0, 1024
	addi $9, $0, 0x000000 # faixa de cor 4 (ALTERADO PARA PRETO)
for4:	beq $10, $0, for5i
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	addi $8, $8, 4
	addi $10, $10, -1
	j for4
	
for5i:	addi $10, $0, 1024
	addi $9, $0, 0x000000 # faixa de cor 5 (ALTERADO PARA PRETO)
for5:	beq $10, $0, for6i
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	addi $8, $8, 4
	addi $10, $10, -1
	j for5
	
for6i:  addi $10, $0, 1024
	addi $9, $0, 0x000000 # faixa de cor 6 (ALTERADO PARA PRETO)
for6:	beq $10, $0, for7i
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	addi $8, $8, 4
	addi $10, $10, -1
	j for6
	
for7i:  addi $10, $0, 1024
	addi $9, $0, 0x000000 # faixa de cor 7 (ALTERADO PARA PRETO)
for7:	beq $10, $0, for8i
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	addi $8, $8, 4
	addi $10, $10, -1
	j for7
	
for8i:  addi $10, $0, 1024
	addi $9, $0, 0x000000 # faixa de cor 8 (ALTERADO PARA PRETO)
for8:	beq $10, $0, estrelas
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	addi $8, $8, 4
	addi $10, $10, -1
	j for8
	
# pinta estrelas
estrelas: 
	# cinzas
	#	estrela 1
	addi $9, $0, 0xcfd8dc # cor 
	lui $8, 0x1001 
	addi $8, $8, 2120
	sw $9, 0($8) 
	sw $9, 32768($8)# SHADOWN
	#	estrela 2
	lui $8, 0x1001 
	addi $8, $8, 8176
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	
	# amarelas
	#	estrela 1
	addi $9, $0, 0xffc107 # cor
	lui $8, 0x1001 
	addi $8, $8, 5672
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	#	estrela 2
	lui $8, 0x1001 
	addi $8, $8, 14788
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	#	estrela 3
	lui $8, 0x1001 
	addi $8, $8, 28412
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	
	# azul
	#	estrela 1
	addi $9, $0, 0x42a5f5 # cor
	lui $8, 0x1001 
	addi $8, $8, 13360
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	#	estrela 2
	lui $8, 0x1001 
	addi $8, $8, 15752
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	
	# roxo
	#	estrela 1
	addi $9, $0, 0xaa00ff # cor
	lui $8, 0x1001 
	addi $8, $8, 2976
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	#	estrela 2
	lui $8, 0x1001 
	addi $8, $8, 21120
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	#	estrela 2
	lui $8, 0x1001 
	addi $8, $8, 26664
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
	#	estrela 2
	lui $8, 0x1001 
	addi $8, $8, 27028
	sw $9, 0($8)
	sw $9, 32768($8)# SHADOWN
# fim estrelas
# FIM DO DESENHO DO CENÁRIO

