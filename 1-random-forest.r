install.packages("randomForest")
install.packages("mlbench")
install.packages("caTools")

library(randomForest)
library(mlbench)
library(caTools)

data("PimaIndiansDiabetes")
health_data <- PimaIndiansDiabetes
summary(health_data)

split <- sample.split(health_data, SplitRatio = 0.7)
train <- subset(health_data, split == TRUE)
test <- subset(health_data, split == FALSE)

input <- train[, 1:8]
target <- train[, 9]

model <- randomForest(input, target, data = health_data, class.f = TRUE)
print(model)

pred <- predict(model, test)
print(pred)

confusion_matrix <- table(pred, test$diabetes)
print(confusion_matrix)

summary(model)
plot(model)
varImpPlot(model)
importance(model)

custom_input <- data.frame(
    pregnant = 6,
    glucose = 148,
    pressure = 72,
    triceps = 32,
    insulin = 0,
    mass = 32.6,
    pedigree = 0.627,
    age = 50
)

custom_predictions <- predict(model, custom_input)
print(custom_predictions)
