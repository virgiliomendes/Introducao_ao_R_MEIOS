# Capacitação: Introdução ao R - MEIOS JR
# Virgilio Mendes
# 27/07/2020
# Aula 01

# Para dúvidas, consultar a comunidade: https://stackoverflow.com/

# Operações básicas

# soma
5 + 7

# subtração
40 - 30

# multiplicação
80 * 2

# divisão
50 / 2

# divisão inteira
5 %/% 2

# resto da divisão
5%%2

#-------------------------------------

# sinal de atribuição 

# atribuindo ao objeto X o valor 1
x <- 1
x

# atribuindo ao objeto y o valor 2
y = 2
y

# atribuindo a z o resultado da subtração
z = 40 - 30
z

# soma de objetos
x + y

2 * z

# atribuindo a um objeto ob1 o resultado da divisão
ob1 = z / y
ob1


#-------------------------------------


# remove o objeto x do enviroment
rm(x)


# removem todos os objetos do enviroment
rm(list = ls())

rm(list = ls(all=T))

# help para função remove (rm)
?rm
#-------------------------------------

# tira a classe
class()

# Funções básicas para manipulação de textos

# atribuindo dados textuais a um objeto
nome = "Eduardo"
sobrenome = "Tamaki"

nome
sobrenome

# printando objetos
paste(nome, sobrenome)


# Atribuição de textos em objetos
ob1 = "Eu"
ob2 = "gosto"
ob3 = "de"
ob4 = "café!"


q <- paste(ob1, ob2, ob3, ob4, sep = " ")

q

# deixa tudo em minusculo
tolower(nome)

# deixa tudo maiusculo
toupper(nome)

# busca padrões textuais
grep("escola", q)

grep("café", q)

# substituição de caracteres
gsub("gosto", "odeio", q)


#-------------------------------------

# importando banco de dados
library(readxl)
library(questionr)

bd = read_excel("Base de dados - CACS LINGUAS.xlsx", sheet = 1)

names(bd)
bd$v4 = as.factor(bd$v4)
class(bd$v4)
summary(bd$v3)
freq(bd$v6)

bd$v6[bd$v6=="Ensino superior completo"] = "Barba"
bd <- na.omit(bd)



