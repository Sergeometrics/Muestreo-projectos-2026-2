library(dplyr)
set.seed(5) #seed para reproducibilidad, se elige el número 5 para manifestar esa nota

poblacion <- read.csv("narino_poblacion_censo_2005_2018.csv")
poblacion$id_municipio<- 1:length(poblacion$nombre_municipio) 
head(poblacion[, c("id_municipio", "nombre_municipio", "poblacion_censo_2005")]) 

n_muestra <- 12

indices <- sample(1:length(poblacion$id_municipio))  

grupos <- split(indices, cut(seq_along(indices), breaks = n_muestra, labels = FALSE))


seleccionados <- numeric(n_muestra) 


for (i in 1:n_muestra) {
  grupo_actual <- grupos[[i]]
  tamanos_grupo <- poblacion$poblacion_censo_2005[grupo_actual]
  prob <- tamanos_grupo / sum(tamanos_grupo)
  seleccionados[i] <- sample(grupo_actual, size = 1, prob = prob)
}

 seleccionados

muestra_final <- poblacion %>%
  filter(id_municipio %in% seleccionados) 

muestra_final