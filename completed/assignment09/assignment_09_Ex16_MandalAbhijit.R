#title: 'ASSIGNMENT 9 Exercise 16: Clustering'
#author: "Abhijit Mandal"
#date: '2020-11-01'


## Set the working directory to the root of your DSC 520 directory

setwd("~/Documents/GitHub/dsc520")

#Load the `clustering-data.csv`

clustering_data <- read.csv("data/clustering-data.csv")
head(clustering_data)
summary(clustering_data)


#plot the data point
library(ggplot2)
ggplot(data = clustering_data, aes(y = y, x = x)) + geom_point() + ggtitle("Clustering Data")

cluster_matrix <- data.matrix(clustering_data)
wss <- (nrow(cluster_matrix) -1) * sum(apply(cluster_matrix,2,var))
total.withinss_values <- NULL
average_distance <- NULL
kmean_values<- NULL

for(i in 2:12){
  wss[i] <- sum(kmeans(cluster_matrix,centers=i)$tot.withinss)
  
  cdata <- clustering_data
  cdata.kmeanscluster <- kmeans(cdata, i)
  cdata$cluster <- as.factor(cdata.kmeanscluster$cluster)
  
  p <- ggplot(data = cdata, aes(x = x, y = y, color = cluster)) + geom_point(size = 0.5) + geom_point(data = as.data.frame(cdata.kmeanscluster$centers), 
color = "blue", shape = 10, size = 2) + ggtitle(paste("K Means Cluster for K = ", i, sep ="")) + theme_bw()

  #display graph
  print(p)
  
  kmean_values<- c(kmean_values, i)
  x.distance <- cdata.kmeanscluster$centers[cdata$cluster] - cdata$x
  y.distance <- cdata.kmeanscluster$centers[cdata$cluster] - cdata$y
  total.distance <- sqrt((x.distance ** 2) + (y.distance ** 2))
  average_distance <- c(average_distance, mean(total.distance))
  total.withinss_values <- c(total.withinss_values, cdata.kmeanscluster$tot.withinss)
  
}

avg_distdata <- data.frame(kmean_values, average_distance)
avg_distdata
ggplot(data = avg_distdata, aes(x=kmean_values, y=average_distance)) + xlab("Clusters") + ylab("Average Distance") + theme_bw() + geom_point() + geom_line(color = "blue")

#Plot SS
plot(1:12, wss, type="b",xlab="Number of clusters",ylab="within sum of squares")
totalWithinSS <- data.frame(kmean_values, total.withinss_values)
totalWithinSS
ggplot(data = totalWithinSS, aes(x=kmean_values, y=total.withinss_values)) + xlab("Clusters") + ylab("Within SS") + theme_bw() + geom_point() + geom_line(color = "blue")

