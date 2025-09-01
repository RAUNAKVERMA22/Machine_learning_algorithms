install.packages("randomForest")
library(randomForest)
data("iris")
str(iris)
indexes = sample(150,110)
indexes
iris_train = iris[indexes,]
iris_train
iris_test = iris[-indexes,]
iris_test
rf_model <- randomForest(Species ~ ., data = iris_train,ntree = 100)
#print model summary
print(rf_model)
#make predictions on the test set
predictions <- predict(rf_model,iris_test)
#Evaluate the model
output<-table(predictions,iris_test$Species)
print(output)
#Display model accuracy
accuracy <- sum(diag(output))/sum(output)
cat("Accuracy of the Random Forest Model : ",accuracy)
tab1=output
precision = tab1[1]/(tab1[1] + tab1[2])
recall = tab1[1]/(tab1[1] + tab1[3])
f1 = (2 * precision * recall)/(precision + recall)

