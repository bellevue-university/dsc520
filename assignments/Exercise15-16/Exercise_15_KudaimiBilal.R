#Set working directory and importing data and libraries

setwd('C:/Users/PS3ma/Documents/GitHub/dsc520')

library('ggplot2')
library('class')

binary <- read.csv('data/binary-classifier-data.csv')
trinary <- read.csv('data/trinary-classifier-data.csv')

#A: Plotting the two datasets on a scatter plot
ggplot(binary, aes(x, y, color = label)) + geom_point() + xlab('X') + ylab('Y') + ggtitle('Scatter plot of binary data')
ggplot(trinary, aes(x, y, color = label)) + geom_point() + xlab('X') + ylab('Y') + ggtitle('Scatter plot of trinary data')




#B: Generating a KNN model for each dataset

#Building the training and testing data for each data set
#70% of our dataset will be used for training and the remainder for testing
data <- sample(1:nrow(binary), size=nrow(binary)*0.7, replace = FALSE) 
data1 <- sample(1:nrow(trinary), size=nrow(trinary)*0.7, replace = FALSE) 

train <- binary[data,] 
test <- binary[-data,]
train1 <- trinary[data1,]
test1 <- trinary[-data1,] 

#Building the KNN models for each data set at different k values.
#The for loop was not working for some reason, so I wrote 
#out each model computation for each k value manually. The code does work.
model_binary_3 <- knn(train[2:3], test[2:3], cl = train$label, k = 3)
model_trinary_3 <- knn(train1[2:3], test1[2:3], cl = train1$label, k = 3)

model_binary_5 <- knn(train[2:3], test[2:3], cl = train$label, k = 5)
model_trinary_5 <- knn(train1[2:3], test1[2:3], cl = train1$label, k = 5)

model_binary_10 <- knn(train[2:3], test[2:3], cl = train$label, k = 10)
model_trinary_10 <- knn(train1[2:3], test1[2:3], cl = train1$label, k = 10)

model_binary_15 <- knn(train[2:3], test[2:3], cl = train$label, k = 15)
model_trinary_15 <- knn(train1[2:3], test1[2:3], cl = train1$label, k = 15)

model_binary_20 <- knn(train[2:3], test[2:3], cl = train$label, k = 20)
model_trinary_20 <- knn(train1[2:3], test1[2:3], cl = train1$label, k = 20)

model_binary_25 <- knn(train[2:3], test[2:3], cl = train$label, k = 25)
model_trinary_25 <- knn(train1[2:3], test1[2:3], cl = train1$label, k = 25)

#Defining the function that will compute our accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}

#Calculating the accuracy for each K value
percent_binary_3 <- accuracy(table(model_binary_3, test$label))
percent_trinary_3 <- accuracy(table(model_trinary_3, test1$label))

percent_binary_5 <- accuracy(table(model_binary_5, test$label))
percent_trinary_5 <- accuracy(table(model_trinary_5, test1$label))

percent_binary_10 <- accuracy(table(model_binary_10, test$label))
percent_trinary_10 <- accuracy(table(model_trinary_10, test1$label))

percent_binary_15 <- accuracy(table(model_binary_15, test$label))
percent_trinary_15 <- accuracy(table(model_trinary_15, test1$label))

percent_binary_20 <- accuracy(table(model_binary_20, test$label))
percent_trinary_20 <- accuracy(table(model_trinary_20, test1$label))

percent_binary_25 <- accuracy(table(model_binary_25, test$label))
percent_trinary_25 <- accuracy(table(model_trinary_25, test1$label))

k_values <- c(3, 5, 10, 15, 20, 25)

#Made data frames of K values and accuracies for each dataset at each K value
binary_accuracies <- c(percent_binary_3, percent_binary_5, percent_binary_10, percent_binary_15, percent_binary_20, percent_binary_25)
trinary_accuracies <- c(percent_trinary_3, percent_trinary_5, percent_trinary_10, percent_trinary_15, percent_trinary_20, percent_trinary_25)

binary_df <- data.frame(k_values, binary_accuracies)
trinary_df <- data.frame(k_values, trinary_accuracies)

#Used each data frame to plot the K values and accuracies for each dataset
ggplot(binary_df, aes(k_values, binary_accuracies)) + geom_line(color = "blue") + geom_point() + xlab('K values') + ylab('Accuracy') + ggtitle('Accuracy at each K value for the binary data set')
ggplot(trinary_df, aes(k_values, trinary_accuracies)) + geom_line(color = "blue") + geom_point() + xlab('K values') + ylab('Accuracy') + ggtitle('Accuracy at each K value for the trinary data set')



#C: I believe that linear classifiers would not work well with these datasets.
#If we look at the scatter plots, we can see that a straight line is not optimal
#to divide the data clusters.