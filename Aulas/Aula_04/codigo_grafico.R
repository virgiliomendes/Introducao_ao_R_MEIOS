###############################################################
########################   Media Bias  ########################
###############################################################
#######################    02-07-2019    ######################
###############################################################
################ Script: Virgilio de A. Mendes ################
################### Ciências Sociais - UFMG ###################
###############################################################
######################### MODUS 2019 ##########################
###############################################################

# instalando os pacotes

#install.packages("ggplot2")
library(ggplot2)

# quando o pacote está no CRAN
ggplot(data= NULL, mapping = aes())

# criando uma base de dados
alunos <- data.frame(area = c("CP", "Edu", "Comunicao", "Socio", "GP", "Adm"),
                     quanti = c(16, 1, 2, 4, 3, 1))
# a função de criação de banco de dados é data.frame -> nela foram criados dois vetores
# area e quanti e foi inserido cada elemento nos vetores a fartir da função C (concatenar)

View(alunos)

ggplot(data = alunos, mapping = aes(area, quanti)) +
       geom_bar(aes(area, quanti), stat = "identity", fill= "#1863db") +
  theme_classic() +
  labs(title = "Alunos MODUS",
       x = "Área de Conhecimento",
       y = "N Alunos") +
  geom_text(aes(label = quanti),
            color = "black", size = 3.5,
            vjust = 1.6) +
  scale_y_continuous(limits = c(0, 30))

# função do geom_text funciona para colocar dados textuais na area de plotagem das barras
# função scale_y_continuous serve para colocar a escala, no caso do eixo y


# salvando grafico 

ggsave ("alunos.png")
# ggsave("alunos.png", width = , height = )

setwd("/home/virgilioam/Área de trabalho/Modus 2019/")

# extensões para o ggplot: https://www.ggplot2-exts.org/
install.packages("gganimate")




#remover os vetores e objetos presentes no "Environment"

rm(list = ls())
