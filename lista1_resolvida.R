###################### ESCOLA DE MÉTODOS E FERRAMENTAS TECNOLÓGICA PARA PESQUISA EM POLÍTICAS PÚBLICAS – Edição I #######################
################################################################ LISTA 1 ################################################################
######################################################## INTRODUÇãO AO R - 2020 #########################################################


################################################################ BLOCO 1 ################################################################
################################################### Criação e manipulação de variáveis ################################################## 

#1 - Crie 3 três objetos que armazena: 
#1) o teu ano de nascimento, 
ano <- 1991
#2) o ano atual, 
agora <- 2020
#3) a diferença entre o ano atual e o teu ano de nascimento. 
idade <- agora - ano
idade

#2 - Pergunte para o R qual é a classe do objeto criado no exercício anterior
class(idade)
typeof(idade)

#3 - Substitua a variável ano de nascimento por um outro ano. O que acontece com as outras variáveis? 
# Se eu quero mudar a variável da diferença entre os anos o que preciso fazer?
ano <- 1964
idade <- agora - ano

################################################################ BLOCO 2 ################################################################ 
################################################################ Vetores ################################################################
# função mean() - média
# função sum() - soma
# função sd() - desvio padrão
# função min() e max() - mínimo e máximo
# função range() - intervalo

#4 - Crie 3 tipos de vetores de tamanho 5: um numérico, um textual e um lógico
vet_num <- c(1, 2, 3, 4, 5)
vet_char <- c("1", '2', "3", "4", "5")
vet_log <- c(T, F, TRUE, FALSE, F)

#5 - Utilizando a tabela anexa (Tabela 1.png) crie 3 vetores, um referente a cada país da tabela (os números representados em vermelho na tabela são referentes a números negativos)
eua <- c(-1000, 1200, -2500, 8794, -1547)
brasil <- c(5000, -5467, 6741, -5174, -5411)
argentina <- c(-2500, 5147,-2418, 8964, 5371)

#6 - Crie um novo vetor que seja a soma dos 3 vetores países criados anteriormente
soma_paises <- eua + brasil + argentina

#7 - Dê nomes aos meses de cada vetor (incluindo o vetor soma). 
# utilize a função names() - referência: https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/names
vetor_meses <- c("JANEIRO", "FEVEREIRO", "MARÇO", "ABRIL", "MAIO")
names(eua) <-vetor_meses
names(brasil) <-vetor_meses
names(argentina) <-vetor_meses
names(soma_paises) <-vetor_meses

#8 - Faça a soma das colunas. Armazene cada soma em uma nova variável 
#(inclusive do vetor soma). 
soma_eua <- sum(eua)
soma_br <- sum(brasil)
soma_ar <- sum(argentina)
total <-  sum(soma_paises)

#9 - Verifique se o mês de janeiro dos EUA tem valor maior que o 
#mesmo mês do Brasil. 
eua[1] > brasil[1]
eua["JANEIRO"] > brasil["JANEIRO"]

#10 - Verifique se o mês de março do Brasil é igual ao da Argentina
brasil[3] == argentina[3]
brasil["MARÇO"] == argentina["MARÇO"]

#11 - Verifique se a soma da Argentina é diferente da soma dos EUA
soma_br != soma_ar

#12 - Selecione o valor de fevereiro e abril do BR. Atribua a uma variável. 
fevabr <- brasil[c(2,4)]
brasil[2:4]

#13 - Selecione os meses de fevereiro a abril da Argentina


#14 - Selecione os três primeiros elementos do EUA usando os nomes dos meses. Atribua a uma variável

#15 - Calcule a media dos valores dos EUA. 
mean(eua)

#16 - Verifique qual dos valores do Brasil é positivo. E quais são negativos. Atribua os dois resultados a uma nova variável 
pos_br <- brasil >= 0
pos_br
#17 - Descubra quais meses são "TRUE" em cada uma das variáveis criadas no exercício anterior. 
which(pos_br == TRUE)
which(pos_br == FALSE)
#18 - Descubra o desvio padrão, o valor maximo e minimo, o intervalo e o desvio padrao de vetores a sua escolha (dentre os vetores paises). 

