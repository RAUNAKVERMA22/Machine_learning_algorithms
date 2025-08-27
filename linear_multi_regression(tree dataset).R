#use built in tree dataset use cor, multi linear regression, visulise using ggplot
library(corrplot)
library(ggplot2)
data(trees)
head(trees)
cor_matrix <- cor(trees)
corrplot(cor_matrix, method = "number")
print(cor_matrix)
model <- lm(Volume ~ Girth + Height, data = trees)
summary(model)
# Scatter plot of Girth vs Volume with regression line
ggplot(trees, aes(x = Girth, y = Volume)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Girth vs. Volume", x = "Girth (inches)", y = "Volume (cubic feet)") +
  theme_dark()
# Scatter plot of Height vs Volume with regression line
ggplot(trees, aes(x = Height, y = Volume)) +
  geom_point(color = "green") +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(title = "Height vs. Volume", x = "Height (feet)", y = "Volume (cubic feet)") +
  theme_gray()
# Scatter plot of Height vs Volume with regression line
ggplot(trees, aes(x = Height, y = Girth)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", color = "pink", se = FALSE) +
  labs(title = "Height vs. Girth", x = "Height (feet)", y = "Girth (cubic feet)") +
  theme_get()

