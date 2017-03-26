## Question 4
## run from console ">source("Q_4a.r")"

#Load data:
  

time_series = read.csv("../time_series.csv")

plot(0, xlim=c(0,220), ylim= c(0,8), xlab="time v1 to v200", ylab="magnitude at that time")
apply(time_series, 1, lines, type="l")

#The above diagram shows the 200 time series objects. One thing is each object wave. And any wave has some properties such as amplitude and frequeny, wavelength etc. We can see that these waves differ in these properties. But for better visualization of the four models in this time-series data we have to do dimensionality reduction so we can view it better.



#Since its really hard to visualize this: we will use dimensionality reductoin technique(PCA):
#THE Below pca model clearly shows the four different time series models that are present in the data.
#It clearly catches the variance in the frequency and amplitude of these models. 



time_series_scaled = scale(t(time_series),center=TRUE,scale=FALSE)

# compute the covariace matrix (X-u)(X-u)^T   (n*1)(1*n) matrix = n*n(matrix)
n = nrow(time_series_scaled)
cov = t(time_series_scaled) %*% time_series_scaled/n

#Perform the PCA by computing the SVD of the sample co-variance matrix:
# singular value decomposition
svd =  svd(cov) # take the singular value decomposition S = UDU^t
svd$d
#Now lets perform the PCA:
pca = time_series_scaled %*% svd$u[,1:4]

# plot the principal components:
dim(pca)
matplot(pca, type="l")
legend(1, 4, c("    PC1", "    PC2", "    PC3", "    PC4"), pch="----", col = c("black", "red", "green", "blue"))




