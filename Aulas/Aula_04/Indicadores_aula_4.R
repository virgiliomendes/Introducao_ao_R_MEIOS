##########################################################################
##################### Virgilio de Araujo Mendes ##########################
####################### Curso de Indicadores no R ########################
############################### Aula 4 ###################################
############################ 18 / 10 / 2019 ##############################
##########################################################################

# Vamos criar uma nova variavel corbinaria a partir dos casos de 
# V2010, vamos ignorar indigenas

bd = bd %>% 
  mutate(corbinaria = case_when(
    V2010 == "Branca" ~ "Branco",
    V2010 == "Amarela" ~ "Branco",
    V2010 == "Preta" ~ "Negro",
    V2010 == "Parda" ~ "Negro"
  ))


table(bd$corbinaria)
table(bd$corbinaria, bd$V2010)


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

