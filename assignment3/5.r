# sournce("5.r")


library("rpart")
n = 1000;
x = rep(0,n);
s = c(1,5,4,2,3);
k = length(s);
for (i in (k+1):n) {
  j = s[(i %% k) + 1]; # i %% k is i mod k
  x[i] = 1 - x[i-j];
}

m = 4
x_i_1 = c(tail(x, -1), head(x, 1))
x_i_2 = c(tail(x, -2), head(x, 2))
x_i_3 = c(tail(x, -3), head(x, 3))
x_i_4 = c(tail(x, -4), head(x, 4))

df = data.frame(x_i_1, x_i_2, x_i_3, x_i_4)

fit <- rpart(x ~ x_i_1+x_i_2+x_i_3+x_i_4, data=df,method = "class")

printcp(fit)