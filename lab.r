<<<<<<< HEAD
data(francdat)
x <- francdat [,c(2,4,5,6,8)]
print(x)
ff <- freqCalc(x, keyVars=c(1,2,3,4) , w=5)
print(cbind(x,ff$fk,ff$Fk))
rk <- indivRisk(ff)$rk
print (cbind(x, ff$fk, ff$Fk, rk ))
x[,1] <- globalRecode(x[ ,1],breaks=c(0,1,2,3,6),labels=c(1,2,3,4))
print(x)
ff <- freqCalc(x, keyVars=c(1,2,3,4) , w=5)
print(cbind(x,ff$fk,ff$Fk))
rk <- indivRisk( ff )$rk
print (cbind(x, ff$fk , ff$Fk , rk ))
localsupx <- kAnon(x, keyVars=1:4, k=2)
plot(localsupx)
print(localsupx$xAnon)
newX <- cbind(localsupx$xAnon, x$w)
newff <- freqCalc(newX, keyVars=c(1,2,3,4) , w=5)
print(cbind(newX,newff$fk,newff$Fk))
newrk <- indivRisk( newff )$rk
print (cbind(newX, newff$fk , newff$Fk , newrk ))
=======
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
>>>>>>> a6be7fb6635ca889029a34c0593450a8b3149b10
