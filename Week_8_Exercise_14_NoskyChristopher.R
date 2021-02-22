library(caTools)
library(readr)
library(class)

setwd('C:/Users/cwnos/Documents/DSC520/Git repo/DSC520/dsc520/Week 8')

binary_data <- read.csv('binary-classifier-data.csv')

# binary_data$label <- as.factor(binary_data$label)
# binary_data$x <- as.factor(binary_data$x)
# binary_data$y <- as.factor(binary_data$y)

split <- sample.split(binary_data, SplitRatio = 0.80)


binary_train <- subset(binary_data,  split == 'TRUE')
binary_test <- subset(binary_data, split == 'FALSE')

LogModel.1 <- glm(label~x+y, data = binary_train, family = binomial())
summary(LogModel.1)

LogModel.1.train <- predict(LogModel.1, binary_train, type= 'response') 
LogModel.1.train

LogModel.1.test <- predict(LogModel.1, binary_test, type = 'response')
LogModel.1.test

# Model 1 Train confusion matrix
confmatrix.1 <- table(Actual_Value=binary_train$label, Predicted_Value = LogModel.1.train > 0.5)
confmatrix.1
# Model 1 Test confusion matrix
confmatrix.2 <- table(Actual_Value=binary_test$label, Predicted_Value = LogModel.1.test > 0.5)
confmatrix.2

# Model 1 Train acc
(confmatrix.1[[1,1]] + confmatrix.1[[2,2]]) / sum(confmatrix.1)
# Model 1 Test acc
(confmatrix.2[[1,1]] + confmatrix.2[[2,2]]) / sum(confmatrix.2)

# BinaryClassifier <- read.csv('binary-classifier-data.csv')
# 
# library(caret)
# train_index=createDataPartition(BinaryClassifier$label, p=0.6)$Resample1
# training_set=BinaryClassifier[train_index,] 
# test_set=BinaryClassifier[-train_index,]
# 
# library(broom)
# glm1 <- glm(label ~ x + y,family = binomial(),data = training_set)
# 
# tidy(glm1)


# Split for training / test

set.seed(123) #Getting random sample
dat.d <- sample(1:nrow(binary_data), size=nrow(binary_data)*0.8, replace = FALSE) # Selects 70% of data at random

train.binary <-  binary_data[dat.d,] # 70% training data
test.binary <- binary_data[-dat.d,] # remaining 30% for testing

# Now creating seperate dataframe for 'Creditability' feature which is our target
train.binary_labs <- binary_data[dat.d,1]
test.binary_labs <- binary_data[-dat.d, 1]

NROW(train.binary_labs)

bin_knn_3 <- knn(train=train.binary, test=test.binary, cl=train.binary_labs, k=3)

# Let's calculate the proprotion of correct classification for k = 3

bin_acc_3 <- 100 * sum(test.binary_labs == bin_knn_3)/NROW(test.binary_labs) # For knn = 3
bin_acc_3 # Accuracy 

table(bin_knn_3, test.binary_labs) # to check prediction against actual value in tabular form
bin_knn_3

# ConfusionMatrix
confusionMatrix(table(bin_knn_3, test.binary_labs))

i=1 # Declaration to initiate for loop
bin.k.optm=1 # Declaration to initiate for loop
for (i in 2:25){
  bin.knn.mod <- knn(train=train.binary, test=test.binary, cl=train.binary_labs, k=i)
  bin.k.optm[i] <- 100 * sum(test.binary_labs == bin.knn.mod)/NROW(test.binary_labs)
  k=i
  cat(k,'=', bin.k.optm[i], '\n')
}

plot(bin.k.optm, type='b', xlab='K- Value', ylab='Accuracy level')
