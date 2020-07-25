# Capacitação: Introdução ao R - MEIOS JR
# 25-07-2020
# Virgilio de A. Mendes 
# Ciência Política - UFMG
# Aula 04


# carregando os pacotes
library(readxl)
library(dplyr)
library(questionr) # tabela de frequencia e processamento simples
library(ggplot2) # visualização de dados
library(janitor) # processamento e limpeza de dados para importação e formatação
library(lubridate) # processamento de informação para data
library(ggrepel) # representação de valor nos gráficos
library(ggthemes) #temas para ggplot
#install.packages("rlist")
library(rlist) # para trabalhar com listas


# importando o banco de dados IRIS e nomeando ele de BD
bd = iris

#Plotando um grafico de dispersão 
ggplot(bd, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point(size = 2, shape = 1)

#salva grafico no diretorio selecionado
ggsave("r plot1 iris.pdf")

# puxa os nomes das variaveis do banco selecionado
names(bd)

#Plotando um grafico de dispersão 
ggplot(bd, aes( x = Sepal.Length, y = Sepal.Width, col = Species)) +
  geom_point(size = 2, shape = 1) 

ggsave("r plot2 iris.pdf")

# bloxpot
ggplot(bd, aes(x = Species, y = Sepal.Width)) +
  geom_boxplot()

ggsave("r plot3 iris.pdf")


#plotando histograma
ggplot(bd, aes(x = Sepal.Length,fill = factor(Sepal.Length))) + 
  geom_histogram(bins = 10, col = "white")

ggsave("histograma1.pdf")

#Grafico de densidade
ggplot(bd, aes(x = Sepal.Length, fill = Species)) +
  geom_density(alpha = 0.5) 

ggsave("grafico camadas1.pdf")

#Grafico de Linha
ggplot(swiss, aes(x = Examination, y = Education)) +
  geom_line(size = 1)

ggsave("grafico de linha IRIS1.pdf")

#Histograma com Nomes (titulos)
ggplot(iris, aes(x = Sepal.Length)) + geom_histogram(bins = 10, col = "white") +
  labs(title = "Histograma de Comprimento da Sépala",
       subtitle = "Gráfico", x = "Comprimento da Sépala",
       y = "Frequência")

ggsave("Histograma Comprimento da Sepala1.pdf")

# Plotando com "Stats"
ggplot(bd, aes(sample = Sepal.Width)) +
  stat_qq()

ggsave("grafico IRISstats.pdf")

#Grafico de dispersão - Stats com escala
ggplot(bd, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  scale_x_continuous(limits = c(4, 7), breaks = c(4, 5, 6)) +
  scale_y_continuous(limits = c(0, 7), breaks = c(4, 5, 6)) +
  labs(title = "Grafico de Dispersão de Comprimento da Sépala por Largura da Sépala",
       subtitle = "Gráfico", x = "Comprimento da Sépala",
       y = "lagura da Sépala")

ggsave("dispersãoIRIS1.pdf", width = 8, height = 4)


#Geom_ Smooth - grafico de tendencia
ggplot(bd, aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point() +
  geom_smooth()

ggsave("grafico de tendencia1.pdf")

# grafico de tendencia por especie
ggplot(bd, aes(x = Sepal.Length, y = Petal.Length, col = Species)) +
  geom_point() +
  geom_smooth(method = "lm")

ggsave("grafico de tendencia por especie.pdf")

####################################################

# Importando o banco MTCARS
mtcars = mtcars

#Puxando os nomes das variaveis
names(mtcars)
ggplot(mtcars, aes( x = gear, fill = factor(carb))) +
  geom_bar(size = 1.5, colour = 'white', alpha = 0.6) 

ggsave("mtcars1.pdf")

# Plotando   
ggplot(mtcars, aes( x = gear, fill = factor(carb))) +
  geom_bar(position = "fill") 

ggsave("mtcars2.pdf")



#Facets- tirar a escala do X e Y
ggplot(mtcars, aes(x = mpg, y = disp)) + geom_point() +
  facet_grid(.~am, scales = "free") +
  geom_smooth(method = "lm") 

ggsave("Mtcarsvertical.pdf")
#Facets- tirar a escala do X e Y
ggplot(mtcars, aes(x = mpg, y = disp)) + geom_point() +
  facet_grid(am~., scales = "free") +
  geom_smooth(method = "lm")

ggsave("MtcarsHorizontal.pdf")

# o "~." depois do AM separa duas categorias discretas na horizontal
# o ".~" antes do AM separa duas categorias discretas na vertical




#################
# como salvar arquivos de grafico pelo ggplot
ggsave(filename = "grafico.png",
       width = 6, height = 2.8)

# Personalizando o grafico

#tipos de  temas para plotagem de grafico
# + themes_gray ()
# + theme_dark ()
# + theme_bw ()
# + theme_classic ()


# Legendas:

# + theme (legend.positions = "top")


# Paleta de cores:
library(RColorBrewer)
display.brewer.all()


# + scale_fill_brewer(palette = "Dark2") - > substituir "Dark2" pela paleta de cor que desejar




# Teste de BoxPlot

# bloxpot
ggplot(bd, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_boxplot() +
  theme_classic() +
  scale_fill_brewer(palette = "Set1",
                    labels=c("Setosa", "Versicolor", "Virginica")) +
  scale_x_discrete(lab=NULL) +
  labs(title = "Boxplot", subtitle = "Largura da Pétala por Espécie",
       x = "", y = "Lagura da Pétala", fill = "Especie") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5)) 


ggsave("bloxpotEXERCICIO.pdf", width = 6, height = 4)



#------------------------------------------------------------------

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


# Vamos fazer um gráfico mostrando a distribuição da nossa variavel
# corbinaria por sexo apenas no estado de MG

bd %>% 
  filter(UF == "Minas Gerais" &
           !is.na(corbinaria)) %>%
  group_by(corbinaria, V2007) %>% 
  summarise(contagem = n()) %>% 
  ggplot(aes(x = corbinaria, fill = V2007,
             y = contagem)) +
  geom_col(position = "dodge") +
  scale_fill_brewer(palette = "Set1",
                    name = "Sexo") +
  labs(x="Cor da pele", y= "Frequência",
       title = "Gráfico de barras") +
  geom_text(aes(label = contagem),
            position = position_dodge(width = 1),
            vjust=.0001) +
  theme_economist()

#------------------------------------------------------------------

## Usando Loop for

# Em portugues:
# PARA cada ITEM DENTRO de um CONJUNTO {
# EXECUTE ISTO
# }
for (item in 1:10) {
  cat(item, "\n")
}


#  função print retorna sempre um vetor (se não quiser isso use função cat)
for (i in 1:10) {
  res = sqrt(i^3) + i*4
  print(res)
}

# usando a função cat
for (i in 1:10) {
  res1 = sqrt(i^3) + i*4
  cat(res1, "\n")
}

# usando loop for e guardando em um objeto
resultados = c()

for (i in 1:1000000) {
  res2 = sqrt(i^3) + i*4
  resultados = c(resultados, res2)
}
resultados
plot(resultados, type = "l")


# tirar uma tabela de frequencia de sexo filtrando para cada estado
tabelas = list()
for (estado in unique(bd$UF)) {
  t = bd %>% 
    filter(UF == estado) %>% 
    group_by(V2007) %>% 
    summarize(contagem = n()) %>% 
    mutate(total= sum(contagem),
           perc = round((contagem/total)*100, 2)) %>% 
    as.data.frame()
  writexl::write_xlsx(t, paste(estado, ".xlsx", sep = ""))
  
}

#install.packages("rlist")
library(rlist) # para trabalhar com listas


tabelas = list()
for (estado in unique(bd$UF)) {
  t = bd %>% 
    filter(UF == estado) %>% 
    group_by(V2007) %>% 
    summarise(contagem = n()) %>% 
    mutate(total= sum(contagem),
           perc = round((contagem/total)*100, 2)) %>% 
    as.data.frame()
  tabelas = list.append(tabelas, t)
  
}
tabelas

names(tabelas) = unique(bd$UF)

tabelas

#writexl::write_xlsx(tabelas, "tabelas_estados.xlsx")

# Graficos
dir.create("grafico")
for (estado in unique(bd$UF)) {
  bd %>% 
    filter(UF== estado) %>% 
    filter(!is.na(cor)) %>% 
    ggplot(aes(x=cor, y=VD4019, fill=V2007)) +
    geom_boxplot() +
    scale_y_continuous(limits = c(0, 3000)) +
    theme_light() +
    scale_fill_manual(values = c("#ff00ff",
                                 "#7FFFD4"),
                      name = "Sexo") +
    labs(x="Cor de Pele", title = "Renda por cor - Minas Gerais", 
         y = "Renda Total") +
    theme(axis.text.x = element_text(angle = 45,
                                     hjust = 1),
          legend.position = "bottom")
  ggsave (paste0("grafico/grafico_", estado, ".png"),
          height = 6, width = 10, dpi=100)
}

