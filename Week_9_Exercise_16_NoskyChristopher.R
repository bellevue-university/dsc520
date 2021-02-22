library(ggplot2)
library(purrr)
library(cluster)
library(dplyr)
library(class)
library(caret)
library(ggpubr)

setwd('C:/Users/cwnos/Documents/DSC520/Git repo/DSC520/dsc520/Week 9')

classifier_set <- read.csv('clustering-data.csv')

head(classifier_set)

ggplot(classifier_set, aes(x=x, y=y)) + geom_point()

# Normalize
normalize <- function(x) 
  return ((x - min(x)) / (max(x) - min(x)))

classifier_set_n <- as.data.frame(lapply(classifier_set[,1:2], normalize))
head(classifier_set_n)

# Build a kmeans model
classifier_km_2 <- kmeans(classifier_set, centers = 2)
classifier_km_3 <- kmeans(classifier_set, centers = 3)
classifier_km_4 <- kmeans(classifier_set, centers = 4)
classifier_km_5 <- kmeans(classifier_set, centers = 5)
classifier_km_6 <- kmeans(classifier_set, centers = 6)
classifier_km_7 <- kmeans(classifier_set, centers = 7)
classifier_km_8 <- kmeans(classifier_set, centers = 8)
classifier_km_9 <- kmeans(classifier_set, centers = 9)
classifier_km_10 <- kmeans(classifier_set, centers = 10)
classifier_km_11 <- kmeans(classifier_set, centers = 11)
classifier_km_12 <- kmeans(classifier_set, centers = 12)

# Extract the cluster assignment vector from the kmeans model
classifier_clust_km_2 <- classifier_km_2$cluster
classifier_clust_km_3 <- classifier_km_3$cluster
classifier_clust_km_4 <- classifier_km_4$cluster
classifier_clust_km_5 <- classifier_km_5$cluster
classifier_clust_km_6 <- classifier_km_6$cluster
classifier_clust_km_7 <- classifier_km_7$cluster
classifier_clust_km_8 <- classifier_km_8$cluster
classifier_clust_km_9 <- classifier_km_9$cluster
classifier_clust_km_10 <- classifier_km_10$cluster
classifier_clust_km_11 <- classifier_km_11$cluster
classifier_clust_km_12 <- classifier_km_12$cluster

# Create a new data frame appending the cluster assignment
class_km_2 <- mutate(classifier_set, cluster = classifier_clust_km_2)
class_km_3 <- mutate(classifier_set, cluster = classifier_clust_km_3)
class_km_4 <- mutate(classifier_set, cluster = classifier_clust_km_4)
class_km_5 <- mutate(classifier_set, cluster = classifier_clust_km_5)
class_km_6 <- mutate(classifier_set, cluster = classifier_clust_km_6)
class_km_7 <- mutate(classifier_set, cluster = classifier_clust_km_7)
class_km_8 <- mutate(classifier_set, cluster = classifier_clust_km_8)
class_km_9 <- mutate(classifier_set, cluster = classifier_clust_km_9)
class_km_10 <- mutate(classifier_set, cluster = classifier_clust_km_10)
class_km_11 <- mutate(classifier_set, cluster = classifier_clust_km_11)
class_km_12 <- mutate(classifier_set, cluster = classifier_clust_km_12)

# Plot the positions of the players and color them using their cluster
ggplot(class_km_2, aes(x = x, y = y, color = factor(cluster))) +
  geom_point()

ggplot(class_km_3, aes(x = x, y = y, color = factor(cluster))) +
  geom_point()

ggplot(class_km_4, aes(x = x, y = y, color = factor(cluster))) +
  geom_point()

ggplot(class_km_5, aes(x = x, y = y, color = factor(cluster))) +
  geom_point()

ggplot(class_km_6, aes(x = x, y = y, color = factor(cluster))) +
  geom_point()

ggplot(class_km_7, aes(x = x, y = y, color = factor(cluster))) +
  geom_point()

ggplot(class_km_8, aes(x = x, y = y, color = factor(cluster))) +
  geom_point()

ggplot(class_km_9, aes(x = x, y = y, color = factor(cluster))) +
  geom_point()

ggplot(class_km_10, aes(x = x, y = y, color = factor(cluster))) +
  geom_point()

ggplot(class_km_11, aes(x = x, y = y, color = factor(cluster))) +
  geom_point()

ggplot(class_km_12, aes(x = x, y = y, color = factor(cluster))) +
  geom_point()


## Estimating K, many models


# Use map_dbl to run many models with varying value of k (centers)
tot_withinss <- map_dbl(2:12,  function(k){
  model <- kmeans(x = classifier_set_n, centers = k)
  model$tot.withinss
})

# Generate a data frame containing both k and tot_withinss
elbow_df <- data.frame(
  k = 2:12,
  tot_withinss = tot_withinss
)

# Plot the elbow plot
ggplot(elbow_df, aes(x = k, y = tot_withinss)) +
  geom_line() +
  geom_point() +
  scale_x_continuous(breaks = 2:12)


# Calculating Euclidean distance

dist_classifier <- dist(classifier_set_n, method = 'euclidean')
head(dist_classifier)

classifier_clust <- hclust(dist_classifier, method = 'average')



