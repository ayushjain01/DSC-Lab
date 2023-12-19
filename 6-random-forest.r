install.packages("ISLR")

library(ISLR)
library(randomForest)
library(caTools)

# Based on given info, calculate if loan defaulter or not
data(Default)

loan_data <- Default
summary(loan_data)

# Or pick some other data or create your own

split <- sample.split(loan_data, SplitRatio = 0.7)
train <- subset(loan_data, split == TRUE)
test <- subset(loan_data, split == FALSE)

# Ignore the Student column
input <- train[, 3:4]
target <- train[, 1]

model <- randomForest(input, target, data = loan_data, class.f = TRUE)
print(model)

pred <- predict(model, test)
print(pred)

confusion_matrix <- table(pred, test$default)
print(confusion_matrix)

summary(model)
plot(model)
varImpPlot(model)
importance(model)

custom_input <- data.frame(
    balance = 729.52650,
    income = 44361.625
)

custom_predictions <- predict(model, custom_input)
print(custom_predictions)
