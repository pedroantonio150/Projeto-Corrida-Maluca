#ProjetoCorridaMaluca
.data
perguntaini: .asciiz "\nInsira a quantidade de jogadores: "
perguntanome: .asciiz "\nInsira o nome dos jogadores: "
msgjogo: .asciiz "\n\nAperte enter para rodar dados!!! "
jogador: .space 40
msgdados: .asciiz "\n\nResultado dos dados: "
j1: .asciiz "\n\nVez do jogador 1: "
j2: .asciiz "\n\nVez do jogador 2: "
j3: .asciiz "\n\nVez do jogador 3: "
j4: .asciiz "\n\nVez do jogador 4: "
casa6: .asciiz "\n\nEntrou em casa com sapatos que usou na rua, volte 1 casa!"
casa10: .asciiz "\n\nVoc� comprou mais do que precisava, volte 3 casas!"
casa13: .asciiz "\n\nUsou len�o descart�vel ao espirrar, avance 2 casas!"
casa16: .asciiz "\n\nVoc� ajudou a familia, avance 3 casas!"
casa17: .asciiz "\n\nVov� saiu de casa, volte 5 casas!"
casa20: .asciiz "\n\nVoc� est� com febre e saiu para passear, volte ao inicio do jogo!"
casa25: .asciiz "\n\nTossiu sem cobrir a boca, volte 3 casas!"
casa33: .asciiz "\n\nUsou �lcool gel nas m�os, avance 2 casas!"
casa36: .asciiz "\n\nMantem os ambientes ventilados, avance 4 casas!"
casa38: .asciiz "\n\nAntes de jogar voc� lavou as m�os, avance 2 casas!"
casa41: .asciiz "\n\nApos jogar voce lavou as m�os, avance 4 casas!"
casa46: .asciiz "\n\nVoce cumprimentou com as maos, volte 4 casas!"
casa49: .asciiz "\n\nVoce foi a uma festa, volte 5 casas!"
mensagemfinal: .asciiz "\n\nJogo encerrado! "
comecoganhou: .asciiz "\n\nAcabou! � f�rias! "
ganhou1: .asciiz "\nJogador 1 ganhou!!!"
ganhou2: .asciiz "\nJogador 2 ganhou!!!"
ganhou3: .asciiz "\nJogador 3 ganhou!!!"
ganhou4: .asciiz "\nJogador 4 ganhou!!!"
qtderrada: .asciiz "\n\nQuantidade de jogadores invalida! Tente novamente!"
parcial1: .asciiz "\nPontua��o do jogador 1: "
parcial2: .asciiz "\nPontua��o do jogador 2: "
parcial3: .asciiz "\nPontua��o do jogador 3: "
parcial4: .asciiz "\nPontua��o do jogador 4: "
.text
main: 
 jal iniciojogo
 jal loopjogo
#---dizer quem ganhou
fimmain:
# verifica��o jogador 1
bne $t0, 1, naofoi1
li $v0, 4
la $a0, comecoganhou
syscall
li $v0, 4
la $a0, ganhou1
syscall
naofoi1:
# verifica��o jogador 2
bne $t0, 2, naofoi2
li $v0, 4
la $a0, comecoganhou
syscall
li $v0, 4
la $a0, ganhou2
syscall
naofoi2:
# verifica��o jogador 3
bne $t0, 3, naofoi3
li $v0, 4
la $a0, comecoganhou
syscall
li $v0, 4
la $a0, ganhou3
syscall
naofoi3:
# verifica��o jogador 4
bne $t0, 4, naofoi4
li $v0, 4
la $a0, comecoganhou
syscall
li $v0, 4
la $a0, ganhou4
syscall
naofoi4:
#------------------
#fim do programa
addi $v0, $zero, 10
syscall




#-------------------
#FUN��ES
#-------------------



iniciojogo:
tentardnv:
#Pergunta quantos jogadores
li $v0, 4
la $a0, perguntaini
syscall
#adiciona numero de jogadores em registrador v0
li $v0, 5
syscall
 #verifica se a quantidade � menor que 5, se for o jogo continuar
 blt $v0, 5, passou
 
 li $v0, 4
 la $a0, qtderrada
 syscall
 j tentardnv
passou: 
#salva numero de jogadores em $s0
add $s0, $s0, $v0
#Come�o do loop de acordo com o numero de jogadores
LoopNome:
addi $t0, $t0, 1 #Contador para loop
#Pergunta nomes dos jogadores
li $v0, 4
la $a0, perguntanome
syscall
#leitura do nome
li $v0, 8
la $a0, jogador
li $a1, 40
syscall
#se for o jogador 1, salva o nome em $s1
bne $t0, 1, else1
add $s1, $s1, $a0
else1:
#se for o jogador 2, salva o nome em $s2
bne $t0, 2, else2
add $s2, $s2, $a0
else2:
#se for o jogador 3, salva o nome em $s3
bne $t0, 3, else3
add $s3, $s3, $a0
else3:
#se for o jogador 4, salva o nome em $s4
bne $t0, 4, else4
add $s4, $s4, $a0
else4:
#enquanto contador nao chegar no numero de jogadores, continuar� o loop
beq $s0, $t0, FimdoLoop
 j LoopNome 
FimdoLoop:
jr $ra

