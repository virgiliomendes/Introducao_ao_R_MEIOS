##########################################################################
##################### Virgilio de Araujo Mendes ##########################
####################### Curso de Indicadores no R ########################
############################### Aula 2 ###################################
############################ 16 / 10 / 2019 ##############################
##########################################################################

# carregando os pacotes
library(readxl)
library(dplyr)
library(questionr) # tabela de frequencia e processamento simples
library(ggplot2) # visualização de dados
library(janitor) # processamento e limpeza de dados para importação e formatação
library(lubridate) # processamento de informação para data
library(ggrepel) # representação de valor nos gráficos
library(ggthemes) #temas para ggplot


# importando o banco de dados
bd = read_excel("/home/virgilioam/Desktop/Indicadores no R/dados_juridicos.xlsx")
# quando há mais de uma sheet ou aba no arquivo excel, usar o comando ", sheet = <nome.da.aba>"

# comando para visualizar o banco
View(bd)
bd %>% View()

# comando para mostrar os nomes das variáveis
names(bd)

# comando para mostrar a classe de uma determinada variavel
class(bd$`Pólo do Cliente`)

# comando para 
table(bd$`Pólo do Cliente`)
freq(bd$`Pólo do Cliente`)

bd$`Pólo do Cliente` = as.factor(bd$`Pólo do Cliente`)
bd$Matéria = as.factor(bd$Matéria)
bd$Prognóstico = as.factor(bd$Prognóstico)
bd$Trâmite = as.factor(bd$Trâmite)
bd$Corte = as.factor(bd$Corte)
bd$Decisão = as.factor(bd$Decisão)

# função para limpar os characteres do pacote janitor
bd = clean_names(bd)
names(bd)

##########################################################################

# Passo - Análise exploratória de Dados

# função para puxar os seis primeiros casos do banco
head(bd$data_de_entrada_do_processo)

# função para tirar tabela de frequência simples da variavel
freq(bd$polo_do_cliente)
freq(bd$materia)
freq(bd$prognostico)
freq(bd$tramite)
freq(bd$corte)
freq(bd$decisao)

# construindo uma tabela ordenada com função freq
t = freq(bd$corte)
t
class(t)

# Na logica tidy
# %>%  -> separador -> encadear ações
# atalho -> CTRL + SHIFT + M
# Começo com o banco de dados

t %>% 
  mutate(corte = rownames(t)) %>% # cria uma nova coluna
  select(corte, n , `%`, `val%`) %>%  # seleciona colunas na ordem especifica
  arrange(desc(n))


##########################################################################

# Cruzamentos de variaveis
t1 = table(bd$polo_do_cliente, bd$prognostico) # tabela de numeros absolutos

# para calcular percentual
prop.table(t1)*100 

# para calcular 100% fechando na linha, 
# usamos o parâmetro margin = 1
round(prop.table(t1, margin = 1)*100, 2) # o numero 2 


# Testando hipotese:
# Estou melhor ou pior nos processos em que sou Autor ou Reu 
# Vamos usar o teste Qui Quadrado (Chi Square)
chisq.test(t1)
# Teste Qui-Qua. de Pearson: calculada com 2.75, com df (graus de liberdade)=2 , 
# com p-valor (maior ou menor do que 0,05 - significativo ou não)

# Cruzando a materia e o polo do cliente

t2 = table(bd$materia, bd$polo_do_cliente)
t2

round(prop.table(t2, margin = 2) * 100, 2)

## Chi Sq
chisq.test(t2)

# Pearson's Chi-squared test
# 
# data:  t2
# X-squared = 155.71, df(grau de liberdade) = 3, p-value (<0,05 é significativo)
# < 2.2e-16


##########################################################################

# Manipulação de dados
freq(bd$data_de_entrada_do_processo) %>% 
  pull(n) %>%  mean

# vamos trabalhar com ANO (data)
class(bd$data_de_entrada_do_processo)

# cria uma variavel chamada ANO no bd
bd = bd %>%
  mutate(ano = year(data_de_entrada_do_processo))

bd %>%
  select(data_de_entrada_do_processo, ano) # seleciona variaveis para trabalhar

# Quero saber quantos processos temos por ano
bd %>% 
  group_by(ano) %>% 
  summarise(contagem = n()) # executa ações para dados agrupados

# Histograma para verificar a distribuição para processo de criação
bd %>% 
  ggplot(aes(ano)) +
  geom_histogram(bins = 10, col = "white") + 
  labs(title = "Processos por ano", subtitle = "Para os processo jurídicos",
       x = "Ano", y = "Número de Processos") +
  theme_bw()

# Grafico de quantos processos em uma linha do tempo

bd %>%  # começo com o bd
  group_by(ano) %>%  # agrupo por ano
  summarise(contagem = n()) %>% # contagem por ano
  ggplot(aes(ano, contagem)) + #
  labs(title = "Processos por ano", subtitle = "Para os processo jurídicos",
       x = "Ano de criação", y = "Número de Processos", 
       caption = "source: Virgilio Mendes") +
  theme_bw() +
  geom_line(size = 1) + # camada de linha
  geom_point(size= 2) + # camada de pontos
  geom_text_repel(aes(label = contagem)) +
  scale_fill_brewer("Dark2")

# Pizza
bd %>% 
  group_by(materia) %>% 
  summarise(contagem= n()) %>% 
  ggplot(aes(materia, contagem,
             fill = materia)) +
  geom_col() +
  scale_fill_canva() +
  coord_polar() +
  theme_minimal() +
  theme(legend.position = "none") +
  labs(x="", y="") +
  theme(axis.text.y = element_blank()) +
  geom_text_repel(aes(label=contagem, family = "Calibri"))










