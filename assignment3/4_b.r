# source("4_b.r")


strange_binary = read.csv("../strange_binary.csv")
library("rpart")
summary(strange_binary)
newFeature1 = rowSums(strange_binary[,c(1,2,3,4,6,9)])
newFeature2 = rowSums(strange_binary[,c(5,7,8,10)])
newFeature3 = rowSums(strange_binary[,1:10]==0)
newFeature4 = rowSums(strange_binary[,1:10]==1)

fit <- rpart(strange_binary[,"c"] ~ newFeature1+newFeature2+newFeature3+newFeature4+X + X.1 + X.2 + X.3 + X.4 + X.5 + X.6 + X.7 + X.8 + X.9, data=strange_binary, method = "class" )

printcp(fit)

plot(fit)
text(fit)
post(fit,file="4_b_plot.ps")
