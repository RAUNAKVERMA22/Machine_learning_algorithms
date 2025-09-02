#Support Vector Machine
data = iris
str(data)
summary(data)
library(caTools)
set.seed(123)
split = sample.split(data$Species, SplitRatio = 0.75)
training_set = subset(data,split == TRUE)
test_set = subset(data, split == FALSE)
library(e1071)
?svm
classifier = svm(formula = Species ~ ., 
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')
y_pred = predict(classifier,newdata = test_set[-5])
plot(classifier,training_set,Petal.Width ~ Petal.Length,
     slice = list(Sepal.Width = 3, Sepal.Length = 4))
plot(classifier,test_set,Petal.Width ~ Petal.Length, 
     slice = list(Sepal.Width = 3,Sepal.Length = 4))
cm = table(test_set[,5],y_pred)
cm
acc = sum(diag(cm)) / sum(cm)
acc
tab1 = cm
error = 1 - (sum(diag(tab1)) / sum(tab1))
accuracy = sum(diag(tab1)) / sum(tab1)

precision = tab1[1]/(tab1[1] + tab1[2])
recall = tab1[1]/(tab1[1] + tab1[3])
f1 = (2 * precision * recall)/(precision + recall)
#--------------------------------------------------------------------------------------------------
getwd()
dataset = read.csv(file.choose())
str(dataset)
dataset = dataset[3:5]
View(dataset)
dataset$Purchased = factor(dataset$Purchased, levels = c(0,1))
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
View(split)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
training_set[-3] = scale(training_set[-3])
View(test_set)
#scale is a generic function whose default method centeres and/or scales 
#the columns of a numeric matrix.
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
#fitting svm into training set
library(e1071)
classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')
#predicting the test set results
y_pred = predict(classifier,newdata = test_set[-3])
#Making the confusion matrix
cm = table(test_set[,3],y_pred)
cm
acc = sum(diag(cm))/sum(cm)
acc
#plotting the training data set results
set = training_set
X1 = seq(min(set[,1]) -1 , max(set[,1]) + 1, by = 0.01)
X2 = seq(min(set[,2]) -1 , max(set[,2]) + 1, by = 0.01)
X1
#expand.grid will create dataframe
grid_set
colnames(grid_set) = c('Age','EstimatedSalary')
y_grid = predict(classifier,newdata = grid_set)
plot(set[,-3],
     main = 'SVM (Training set)',
     xlab = 'Age',ylab = 'Estimated Salary',
     xlim = range(X1),ylim = range(X2))
#xlim and ylim is the limit 
