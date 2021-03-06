setwd("/cloud/project/TripAdvisor")

install.packages("readr")
install.packages("cluster")
install.packages("fpc")
install.packages("dplyr")
install.packages("corrplot")

library(fpc)
library(cluster)
library(readr)
library(dplyr)
library(corrplot)

# Leitura do arquivo e análise inicial dos dados

tripadvisor_review <- read_csv("tripadvisor_review.csv")

df <- tripadvisor_review

str(df)

colSums(is.na(df))

# EXERCÍCIO
# Use um algoritmo de agrupamentos (clusterização) que apresente uma
# segmentação destes dados. Tente interpretar estas informações com base
# em seus conhecimentos, exemplos:

#   • Quais grupos de itens agradam mais?

df_analise <- df
df_analise$`User ID` <- NULL
sapply(df_analise,mean)
sapply(df_analise,median)

# Resposta: As categorias 7, 8 e 10 são as que mais agradaram os consumidores neste continente


#   • Poderíamos direcionar uma campanha promovendo o continente
# para grupos de clientes que se interessem por determinados tipos
# de atrações do local?


################### 1º TENTATIVA - 6 CLUSTERS ###################

# Utiliza o método de elbow para sugerir quantidade de clusters
# Foram escolhidos 6 clusters

elbow <- function(dataset) {
  wss <- numeric(15)
  for (i in 1:15) wss[i] <- sum(kmeans(dataset, centers = i, nstart = 100)$withinss)
  plot(1:15, wss, type = "b", main = "Elbow method", xlab = "Number of Clusters", 
       ylab = "Within groups sum of squares", pch = 8)
}
elbow(df_analise)


  # Não há necessidade de escalonar os atributos
  # Execução do K-means()
set.seed(1234)
kmeans.result <- kmeans(x = df_analise, centers = 6)

kmeans.result$centers
kmeans.result$cluster

grupos <- kmeans.result$cluster

pairs(df_analise[1:10], col = c(1:6)[grupos])

  # R: Não realizando o agrupamento com 6 clusters, pois é possível notar pouca distância entre os grupos
  # formados e a existência de overlaping.

plot(x = df_analise$`Category 1`,y = df_analise$`Category 2`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 1`,y = df_analise$`Category 3`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 1`,y = df_analise$`Category 4`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 1`,y = df_analise$`Category 5`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 1`,y = df_analise$`Category 6`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 1`,y = df_analise$`Category 7`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 1`,y = df_analise$`Category 8`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 1`,y = df_analise$`Category 9`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 1`,y = df_analise$`Category 10`, col = kmeans.result$cluster)

plot(x = df_analise$`Category 2`,y = df_analise$`Category 1`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 2`,y = df_analise$`Category 3`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 2`,y = df_analise$`Category 4`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 2`,y = df_analise$`Category 5`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 2`,y = df_analise$`Category 6`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 2`,y = df_analise$`Category 7`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 2`,y = df_analise$`Category 8`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 2`,y = df_analise$`Category 9`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 2`,y = df_analise$`Category 10`, col = kmeans.result$cluster)

plot(x = df_analise$`Category 3`,y = df_analise$`Category 1`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 3`,y = df_analise$`Category 2`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 3`,y = df_analise$`Category 4`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 3`,y = df_analise$`Category 5`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 3`,y = df_analise$`Category 6`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 3`,y = df_analise$`Category 7`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 3`,y = df_analise$`Category 8`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 3`,y = df_analise$`Category 9`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 3`,y = df_analise$`Category 10`, col = kmeans.result$cluster)

plot(x = df_analise$`Category 4`,y = df_analise$`Category 1`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 4`,y = df_analise$`Category 2`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 4`,y = df_analise$`Category 3`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 4`,y = df_analise$`Category 5`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 4`,y = df_analise$`Category 6`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 4`,y = df_analise$`Category 7`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 4`,y = df_analise$`Category 8`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 4`,y = df_analise$`Category 9`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 4`,y = df_analise$`Category 10`, col = kmeans.result$cluster)


plot(x = df_analise$`Category 5`,y = df_analise$`Category 1`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 5`,y = df_analise$`Category 2`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 5`,y = df_analise$`Category 3`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 5`,y = df_analise$`Category 4`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 5`,y = df_analise$`Category 6`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 5`,y = df_analise$`Category 7`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 5`,y = df_analise$`Category 8`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 5`,y = df_analise$`Category 9`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 5`,y = df_analise$`Category 10`, col = kmeans.result$cluster)

plot(x = df_analise$`Category 6`,y = df_analise$`Category 1`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 6`,y = df_analise$`Category 2`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 6`,y = df_analise$`Category 3`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 6`,y = df_analise$`Category 4`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 6`,y = df_analise$`Category 5`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 6`,y = df_analise$`Category 7`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 6`,y = df_analise$`Category 8`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 6`,y = df_analise$`Category 9`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 6`,y = df_analise$`Category 10`, col = kmeans.result$cluster)

