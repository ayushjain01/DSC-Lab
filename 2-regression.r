install.packages("ggplot2")
library(ggplot2)

weather <- data.frame(
    temp = c(15, 18, 19, 21, 23, 24, 27, 28, 30),
    humidity = c(60, 63, 64, 67, 69, 70, 72, 75, 80),
    rainy_day = c(1, 1, 0, 0, 0, 1, 1, 1, 0)
)

linear_model <- lm(rainy_day ~ temp + humidity, data = weather)
summary(linear_model)

weather$predicted_rainy_day_linear <- predict(linear_model)

ggplot(weather, aes(x = temp, y = humidity, color = predicted_rainy_day_linear)) +
    geom_point() +
    labs(title = "Linear Regression: rainy_day ~ temp + humidity") +
    scale_color_gradient(low = "blue", high = "red", name = "Predicted rainy_day")

logistic_model <- glm(rainy_day ~ temp + humidity, data = weather, family = binomial)
summary(logistic_model)
temp <- predict(logistic_model, type = "response")
weather$predicted_rainy_day_logistic <- ifelse(temp >= 0.5, 1, 0)

ggplot(weather, aes(x = temp, y = humidity, color = factor(predicted_rainy_day_logistic))) +
    geom_point() +
    labs(title = "Logistic Regression: rainy_day ~ temp + humidity") +
    scale_color_manual(
        values = c("blue", "red"), name = "Predicted rainy_day (Binary)",
        labels = c("No Rain", "Rain")
    )
