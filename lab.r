# Cargamos el Archivo CSV

data <- read.csv("datat.csv", header = TRUE, sep = ";")

x <- data # Eliminas la ultima columna

#Cambios en el dataset

x[,7] <- globalRecode(x[ ,7],breaks=c(0,2,3,4),labels=c(1,2,3))
x[,8] <- globalRecode(x[ ,8],breaks=c(0,2,3,4),labels=c(1,2,3))
x[,3] <- globalRecode(x[ ,3],breaks=c(15,16,17,18,22),labels=c(16,18,19,21))

localsupx <- kAnon(x, keyVars=c(13,15), k=10)

# Calculas la frecuencia de todas las columnas del mismo

ff <- freqCalc(x, keyVars = names(x), w = 34)
rk <- indivRisk(ff)$rk

#Escribimos el resultado en un archivo CSV

write.table(cbind(x,ff$fk,ff$Fk,rk), file = "result.csv", sep = ";", row.names = FALSE)
