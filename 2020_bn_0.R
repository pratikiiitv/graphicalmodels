library(dplyr)

df<-read.table("abcSampleTable.txt",head=TRUE)
N<-nrow(df)

#P(A=yes,B=yes)?
df.cond1<-df %>%
 filter(A=="yes",B=="yes")
n1<-nrow(df.cond1)
PAB<-n1/N

#P(A=yes|B=yes)?
df.cond2<-df %>%
 filter(B=="yes")
n2<-nrow(df.cond2)
PAgB<-n1/n2

#P(B=yes|A=yes)?
df.cond3<-df %>%
 filter(A=="yes")
n3<-nrow(df.cond3)
PBgA<-n1/n3

# Probability table for ABC
st<-c("yes","yes","yes")
p<-nrow(filter(df,df$A==st[1],df$B==st[2],df$C==st[3]))/N




