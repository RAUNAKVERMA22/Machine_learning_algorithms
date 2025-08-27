#Correlation values ranges between - 1 to + 1. 
#With +1 shows highest positive correlation, 
#while -1 represents highest negative correlation.
#-1 indicates a perfectly negative linear correlation between two variables
#0 indicates no linear correlation between two variables
#1 indicates a perfectly positive linear correlation between two variables
 # Set this to the path where "banlloan.csv" is stored

data <- read.csv("bankloan.csv",header=TRUE,sep =",",stringsAsFactors=FALSE )
head(data)
data <-data[, c(1,3,4,5,6,7,8)]
cor_mat=cor(data)
#the co() function takes the data frame (from dataset)
#as input and returns the correlation matrix as the result.
print("Correlation Matrix:")
print(cor_mat)
library(corrplot)
corrplot(cor_mat,method="circle")
corrplot(cor_mat,method="number")
corrplot(cor_mat,method="pie")


# Output and Interpretation 
# The output of lm is an object of class "lm"   
# This object contains several components, including: 
# coefficients: A named vector of coefficients from the model. 
# residuals: The residuals of the model, which are the differences  
#            between observed and fitted values. 
# fitted.values: The predicted values based on the model. 
# rank: The numeric rank of the fitted linear model. 
# df.residual: The residual degrees of freedom.
#height predictor vector
x <- c(5.1,5.5,5.8,6.1,6.4,6.7,6.4,6.1,5.10,5.7)
#weight responde vector
y <- c(63,66,69,72,75,78,75,72,69,66)
#lm()
relation <- lm(y ~ x)#linear model
summary(relation)
#find weight of a person with given height
a <- data.frame(x=6.3)
result <- predict(relation,a)
print(result)
cor_mat <- cor(data.frame(x,y))
print("correlation matirx: ")
print(cor_mat)
library(corrplot)
corrplot(cor_mat,"pie")
corrplot(cor_mat,"number")
corrplot(cor_mat,"circle")
