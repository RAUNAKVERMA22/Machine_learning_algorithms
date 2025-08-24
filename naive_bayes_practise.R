#naive bayes question practice




# Loading package
library(e1071)
library(caTools)
library(caret)

# Splitting data into train
# and test data
split <- sample.split(iris, SplitRatio = 0.7)
train_cl <- subset(iris, split == "TRUE")
test_cl <- subset(iris, split == "FALSE")

# Feature Scaling
train_scale <- scale(train_cl[, 1:4])
test_scale <- scale(test_cl[, 1:4])

# Fitting Naive Bayes Model 
# to training dataset
set.seed(120)  # Setting Seed
classifier_cl <- naiveBayes(Species ~ ., data = train_cl)
classifier_cl

# Predicting on test data'
y_pred <- predict(classifier_cl, newdata = test_cl)

# Confusion Matrix
cm <- table(test_cl$Species, y_pred)
cm

# Model Evaluation
confusionMatrix(cm)






# Load the required library
library(e1071)
library(caTools)

# Load the dataset
data <- read.csv("Prostate_cancer 1.csv")
head(data)

# Clean the dataset
data <- subset(data, select = -c(id, X))  # Remove irrelevant columns
head(data)
# Encode the target variable
data$diagnosis_result <- as.factor(data$diagnosis_result)
head(data)
# Split the data into training and testing sets
set.seed(42)
split <- sample.split(data$diagnosis_result, SplitRatio = 0.7)
train <- subset(data, split == TRUE)
test <- subset(data, split == FALSE)

# Train the Naive Bayes model
model <- naiveBayes(diagnosis_result ~ ., data = train)

# Make predictions on the test data
predictions <- predict(model, test)

# Evaluate the model
conf_matrix <- table(test$diagnosis_result, predictions)
print("Confusion Matrix:")
print(conf_matrix)

accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
print(paste("Accuracy:", accuracy))

# Detailed report
precision <- diag(conf_matrix) / colSums(conf_matrix)
recall <- diag(conf_matrix) / rowSums(conf_matrix)
f1_score <- 2 * (precision * recall) / (precision + recall)

cat("\nPrecision:", precision, "\nRecall:", recall, "\nF1-Score:", f1_score)

