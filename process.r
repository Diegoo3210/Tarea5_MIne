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