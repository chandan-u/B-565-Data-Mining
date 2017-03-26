# execute : >source("2_b.r")

student_data = read.csv("../student/student-mat.csv", sep=";")
# rpart library: load
library(rpart)

# grow the tree
fit = rpart(G3 ~ school+sex+age+address+famsize+Pstatus+Medu+Fedu+Mjob+Fjob+reason+guardian+traveltime+studytime+failures+schoolsup+famsup+paid+activities+nursery+higher+internet+romantic+famrel+freetime+goout+Dalc+Walc+health+absences, data= student_data, method="anova")	

printcp(fit)
# prune the tree: remove variables that do not show statistically significant improvement
fit <- prune(fit, cp=fit$cptable[which.min(fit$cptable[,"xerror"]),"CP"])


plot(fit)	      	       		       # look at complex tree we built
text(fit)
post(fit, file="2_b.ps")

printcp(fit)
fit$variable.importance