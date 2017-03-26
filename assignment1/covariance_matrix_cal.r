# load data: trees
data("trees")

# column names
names(trees)


# convert the data frame to matrix: all columns are numeric
# hence can be converted without any hassle
X = as.matrix(trees)

par(mfrow = c(2, 1))
# pairs plot before scaling
pairs( X )

# scaling
X = scale(X,center=TRUE,scale=FALSE)

# pairs plot after scaling
# the numeric values of each column has been scaled with mean (subtracted)
# the correlation still remains the same
x11()
pairs(X)

# compute the covariace matrix (X-u)(X-u)^T   (n*1)(1*n) matrix = n*n(matrix)
n = nrow(trees)
cov = t(X) %*% X/n

# singular value decomposition
svd =  svd(cov) # take the singular value decomposition S = UDU^t


  






