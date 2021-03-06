###############################################################
###############   GIARS: Big data Web scrapping ###############
###############################################################
#####################   Neylson Crepalde  #####################
###############################################################
#######################    08-11-2018    ######################
###############################################################
################ Script: Virgilio de A. Mendes ################
################### Ciências Sociais - UFMG ###################
###############################################################
# limpeza de acentos na ortografia dos tweets

setwd("E:/")

# Referência: https://github.com/neylsoncrepalde/big_data_ars

# Remove accent function
# Adapted from https://github.com/harvesthq/chosen/issues/1880
remove_accent = function(x) {
  if (class(x) != "character") stop("Input is not a character")
  
  r = tolower(x)
  r = gsub("[àáâãäå]", "a", r)
  r = gsub("æ", "ae", r)
  r = gsub("ç", "c", r)
  r = gsub("[èéêë]", "e", r)
  r = gsub("[ìíîï]", "i", r)
  r = gsub("ñ", "n", r)                  
  r = gsub("[òóôõö]", "o", r)
  r = gsub("œ", "oe", r)
  r = gsub("[ùúûü]", "u", r)
  r = gsub("[ýÿ]", "y", r)
  return(r)
}

removeURL <- function(x) gsub("(f|ht)tp(s?)://\\S+", "", x)
