#Pacotes

# Para instalar pacotes: install.packages(nomepacote)
# Para chamar o pacote (precisa ser feito toda vez que inicia uma sessão:
# library("nomepacote")
# Para citar o pacote citatio("nomepacote")

################
# Atribuição de varíáveis

x <- 2 #atribui o valor 2 a variável x

x + 5 #soma 5 a variável x - NÃO está atribuindo novo valor a variável x

x <- 3 #atribui o valor 3 a variável x, substituindo o valor já existente

y <- x * 3 #atribui o valor x * 3 a variável y

# Operações matemáticas

2 + 2 # soma
2 - 5 # subtração
2 / 3 #divisão
2 ^ 2 # potÊncia
2 %% 3 # resto da divisão
2 %/% 3  #inteiro da divisão

# Operadores relacionais
# Aqui, o R sempre retorna TRUE ou FALSE

2 < 3 #menor
x > 3 #maior
2 <= 3 #menor igual
2 >= 3 #maior igual
2 != x #diferente

#Nome de variáveis
#R é case sensitive, ou seja, x é diferente de X

x
X

nome <- "meu nome é Iara"

x <- 2 # variável do tiponumérica
a <- "2 + 2" # variável do tipo char
b <- 2 + 2 # variável do tipo numérica, resultado da soma de 2 + 2

g <- FALSE #variável do tipo lógica

g == TRUE #comparação - g é igual a TRUE?



# operadores lógicos

x <- 2
y <- 3

x < 3 | y > 2 # x é menor do que 3 ou y é menor do que 2?
# Para o OU, basta UM valor ser TRUE para ele retornar TRUE

x < 3 & y < 2 # x é menor que 3 e y é menor do que 2?
# No E todos os valores precisam ser verdadeiros. Se UM for FALSO irá retornar FALSE

# Vetores 
# Vetores só conter dados do mesmo tipo 
vetor_num <- c(2, 4, 6, 34, 6) #atribui um vetor numérico
vetor_char <- c("a", "b", "c") #atribui um vetor de char
vetor_log <- c(F, T, F, T, F, F) #atribui um vetor lógico

#Enderaçamento
# [] referem-se a localizações dentro do vetor - as "casinhas" 

vetor_num[3] #retorna o valor que está dentro da "casa" 3 do vetor de nome vetor_num

#Caso seja criado um vetor com valores de tipos diferentes, o R irá coági-lo a ser de um tipo só. 
# Prevalece sempre o do tipo CHAR, depois numérico e depois lógico

vetor <- c("a", 5, F)
vetor2 <- c(5, 5, F)

class(vetor) #retorna o tipo de classe do objeto


vetor_num <- c(2, 4, 6, 34, 6)
vetor2 <-    c(5, 5, T)

vetor_num + vetor2 #soma de vetores de tamanhos diferentes 