plot(x = df_analise$`Category 7`,y = df_analise$`Category 1`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 7`,y = df_analise$`Category 2`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 7`,y = df_analise$`Category 3`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 7`,y = df_analise$`Category 4`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 7`,y = df_analise$`Category 6`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 7`,y = df_analise$`Category 5`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 7`,y = df_analise$`Category 8`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 7`,y = df_analise$`Category 9`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 7`,y = df_analise$`Category 10`, col = kmeans.result$cluster)

plot(x = df_analise$`Category 8`,y = df_analise$`Category 1`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 8`,y = df_analise$`Category 2`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 8`,y = df_analise$`Category 3`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 8`,y = df_analise$`Category 4`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 8`,y = df_analise$`Category 6`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 8`,y = df_analise$`Category 7`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 8`,y = df_analise$`Category 5`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 8`,y = df_analise$`Category 9`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 8`,y = df_analise$`Category 10`, col = kmeans.result$cluster)

plot(x = df_analise$`Category 9`,y = df_analise$`Category 1`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 9`,y = df_analise$`Category 2`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 9`,y = df_analise$`Category 3`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 9`,y = df_analise$`Category 4`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 9`,y = df_analise$`Category 6`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 9`,y = df_analise$`Category 7`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 9`,y = df_analise$`Category 8`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 9`,y = df_analise$`Category 5`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 9`,y = df_analise$`Category 10`, col = kmeans.result$cluster)

plot(x = df_analise$`Category 10`,y = df_analise$`Category 1`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 10`,y = df_analise$`Category 2`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 10`,y = df_analise$`Category 3`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 10`,y = df_analise$`Category 4`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 10`,y = df_analise$`Category 6`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 10`,y = df_analise$`Category 7`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 10`,y = df_analise$`Category 8`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 10`,y = df_analise$`Category 9`, col = kmeans.result$cluster)
plot(x = df_analise$`Category 10`,y = df_analise$`Category 5`, col = kmeans.result$cluster)

################### 2º TENTATIVA - 3 CLUSTERS ###################

# Seta seed
set.seed(1234) 

# Prepara estrutura que será usada no kmeans()
trip <- tripadvisor_review[,-1]

# Gera kmeans com 3 clusters
(kmeans.result <- kmeans(trip, 3)) 

## Permite visualização da distribuição dos clusters
plotcluster(trip[1:10],kmeans.result$cluster)
clusplot(trip[1:10],kmeans.result$cluster) 


# Cria um novo data_frame com os grupos dos registros
trip_agrupado <- trip
trip_agrupado$grupos <- kmeans.result$cluster 

# Plota um histograma da frequência dos grupos
hist(trip_agrupado$grupos)

# Utiliza o dplyr para calcular a mediana das notas de cada categoria, de cada grupo. 
# Objetivo de saber quais são as preferências de cada grupo
preferencias_grupos <- trip_agrupado %>% group_by(grupos) %>% summarise_all(funs(median))

# Plota a preferência de cada grupo
preferencia_1 <- preferencias_grupos[preferencias_grupos$grupos == 1,2:11]
plot(melt(preferencia_1))

preferencia_2 <- preferencias_grupos[preferencias_grupos$grupos == 2,2:11]
plot(melt(preferencia_2))

preferencia_3 <- preferencias_grupos[preferencias_grupos$grupos == 3,2:11]
plot(melt(preferencia_3))

# R: São preferências gerais dos grupos as categorias 7, 8 e 9. 
# Para os grupos 1 e 3, após a categoria 7, a de maior interesse é a 10
# Para o grupo 2, após a cateogira 7, a de maior interesse é a 8
# Os interesses do grupo 1 e 3 são bem similares, diferenciando-se que
# o grupo 3 não tem grande interesse na categoria 3
# O grupo 2 também não tem grande interesse na categoria 3
# Nenhum grupo tem grande interesse nas categorias 1 e 4
# Os grupos 1 e 3 possuem certo interesse na categoria 6. O 2 não.

################### 3º TENTATIVA - CORRELAÇÕES ###################

# Prepara estrutura utilizada na análise
trip <- tripadvisor_review[,-1]

# Realiza Correlação
matriz_corralcao <- cor(trip)
corrplot(as.matrix(matriz_corralcao), method="number")

# R: A análise das correlações levou a algumas inferências que não foram corroboradas  
# durante validação na análise de dados pela equipe. Por exemplo, encontrou-se
# certa proporcionalidade inversa entre as categorias 7 e 10, bem como
# certa proporcionalide direta entre as categorias 3 e 7. Porém, em análise dos dados
# não se encontrou estes cenários.


#   • Segundo estes clientes, quais são os maiores atrativos do
# continente?

  # R: Em acordo com análise realizada no primeiro item, seriam:
  # Piquniques, praias e espaços religiosos.
  
df_analise <- df
df_analise$`User ID` <- NULL
sapply(df_analise,mean)
sapply(df_analise,median)
