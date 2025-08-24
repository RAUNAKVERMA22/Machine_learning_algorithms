library("rpart")
library("rpart")
data("iris")
str(iris)
indexes = sample(150,100)
iris_train = iris[indexes,]
iris_test = iris[indexes,]
iris_train_label = iris[indexes,5]
iris_test_label = iris[indexes,5]
#target = Species ~ Sepal.Length + Sepal.Width = petal.Length
install.packages("party")
library(party)
tree = ctree(Species ~ .,data = iris)
plot(tree, main = " Tree for Iris")
table(predict(tree), iris$Species)



