## Question 4b
## run from console  as ">source("Q_4b.r")"
#The two features that effectivly seperate the time series into four categories are: Maximum-amplitude(crest) and maximum Amplitude(trough) of the each time-series wave. 

time_series = read.csv("../time_series.csv")



max_amplitude = c()
min_amplitude = c()
# lets derive these feautures
for(i in c(1:nrow(time_series))){
  obj = time_series[i,]
  max_amplitude <<- append(max_amplitude, max(time_series[i,]), after = length(max_amplitude))
  min_amplitude <<- append(min_amplitude, min(time_series[i,]), after = length(min_amplitude))
}

# now we have two features of each time-series object. Lets plot
plot(max_amplitude, min_amplitude)



