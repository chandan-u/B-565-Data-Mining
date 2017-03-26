# exectute: >source("2_a.r")

student_data = read.csv("../student/student-mat.csv", sep=";")
# rpart library: load
library(rpart)

# target class variable
c = student_data$G3 > 10


# grow the tree
fit = rpart(c ~ school+sex+age+address+famsize+Pstatus+Medu+Fedu+Mjob+Fjob+reason+guardian+traveltime+studytime+failures+schoolsup+famsup+paid+activities+nursery+higher+internet+romantic+famrel+freetime+goout+Dalc+Walc+health+absences, data= student_data, method="class")	

#printcp(fit)
# prune the tree: remove variables that do not show statistically significant improvement
fit <- prune(fit, cp=fit$cptable[which.min(fit$cptable[,"xerror"]),"CP"])


plot(fit)	    # look at complex tree we built
text(fit)


printcp(fit)
printcp(fit)
fit$variable.importance