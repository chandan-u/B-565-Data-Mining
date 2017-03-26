

# Question 3.a
# run the file from console " source("Q_3b.r")"

# sample size
n = 1000

# random sample from exponential dist
x = rexp(1000, rate=1)


# sort values
x = sort(x) 

# frequency distribution of x
x.freq = table(x)

# cdf
x.cdf = c()
for(value in x){
  x.cdf = append(x.cdf, length(x[ x <= value])/n, after= length(x.cdf))
}


# plot the freq dist of the cdf.
plot(table(x.cdf), type="l")
