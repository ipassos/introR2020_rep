library(PNADcIBGE)
library(tidyr)
library(dplyr)
library(caret)


#baixar os microsdados de 2019 dos 4 trimestres - variaveis selecionadas
pnad_1 <- get_pnadc(year=2019, quarter=  1, defyear=2019, defperiod=4,
                    labels=TRUE, vars = c("UF", "Capital", "RM_RIDE", "UPA", "Estrato", "V1008", "V1014", 
                                          "V1016", "V1022", "V1023", "V1027", "V1028",	"V2001",	"V2003",	"V2005",	
                                          "V2007",	"V20082",	"V2009",	"V2010",	'V3001',	"V3002",	'V3002A',	
                                          "V3003A",	"V3007",	"V3008",	"V3009A",	"V4010",	
                                          "V4012",	"V40132A", "V403311", "V403422", "V4039", "V4039C"),  
                    deflator=TRUE, design=TRUE, savedir=tempdir())[["variables"]] 
pnad_2 <- get_pnadc(year=2019, quarter=  2, defyear=2019, defperiod=4,
                    labels=TRUE, vars = c("UF", "Capital", "RM_RIDE", "UPA", "Estrato", "V1008", "V1014", 
                                          "V1016", "V1022", "V1023", "V1027", "V1028",	"V2001",	"V2003",	"V2005",	
                                          "V2007",	"V20082",	"V2009",	"V2010",	'V3001',	"V3002",	'V3002A',	
                                          "V3003A",	"V3007",	"V3008",	"V3009A",	"V4010",	
                                          "V4012",	"V40132A", "V403311", "V403422", "V4039", "V4039C"),  
                    deflator=TRUE, design=TRUE, savedir=tempdir())[["variables"]] 
pnad_3 <- get_pnadc(year=2019, quarter=  3, defyear=2019, defperiod=4,
                    labels=TRUE, vars = c("UF", "Capital", "RM_RIDE", "UPA", "Estrato", "V1008", "V1014", 
                                          "V1016", "V1022", "V1023", "V1027", "V1028",	"V2001",	"V2003",	"V2005",	
                                          "V2007",	"V20082",	"V2009",	"V2010",	'V3001',	"V3002",	'V3002A',	
                                          "V3003A",	"V3007",	"V3008",	"V3009A",	"V4010",	
                                          "V4012",	"V40132A", "V403311", "V403422", "V4039", "V4039C"),  
                    deflator=TRUE, design=TRUE, savedir=tempdir())[["variables"]] 
pnad_4 <- get_pnadc(year=2019, quarter=  4, defyear=2019, defperiod=4,
                    labels=TRUE, vars = c("UF", "Capital", "RM_RIDE", "UPA", "Estrato", "V1008", "V1014", 
                                          "V1016", "V1022", "V1023", "V1027", "V1028",	"V2001",	"V2003",	"V2005",	
                                          "V2007",	"V20082",	"V2009",	"V2010",	'V3001',	"V3002",	'V3002A',	
                                          "V3003A",	"V3007",	"V3008",	"V3009A",	"V4010",	
                                          "V4012",	"V40132A", "V403311", "V403422", "V4039", "V4039C"),  
                    deflator=TRUE, design=TRUE, savedir=tempdir())[["variables"]] 

#unir os 4 bancos em um só
pnad_2019 <- rbind(pnad_1, pnad_2, pnad_3, pnad_4)

#renomear as variávies
pnad_2019 <- pnad_2019 %>% 
                rename(N_SEL_DOM = V1008,
                       PAINEL = V1014,
                       N_ENT_DOM = V1016,
                       SIT_DOM = V1022,
                       TIP_AREA = V1023,
                       PESO_DOM_P_SEM = V1027,
                       PESO_DOM_P_COM = V1028,
                       N_PDOM = V2001,
                       N_ORD = V2003,
                       COND_DOM = V2005,
                       SEXO = V2007,
                       NASC = V20082,
                       IDAD = V2009,
                       RACA = V2010,
                       LER = V3001,
                       FREQ_ESC = V3002,
                       TIP_ESC = V3002A,
                       FREQ_GRAU = V3003A,
                       CONC_GRAD = V3007,
                       ESC_ANT = V3008,
                       GRAU_ESC = V3009A,
                       COD_OCUP = V4010,
                       TIP_TRAB = V4012,
                       AGRI_PEC = V40132A,
                       FX_REND = V403311,
                       REND_BRUT = V403422,
                       HR_TRAB = V4039,
                       HR_EFET = V4039C) 
summary(pnad_2019)

#verificar os níveis de todas as variáveis (as variáveis numéricas retornam "NULL" pq não têm níveis)
lapply(pnad_2019, levels)

#nas variáveis que não estavam como factor aplicar a função factor 
#primeiro cria um vetor "names" e aplica nas colunas que correspondentes
names <- c("UPA", "Estrato", "N_SEL_DOM", "PAINEL", "N_ENT_DOM")
pnad_2019[,names] <- lapply(pnad_2019[,names], factor)
str(pnad_2019)


#seleciona uma amostra das observações, proporcional por estado
set.seed(3456)
part_pnad <- createDataPartition(pnad_2019$UF, p = 0.01,
                                       list = FALSE,
                                       times = 1)

#aplica esse vetor ao banco completo, gerando a amostra
sample_pnad <- pnad_2019[part_pnad,]

#salva em csv o banco
write.csv(sample_pnad, file = "sample_pnad_2019.csv") #aqui vai salvar na pasta que o projeto está 
#se quiserem colocar em outro lugar precisam indicar o endereço inteiro - "C:/pasta/pasta/arquivo.csv"



