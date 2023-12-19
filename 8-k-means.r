data <- data.frame(
    x = c(1, 1, 7, 4, 6, 5, 1, 4, 3),
    y = c(9, 6, 3, 8, 6, 5, 2, 9, 9)
)

k <- 3
kmeans_model <- kmeans(data, centers = k)

kmeans_model$centers

cluster_assignment <- kmeans_model$cluster
plot(data$x, data$y, col = cluster_assignment, pch = 19, main = "K-means Clustering")
points(kmeans_model$centers, pch = 3)
