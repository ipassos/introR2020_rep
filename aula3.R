library(tidyr)
library(dplyr)
library(ggplot2)
library(forcats)

download.file("https://raw.githubusercontent.com/ipassos/introR2020/main/sample_pnad_2019.csv", "sample_pnad.csv")
download.file("https://raw.githubusercontent.com/ipassos/introR2020/main/lista_estado.csv", "lista_estado.csv")

lista_estado <- read.csv("~/lista_estado.csv", sep=";")
sample_pnad <- read.csv("~/sample_pnad.csv", sep=",")

#faz uma cópia dos bancos - caso tenham algum problema é só rodar essas linhas novamente
sample2 <- sample_pnad
lista2 <- lista_estado

#retira as colunas extras do banco lista
lista2 <- lista2 %>% 
                    select(-X, -X.1, -X.2)

#faz uma uniao dos dois bancos, mantendo as linhas do sample2, e criando as colunas do banco lista no sample2, pelas
#colunas UF no sample2 e Estado no lista2 (variaveis chave para fazer a cópia)
sample2 <- left_join(sample2, lista2, by = c("UF" = "Estado"))

#o banco lista tinha uma variavel UF (que continha informações diferentes que o UF do banco sample2)
#quando foi feito a união com o left_join ele copiou todas as coluans do lista, como tinha uma com nome repetido
#e não era a chave, foi copiado a variável UF (repetida) como UF.y (o y significa que a variavel veio do banco y (lista))
sample2 <- sample2 %>% 
              rename(SIGLA = UF.y)

#outra forma de mudar o nome da variavel - sem o tidyverse
colnames(sample2)[which(colnames(sample2) == "UF.y")] = "Sigla"

#olhando as informações do banco
str(sample2) #mostra as estruturas das variaveis
summary(sample2) #faz um resumo de todas

head(sample2$NASC) #mostra as primeiras observações da variavel

head(sample2$COD_OCUP)  #mostra as primeiras observações da variavel

#muda as variaveis Ano e NASC para númerica e Trimestre para categorica
sample2 <- sample2 %>% 
              mutate(Ano = as.numeric(Ano),
                     NASC = as.numeric(NASC),
                     Trimestre = factor(Trimestre))

#mostra uma tabela de frequencia das categorias da variavel
table(sample2$TIP_AREA) 

#agrega as 4 categorias da variavel TIP_AREA em apenas 2, não substituindo a variavel original, criando uma nova 
sample2 <- sample2 %>% 
              mutate(TIP_AREA2 = fct_collapse(TIP_AREA, "RM" = c("Capital", "Resto da RM (Região Metropolitana, excluindo a capital)"),
                                              "Não RM" =  c("Resto da RIDE (Região Integrada de Desenvolvimento Econômico, excluindo a capital)", 
                                              "Resto da UF  (Unidade da Federação, excluindo a região metropolitana e a RIDE)")))

##gráficos base
hist(sample2$IDAD) #histograma da variavel idade

boxplot(sample2$IDADE) #boxplot da variavel idade
boxplot(sample2$IDAD, col = "red")

#grafico de dispersão da variavel renda bruta com idade
plot(sample2$REND_BRUT, sample2$IDAD, main = "titulo", xlab = "renda", ylab = "idade") #altera o nome dos eixos e o titulo

#cria um banco agrupado por UF, com a media da renda e da idade das mulheres em cada estado
idad_rend_est <- sample2 %>% 
  group_by(UF) %>% 
  filter(SEXO == "Mulher") %>% 
  filter(!is.na(SEXO)) %>% 
  summarise(
    idade = mean(IDAD),
    renda = mean(REND_BRUT, na.rm = TRUE)) %>% 
  arrange(desc(renda))




