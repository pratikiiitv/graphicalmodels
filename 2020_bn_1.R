library(bnlearn)

ex.bn<-model2network('[A][B|A][C|A]')
plot(ex.bn)
yn<-c("yes","no")
A<-array(dimnames=list(A=yn),dim=2,c(.6,.4))
B<-array(dimnames=list(B=yn,A=yn),dim=c(2,2),c(.6,.4,.1,.9))
C<-array(dimnames=list(C=yn,A=yn),dim=c(2,2),c(.2,.8,.7,.3))
cpts<-list(A=A,B=B,C=C)
ex.bn.fit=custom.fit(ex.bn,cpts)

# Direct sampling
#a<-sample(yn,1,prob=ex.bn.fit$A$prob)
#b<-sample(yn,1,prob=ex.bn.fit$B$prob[,a])
#c<-sample(yn,1,prob=ex.bn.fit$C$prob[,a])
#spl<-c(a,b,c)

# Using cpdist()
set.seed(0)
samples.exbn<-cpdist(ex.bn.fit, nodes=nodes(ex.bn.fit), evidence=TRUE, n=1000)

# Known topology learning cpds
#ex.bn.fit1<-bn.fit(ex.bn,samples.exbn)

# Learn the topology using HC
#ex.bn1<-hc(samples.exbn, score='loglik')
#ex.bn.fit2<-bn.fit(ex.bn1,samples.exbn)

# Query the JPD
#cpquery(ex.bn.fit2,event=(),evidence=TRUE,n=1000)


