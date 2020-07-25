##########################################################################
##################### Virgilio de Araujo Mendes ##########################
####################### Curso de Indicadores no R ########################
############################### Aula 3 ###################################
############################ 17 / 10 / 2019 ##############################
##########################################################################

# instalando e carregando os pacotes
#install.packages("PNADcIBGE")
library(PNADcIBGE)
library(dplyr)
library(ggplot2)
library(questionr)

# comando para importar a pnad contínua de 2019 - 2 trimestre
pnad = get_pnadc(2019, 2,
                 vars = c("Ano", "Trimestre", "UF", "Capital",
                          "UPA", "Estrato", "V1022", "V1028",
                          "V2007", "V2009", "V2010", 
                          "VD3005", "VD4016", "VD4019", "VD4031"))
pnad
class(pnad)

# pacote chamado survey design
library(srvyr)

# transformando o banco da pnad em tibble

bd = pnad$variables %>% as_tibble()

# chama o banco 
bd

# dimensões do banco
dim(bd)


#
bd %>%
  select(V2007:VD4031)

# transforma anos de escolaridade em nunerica
head(bd$VD3005) %>% as.numeric()
# temos um problema nas categorias, ja que o r entende que quem não é escolarizado
# possui 1 ano de escolarização, sendo necessario subtrair um ano para cada
# contabilização

# criar anoesesco com valores corrigidos
bd$anosesco = as.numeric(bd$VD3005) - 1
summary(bd$anosesco)

# V2010 - cor da pele
freq(bd$V2010)

# transforma bd$V2010 em character
bd$cor = as.character(bd$V2010)

bd$cor = ifelse(bd$V2010 == "Ignorado", NA, bd$cor)
freq(bd$cor)
# nos casos que BD 2010 for igual a "Ignorado" transforme em NA, senão a 
# variável mantem o valor


# criando a variavel binaria branco
# se a variavel bd$cor for a Branca ou se a variavel bd$cor
# for igual a Amarela, atribua Branco. Senão, atribua Negro
bd$branco = ifelse(bd$cor == "Branca" | bd$cor == "Amarela", "Branco", "Negro")

table(bd$cor, bd$branco)

# Insvestigações

# Estatíticas descritivas de renda # sem considerar os pesos

summary(bd$VD4019)

# Tirar subamostra da pnad
# entre 25 e 60 anos (apenas a PEA)
summary(bd$V2009)
bd = bd %>% 
  filter(V2009 > 24 & V2009 < 61)



# Renda para pessoas entre 25 e 60 anos
summary(bd$V2009) # lembrando que no comando acima ja foi 
# selecionado a faixa de idade 

# As diferenças de renda entre homens e mulheres
bd %>% 
  group_by(V2007) %>% 
  summarise(medrenda = mean(VD4019, na.rm = T))
table(bd$V2007)
# Vamos aplicar um teste t para verificar se a diferença 
# de salario entre homens e mulheres no Brasil
# pode ser inferida para a população
t.test(VD4019 ~ V2007, data = bd)


# Renda por Branco / Negro (cor agregada)
bd %>% 
  group_by(branco) %>% 
  summarise(merenda = mean(VD4019, na.rm = T))
# Vamos aplicar um teste t para verificar se a diferença 
# de salario entre brancos e negros no Brasil
# pode ser inferida para a população
t.test(VD4019 ~ branco, data = bd)

# Renda por  cor da pele
bd %>% 
  group_by(cor) %>% 
  summarise(merenda = mean(VD4019, na.rm = T))

# tirando ANOVA - teste de diferença de variança
rea_anova = aov(VD4019 ~ cor, data = bd)
summary(rea_anova)

# Correlação de Bonferroni - Famosa correção de Bonferroni
pairwise.t.test(bd$VD4019, bd$cor, p.adjust.method = "bonferroni")
# compara cada categoria entre as variaveis e suas diferenças entre medias

# Comparando  médias de renda por sexo e cor
bd %>% 
  group_by(V2007, cor) %>% 
  summarise(merenda = mean(VD4019, na.rm = T))



# Boxplot para renda
bd %>% 
  ggplot(aes(x=1, y=VD4019)) +
  geom_boxplot() +
  scale_y_continuous(limits = c(0, 3000))

# Box plot colorido
bd %>% 
  ggplot(aes(x=V2007, y=VD4019,
             fill = V2007)) +
  geom_boxplot() +
  scale_y_continuous(limits = c(0, 3000)) +
  scale_fill_manual(values = c("green", "purple"))

# Mostrando a renda por sexo
bd %>% 
  ggplot(aes(x=VD4019,
             fill = V2007)) +
  geom_histogram() +
  scale_x_continuous(limits = c(0, 3000)) +
  scale_fill_manual(values = c("green", "purple")) # defina as cores manualmente

# Para renda e cor
bd %>% 
  filter(!is.na(cor)) %>% # filtra todos os casos que não são NA (NA's são omitidos)
  ggplot(aes(x=cor, y=VD4019,
             fill = cor)) +
  geom_boxplot() +
  scale_y_continuous(limits = c(0, 3000)) +
  facet_wrap(~V2007)











