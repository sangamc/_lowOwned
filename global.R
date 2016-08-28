players <- data.frame()
players <- read.csv("appTestData.csv")
players <- players[,-c(1)]

results <- data.frame()
results <- read.csv("appTestData2.csv")
results <- results[,-c(1)]

results2 <- data.frame()
results2 <- read.csv("appTestData3.csv")
results2 <- results2[,-c(1)]