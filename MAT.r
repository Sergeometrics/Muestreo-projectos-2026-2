
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




X_total <- sum(datos$poblacion_censo_2005)
x_sel   <- datos$poblacion_censo_2005[seleccion]
y_sel   <- datos$poblacion_censo_2018[seleccion]
Z       <- y_sel / (x_sel / X_total)   # y_i / p_i

total_estimado     <- mean(Z)          # (1/n) * sum(Z)
varianza_estimada  <- var(Z) / n       # (1/(n(n-1))) * sum((Z - mean(Z))^2)
error_estandar     <- sqrt(varianza_estimada)
cve                <- (error_estandar / total_estimado) * 100

total_estimado
varianza_estimada
error_estandar
cve

sum(datos$poblacion_censo_2018)