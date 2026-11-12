
datos <- read.csv("narino_poblacion_censo_2005_2018.csv")
set.seed(5)

n <- 12
tamano <- datos$poblacion_censo_2005
intervalo <- sum(tamano) / n
arranque <- runif(1, min = 0, max = intervalo)
puntos <- arranque + (0:(n - 1)) * intervalo
seleccion <- findInterval(puntos, c(0, cumsum(tamano)), rightmost.closed = TRUE)

muestra <- datos[seleccion, , drop = FALSE]
muestra<- muestra[,c("id_municipio", "nombre_municipio", "poblacion_censo_2005", "poblacion_censo_2018")]
muestra



