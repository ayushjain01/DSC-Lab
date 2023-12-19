data <- data.frame(
    x = c(2, 2, 8, 5, 7, 6, 1, 4, 3),
    y = c(10, 5, 4, 8, 5, 4, 2, 9, 9)
)

k <- 3
kmeans_model <- kmeans(data, centers = k)

kmeans_model$centers

cluster_assignment <- kmeans_model$cluster
plot(data$x, data$y, col = cluster_assignment, pch = 19, main = "K-means Clustering")
points(kmeans_model$centers, pch = 3)
