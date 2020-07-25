# Capacitação: Introdução ao R - MEIOS JR
# 25-07-2020
# Virgilio de A. Mendes 
# Ciência Política - UFMG
# Aula 01

# TOPICOS:

#         - Ambiente do RStudio
#              * Funções
#                  * Recursos do RStudio (ferramentas, etc)
# 
#         - Operações Básicas
#         - Objetos (classe e tipos de dados)
#         - Estatísticas e investigações do banco de dados
    
# operações básicas 

5 + 7 # soma
5 - 2 # subtração
5 * 2 # multiplicação
5 / 2 # divisão
5 %/% 2 # divisão inteira
5 %% 2 # resto da divisão


##########################################################################

# sinal de atribuição
x <- 5
x

y = 5
y

# operações com objetos
x + y 
x * y
x / y

##########################################################################
# Vetores

x = c(6, 8, 10, 3) # comnado c() cria um vetor - função concatenar
y = c(4, 6, 3, 5) 

# operações com vetores devem ter vetores com o mesmo munero de elementos
x + y # operações com vetores
x - y
x * y
x / y

##########################################################################

# comando para saber a classe do dado/vetor/conjunto
class(x)
# x é classe numeric = números que assumem casas decimais

##########################################################################

# dados do tipo character (texto)
nome = "Virgilio"
sobrenome = "Mendes"

# chamando o objeto
nome
sobrenome
# chamando a classe do objeto nome
class(nome)

##########################################################################

# funções básicas para manipulação de texto

# paste mostra objeto no console
paste(nome, sobrenome)

p1 = "Eu"
p2 = "gosto"
p3 = "de"
p4 = "café"

paste(p1, p2, p3, p4)

# usando paste e separador com ,
paste(p1, p2, p3, p4, sep = ",")


frase = paste(p1, p2, p3, p4) # criando objeto da frase a partir do paste
tolower(frase) # todos os caracteres em minusculo
toupper(frase) # todos os caracteres em maiusculo
frase

grep("não!", frase) # função de buscar padrões de texto
grep("gosto", frase)

gsub("de", "DE", frase) # função de substituição de caracteres (substituição de "de" por "DE")

# estas são estruturas unidimencionais, vetores, 
# que conjuntos de dados de apenas uma dimensão

##########################################################################

# Linhas e colunas - Estruturas de dados bidimensionais

# Matrizes e bancos de dados
A = matrix(data = 1:16, nrow = 4, ncol = 4)
A # criando matrix 4 por 4 (numeros de 1 a 16)

# transpor matriz (APENAS QUANDO EXTREMAMENTE NECESSÁRIO!!!!!)

##########################################################################

# Bancos de dados ou data.frames
nome = c("Neylson", "Ana", "Virgilio", "Renan", "Carol")
idade = c(32, 25, 47, 34, 19)
altura = c(1.74, 1.65, 1.76, 1.86, 1.95)
time = c("America", "America", "Cruzeiro", NA, "Atlético")

# criando banco de datos a partir dos vetores acima
dados = data.frame(nome, idade, altura, time,
                   stringsAsFactors = FALSE)




#-----------------------------------------------

# Análises

#install.packages("dplyr")
library(dplyr) # A Grammar of Data Manipulation

#install.packages("questionr")
library(questionr) # Functions to Make Surveys Processing Easier

#install.packages("ggplot2")
library(ggplot2) # Para gráficos mais elaborados

# link: https://CRAN.R-project.org/package=dplyr
# link: https://CRAN.R-project.org/package=questionr 


# Usando Banco de dados inato do R: Iris

# Carrega banco
iris = iris

# dimensões do banco de dados
dim(starwars) 

# nomes das variaveis
names(starwars) 

# operador dollar para direcionar variavel do banco de dados
starwars$name 

# apresenta os seis primeiros casos da variavel
head(starwars$name)

# apresenta os seis ultimos casos da variavel
tail(starwars$name) 

## Para saber as classes de todas as variaveis 
# a Função SAPPLY aplica a função class() em todas as colunas
# do banco de dados starswars de uma vez
sapply(starwars, class)
lapply(starwars$name, class)


# Tira frequencia da variavel do banco
freq(iris$Species) 

# Tira Classe da variavel
class(iris$Species)

# Tira média da variavel heigth, removendo os NA's usando na.rm
mean(starwars$height, na.rm = T) 

# Tira mediana da variavel heigth, removendo os NA's usando na.rm
median(starwars$height, na.rm = T) 

# Tira desvio padrão da variavel heigth, removendo os NA's usando na.rm
sd(starwars$height, na.rm = T) 

# Tira gráfio de barras simples
barplot(table(starwars$gender))


options(scipen = 999) # tira notação científica

rm(list = ls()) # limpa tudo 


 




