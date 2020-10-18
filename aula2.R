seq <- seq(2,100, by = 2) #sequencia de 2 a 100, de 2 em 2
rev(seq) #inverso do objeto seq
rep(seq, times = 5)  #repetição do objeto seq 5 vezes
length(seq) #tamanho de um objeto

#concatenação de várias funções
length(rep(rev(seq(1, 18, by = 3)), times = 5))


#Matrizes
matrix(21:70, nrow = 5, ncol = 10, byrow = FALSE) #cria matriz de 21 a 70 - 5 linhas - 5 colunas - por coluna
matrix(21:70, nrow = 5, ncol = 10, byrow = TRUE) #cria matriz de 21 a 70 - 5 linhas - 5 colunas - por linha
matrix(NA, nrow = 5, ncol = 10, byrow = FALSE) #matriz genérica - vazia - só com NA dentro

#cria matriz com os vetores países
matriz_paises <- matrix(c(eua, brasil, argentina), 
                        nrow = 3, ncol = 5, byrow = TRUE)


colnames(matriz_paises) <- c("JANEIRO", "FEVEREIRO", "MARÇO", "ABRIL", "MAIO") #dá nome para as colunas
rownames(matriz_paises) <- c("EUA", "Brasil", "Argentina") #dá nome para as linhas


somaL <- rowSums(matriz_paises) #faz a soma das linhas da matriz matriz_paises
matriz_paises <- cbind(matriz_paises, somaL) #adiciona a soma das linhas como uma coluna nova
somaC <- colSums(matriz_paises) #faz a soma das colunas da matriz matriz_paises
matriz_paises <- rbind(matriz_paises, somaC) #adiciona a soma das colunas como uma linha nova

#endereçamento em matrizes matrix[l,c]

matriz_paises[2:4,c(1,3)] #seleciona as linhas de 2 a 4 e as colunas 1 e 3

#transforma a matriz matriz_paises em um data frame chamado df_paises
df_paises <- data.frame(matriz_paises)

#cria a variavel PAIS no data frame df_paises
df_paises$PAIS <- c("EUA", "Brasil", "Argentina", "Total")

#retorna a estrutura das variáveis do banco df_paises
str(df_paises)

#faz um resumo das variáveis do banco df_paises
summary(df_paises)

#cria a variavel Regiao
df_paises$Regiao <- c("AN", "AL", "AL", NA)

#transforma a variavel região de uma variavel textual para uma variavel categorica
df_paises$Regiao <- factor(df_paises$Regiao)

#retorna os niveis da variavel Regiao
levels(df_paises$Regiao)

#retorna as observações do banco df_paises que na variavel JANEIRO, é maior do que 30
subset(df_paises, JANEIRO > 30)

#retorna as observações do banco df_paises que na variavel JANEIRO, é maior do que 30, e na variavel FEVEREIRO é menor que 500
subset(df_paises, JANEIRO > 30 & FEVEREIRO < 500)

#Cria uma lista de objetos - contendo a matriz_paises e df_paises
lista <- list(matriz_paises, df_paises)
