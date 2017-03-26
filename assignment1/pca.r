# demonstration of principal components to remove redundant features in data matrix

d = 10;  # the apparent dimension of the data (but not *real* dim)... you'll see
r = 3;   # the real dimension
n = 100; # num data points
X = matrix(runif(n*r),nrow=n,ncol=r);  # original data matrix with n obs. of  r indepedent variables
T = matrix(0,nrow=r,ncol=d);  # transformation matrix to map from r dim space to d dim space
for (i in 1:r) for (j in 1:d) {  # create rxd transformation matrix, T
    T[i,j] = j  %% (i+1);         # it doesn't really matter what T is by rxd is important
    T[i,j] = (j+1)  %% (i+2);         # it doesn't really matter what T is by rxd is important
}
Y = X %*% T; # %*% is matrix mult.  
             # even though Y has d features, there can only be r independent directions
             # so there is a lot of redundancy in the new features  
Y = scale(Y)  # make columns 0 mean
pairs(Y);
S = t(Y) %*% Y/n;  # the sample covariance matrix
svd =  svd(S);  # take the singular value decomposition S = UDU^t
d = svd$d;  # d is diag(D)  # only the first r should be different from 0. 
U = svd$u;  # columns of U are the "loadings" or independent directions
Z = Y %*% U[,1:r];  # transform Y to a new lower dim matrix that removes the redundancy
                    # note that the new variables are uncorrelated from pairs plot
