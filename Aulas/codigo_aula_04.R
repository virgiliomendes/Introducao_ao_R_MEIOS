# Capacitação: Introdução ao R - MEIOS JR
# 25-07-2020
# Virgilio de A. Mendes 
# Ciência Política - UFMG
# Aula 04

# executando a LIBRARY
library(ggplot2)

#definindo diretorio para executar e salvar arquivos
setwd("C:/Users/Virgilio/Desktop/curso GGPLOT/Curso_GGPLOT2_-_Estatística_UFMG_files/Curso GGPLO2 - Stat UFMG")

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




