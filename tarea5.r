df <-  read.table("datat.csv",sep=";",header=TRUE)
ff <- freqCalc(df, keyVars=c(1:33) , w=34)
print(cbind(df,ff$fk,ff$Fk))
rk <- indivRisk(ff)$rk
print (cbind(df, ff$fk, ff$Fk, rk ))
write.csv(cbind(df, ff$fk, ff$Fk, rk ), file = "./output.csv", row.names = FALSE, sep = ";")
