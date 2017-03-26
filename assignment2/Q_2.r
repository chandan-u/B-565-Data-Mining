# Question 2.a
# run from console > source("Q_2.r")


## for each dimension:

number_of_points = 1000
dimensions = c(rep(2:50));

# sd and mean vectors:

cos.sd = c()
cos.mean = c()

cos.sim <- function(vector1,vector2){
  distance =  crossprod(vector1, vector2)/sqrt(crossprod(vector1) * crossprod(vector2))
  return(abs(distance))
}

computeMatrix <- function(dimension){
  
  # genereate values from standard normal dist
  # for each dimension
  m1 = matrix(rnorm(dimension * number_of_points), nrow=number_of_points, ncol=dimension )
  m2= matrix(rnorm(dimension * number_of_points), nrow = number_of_points, ncol = dimension)
  
  # list to storte cosine distances
  # cos.matrix = matrix(data=NA,nrow= number_of_points,ncol=number_of_points)
  cos.list = c()
  
  
  # compute cosine dist between all the points
  # cosine_distances = matrix(apply(m,1, cos.sim, vector),      nrow=number_of_points, ncol=number_of_points)
  for(i in c(1:number_of_points)){
    vector1 = m1[i,]      
    vector2 = m2[i,]
    cos.list = c(cos.list, cos.sim(vector1, vector2))
  }#for
  
  # compute the sd and mean of cos.dist obtained and save in vector
  # <<- is used for accessing global variables.
  #current_length = length(cos.sd)
  cos.sd <<- append(cos.sd, sd(cos.list), after = length(cos.sd))
  cos.mean <<- append(cos.mean, mean(cos.list), after = length(cos.mean))
  
} #def computeMatrix


# main call dimensions: 2: 1000 execute fun::computeMatrix
s = sapply(dimensions,computeMatrix)


#Now lets draw a plot between of mean,sd as a function of dimension [2,1000]

# plot mean, sd as function of dimension: [2, 1000]
plot( dimensions, cos.sd, xlab = "dimensions", ylab="cosine distance", main="Dimension vs sd cosine-distance")
lines(dimensions, cos.sd)

# second plot
plot( dimensions, cos.mean, xlab = "dimensions", ylab="cosine distance", main="Dimension vs mean cosine-distance")
lines(dimensions, cos.mean)
