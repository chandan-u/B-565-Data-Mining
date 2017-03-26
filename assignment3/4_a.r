# source("4_a.r")

strange_binary = read.csv("../strange_binary.csv")
library("rpart")
fit <- rpart(strange_binary[,"c"] ~ X + X.1 + X.2 + X.3 + X.4 + X.5 + X.6 + X.7 + X.8 + X.9, data=strange_binary, method = "class" )

printcp(fit)

plot(fit)
text(fit)
post(fit,file="4_a.ps")