#---------------------------
loopjogo: #NOME DA FUN��O
addi $t0, $zero, 0
Loopjogo: #NOME DO LOOP
addi $t0, $t0, 1
#exibir de quem � a vez
bne $t0, 1, vai2
li $v0, 4
la $a0, j1
syscall
vai2:
bne $t0, 2, vai3
li $v0, 4
la $a0, j2
syscall
vai3:
bne $t0, 3, vai4
li $v0, 4
la $a0, j3
syscall
vai4:
bne $t0, 4, vai
li $v0, 4
la $a0, j4
syscall
vai:
#apertar enter pra jogar dados
li $v0, 4
la $a0, msgjogo
syscall
li $v0, 8
la $a0, jogador
li $a1, 40
syscall
#criar numero aleatorio entre 1 e 12
li $v0, 42
li $a1, 12
syscall
addi $a0, $a0, 1
add $k0, $zero, $a0 #salvando resultado dos dados em $k0
#exibir resultado dos dados
li $v0, 4
la $a0, msgdados
syscall
add $a0, $zero, $k0
li $v0, 1
syscall
#adicionar numero de dados as casas
#se for vez do jogador 1, add na pontua��o de t1
bne $t0,1, vez2
add $t1, $t1, $k0
add $s7, $zero, $t1
jal VerificaCasa
add $t1, $zero, $s7
bge $t1, 50, Fimloopjogo #verifica se o jogador 1 ganhou
#exibe resultado parcial do jogador 1
li $v0, 4
la $a0, parcial1
syscall
li $v0, 1
add $a0, $zero, $t1
syscall
# ------------
vez2:
#se for vez do jogador 2, add na pontua��o de t2
bne $t0, 2, vez3
add $t2, $t2, $k0
add $s7, $zero, $t2
jal VerificaCasa
add $t2, $zero, $s7
bge $t2, 50, Fimloopjogo #verifica se o jogador 2 ganhou
#exibe resultado parcial do jogador 2
li $v0, 4
la $a0, parcial2
syscall
li $v0, 1
add $a0, $zero, $t2
syscall
# ------------
vez3:
#se for vez do jogador 3, add na pontua��o de t3
bne $t0, 3, vez4
add $t3, $t3, $k0
add $s7, $zero, $t3
jal VerificaCasa
add $t3, $zero, $s7
bge $t3, 50, Fimloopjogo #verifica se o jogador 3 ganhou
#exibe resultado parcial do jogador 3
li $v0, 4
la $a0, parcial3
syscall
li $v0, 1
add $a0, $zero, $t3
syscall
# ------------
vez4:
#se for vez do jogador 4, add na pontua��o de t4
bne $t0, 4, acabavez
add $t4, $t4, $k0
add $s7, $zero, $t4
jal VerificaCasa
add $t4, $zero, $s7
bge $t4, 50, Fimloopjogo #verifica se o jogador 4 ganhou
#exibir resultado parcial do jogador
li $v0, 4
la $a0, parcial4
syscall
li $v0, 1
add $a0, $zero, $t4
syscall
# ------------
acabavez:
#contador para loop da ordem do jogador
bne $s0, $t0, contador
addi $t0, $zero,0 
contador:
j Loopjogo
Fimloopjogo:
li $v0, 4
la $a0, mensagemfinal
syscall
j fimmain


#-------------

#Fun��o para verificar as casas especiais

VerificaCasa:
#Casa 6 
bne $s7, 6 , else6
li $v0 , 4
la $a0, casa6
syscall
addi $s7, $s7, -1
else6:

#Casa 10
bne $s7, 10, else10
li $v0 , 4
la $a0, casa10
syscall
addi $s7, $s7, -3
else10:

#Casa 13
bne $s7, 13, else13
li $v0 , 4
la $a0, casa13
syscall
addi $s7, $s7, 2
else13:

#Casa 16
bne $s7, 16, else16
li $v0 , 4
la $a0, casa16
syscall
addi $s7, $s7, 3
else16:

#Casa 17
bne $s7, 17, else17
li $v0 , 4
la $a0, casa17
syscall
addi $s7,$s7, -5
else17:

#Casa 20
bne $s7, 20, else20
li $v0 , 4
la $a0, casa20
syscall
add $s7, $zero, $zero
else20:

#Casa 25
bne $s7, 25, else25
li $v0 , 4
la $a0, casa25
syscall
add $s7, $s7, -3
else25:

#Casa 33
bne $s7, 33, else33
li $v0 , 4
la $a0, casa33
syscall
add $s7, $s7, 2
else33:

#Casa 36
bne $s7, 36, else36
li $v0 , 4
la $a0, casa36
syscall
add $s7, $s7, 2
else36:

#Casa 38
bne $s7, 38, else38
li $v0 , 4
la $a0, casa38
syscall
add $s7, $s7, 2
else38:

#Casa 41
bne $s7, 41, else41
li $v0 , 4
la $a0, casa41
syscall
add $s7, $s7, 2
else41:

#Casa 46
bne $s7, 46, else46
li $v0 , 4
la $a0, casa46
syscall
add $s7, $s7, -4
else46:

#Casa 49
bne $s7, 49, else49
li $v0 , 4
la $a0, casa49
syscall
add $s7, $s7, -5
else49:

jr $ra
