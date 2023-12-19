install.packages("arules")
install.packages("arulesViz")

library(arules)
library(arulesViz)

df <- read.transactions("market_basket.csv", sep = ",", rm.duplicates = TRUE)
df

str(df)

rules <- apriori(data = df, parameter = list(support = 0.004, confidence = 0.2))

itemFrequencyPlot(df, topN = 10)
sorted_rules <- sort(rules, by = "lift")[1:10]
inspect(sorted_rules)

plot(sorted_rules, method = "graph", measure = "confidence", shading = "lift")
