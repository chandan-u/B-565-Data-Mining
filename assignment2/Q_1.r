# Question 1q
# to run from console "source("Q_4.r") "


## library
#install.packages("mlbench")
library("mlbench")
data("Ionosphere")
summary(Ionosphere)


# compute the co-variance for each class (good,bad)
X = as.matrix(Ionosphere)
X_good = X[ X[,35] == "good", ] 
X_good = X_good[,3:34]
X_bad = X[ X[,35] == "bad", ] 
X_bad = X_bad[,3:34]

## convert the character matrix to numeric
X_good = apply(X_good,c(1,2), as.numeric)
X_bad = apply(X_bad,c(1,2), as.numeric)

## scale
X_good_scaled = scale(X_good,center=TRUE,scale=FALSE)
X_bad_scaled = scale(X_bad,center=TRUE,scale=FALSE)

## covaraince
n_good = nrow(X_good)
n_bad = nrow(X_bad)
cov_good = t(X_good_scaled) %*% X_good_scaled/n_good
cov_bad = t(X_bad_scaled) %*% X_bad_scaled/n_bad



#The mean vector for each class (good, bad):
mean_good  = colMeans(X_good)
mean_bad = colMeans(X_bad)


#Calcluating mahalanobis distance from each data point to every other data point! 
nearest = c()
samples = c(rep(1:nrow(X)))
for( row in samples){
  library('MASS')
  
  point = X[row, 3:34]
  point = sapply(point, as.numeric)
  dist_from_good = sqrt(t( point - mean_good) %*% solve(cov_good) %*% ( point - mean_good))
  dist_from_bad  = sqrt(t(point - mean_bad) %*% solve(cov_bad) %*% (point - mean_bad))
  
  if (dist_from_bad > dist_from_good) {
    nearest = c(nearest, "good")
  }
  else{
    nearest = c(nearest, "bad")
  }
}




#Now lets compute the confusion matrix using the observed and predicted:
  
confMatrix = table(nearest, Ionosphere$Class)
confMatrix

