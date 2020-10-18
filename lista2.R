###################### ESCOLA DE MÉTODOS E FERRAMENTAS TECNOLÓGICA PARA PESQUISA EM POLÍTICAS PÚBLICAS – Edição I #######################
################################################################ LISTA 2 ################################################################
######################################################## INTRODUÇãO AO R - 2020 #########################################################


################################################################ BLOCO 3 ################################################################ 
############################################################### Matrizes ################################################################

#19 - Selecione o primeiro elemento da terceira linha da matriz.

#20 - Selecione o segundo elemento da ultima coluna da matriz.

#21 - Selecione a primeira linha inteira.

#22 - Selecione a quinta coluna inteira.

#23 - Selecione a primeira e terceira linha das colunas 2 e 5. 

################################################################ BLOCO 4 ################################################################ 
############################################################# Data Frames ###############################################################

#24 - Transforme a matriz paises final em um dataframe. Atençao: necessario transpor a matriz

#25 - Rode o seguinte código:

df <- data.frame(paste("0000", 1:25, sep = ""), 
                 factor(rep(c("branca", "negra", "indígena"), c(10, 10, 5))),
                 factor(rep(c("F","M"), c(13,12))), 
                 sample(c(16:50), 25, replace = T), 
                 factor(rep(c("superior","tecnico", "medio"), c(5, 8, 12))), 
                 sample(seq(500, 30000, by = 500), 25, replace = T), 
                 factor(rep(c("solteiro","casado", "viuvo", "separado"), c(5, 10, 2, 8))))
colnames(df) <- c("individuo", "raca", "sexo", "idade", "escol", "renda", "civil")

#O que foi criado? 
#Como foi criado cada uma das variáveis?

#26 - Selecione as mulheres do seu data frame

#27 - Selecione os homens negros maiores de 30 anos do seu data frame

#28 - Selecione mulheres brancas com renda maior que 1500

#29 - Selecione pessoas com nivel superior que tem mais que 20 anos.

#30 - Ordene o seu data frame por ordem crescente de idade

################################################################ BLOCO 5 ################################################################ 
################################################################  Listas ################################################################

#31 - Crie uma lista com os vetores, matrizes e data frames que voce tem armazenado na memoria

#32 - Procure na internet como referenciar elementos dentro da lista. Selecione o 3º elemento da sua lista. 
