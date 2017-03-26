# source("7.r")

accuracies = read.csv("4_9.csv")

classifiers = c( "decision_tree", "naive_bayes", "svm")
print(c("classifiers", classifiers))
for (i in c(1:2)){
  for (j in c(i+1:3)){
    classifier_1 =  classifiers[i]
    classifier_2 =  classifiers[j]
    if (is.na(classifier_2)){
      break
    }
    
    wins = 0
    loss = 0
    draws = 0
    for (dataset in c(1:nrow(accuracies))){
      if ( accuracies[dataset, classifier_1] > accuracies[dataset, classifier_2]){
        wins = wins + 1;
      }
      if ( accuracies[dataset, classifier_1] == accuracies[dataset, classifier_2]){
        draws = draws + 1;
      }
      if (  accuracies[dataset, classifier_1] < accuracies[dataset, classifier_2]){
        loss = loss + 1;
      }
    }# for
    print(c(classifier_1, classifier_2, wins, loss, draws))
    
  }# for
  
}# for 