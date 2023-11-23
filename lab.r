
df = read.table("datat.csv",  header=TRUE, sep=";")

ff <- freqCalc(df, keyVars=1:ncol(df), w=34)
write.table((cbind(x, ff$fk, ff$Fk)), 'output.csv', sep='\t', )
