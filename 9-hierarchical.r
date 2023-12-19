library(cluster)

data <- data.frame(
    x = c(1, 1, 7, 4, 6, 5, 1, 4, 3),
    y = c(9, 6, 3, 8, 6, 5, 2, 9, 9)
)

# Linkage -  complete, average, single, centroid
# Distance - euclidean, manhattan, maximum, canberra, correlation, minkowski

hc_model <- hclust(dist(data, method = "euclidean"), method = "complete")

plot(hc_model, hang = -1, main = "Hierarchical Clustering Dendrogram")

cut_dendrogram <- cutree(hc_model, k = 3)

plot(data$x, data$y, col = cut_dendrogram, pch = 19, main = "Hierarchical Clustering")
