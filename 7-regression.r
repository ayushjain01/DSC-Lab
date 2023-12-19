library(ggplot2)

housing <- data.frame(
    rooms = c(10, 12, 15, 18, 20, 22, 26, 27, 28, 29, 32, 35, 37, 39, 40),
    rent = c(60, 63, 64, 66, 69, 71, 74, 76, 79, 83, 86, 88, 90, 93, 95),
    loans = c(1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0)
)

linear_model <- lm(loans ~ rooms + rent, data = housing)
summary(linear_model)

housing$predicted_loans_linear <- predict(linear_model)

ggplot(housing, aes(x = rooms, y = rent, color = predicted_loans_linear)) +
    geom_point() +
    labs(title = "Linear Regression: loans ~ rooms + rent") +
    scale_color_gradient(low = "blue", high = "red", name = "Predicted loans")

logistic_model <- glm(loans ~ rooms + rent, data = housing, family = binomial)
summary(logistic_model)
temp <- predict(logistic_model, type = "response")
housing$predicted_loans_logistic <- ifelse(temp >= 0.5, 1, 0)

ggplot(housing, aes(x = rooms, y = rent, color = factor(predicted_loans_logistic))) +
    geom_point() +
    labs(title = "Logistic Regression: loans ~ rooms + rent") +
    scale_color_manual(
        values = c("blue", "red"), name = "Predicted Loans (Binary)",
        labels = c("No", "Yes")
    )
