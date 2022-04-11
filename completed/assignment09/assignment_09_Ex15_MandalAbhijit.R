#title: 'ASSIGNMENT 9 Exercise 15: Introduction to Machine Learning'
#author: "Abhijit Mandal"
#date: '2020-10-31'


## Set the working directory to the root of your DSC 520 directory

setwd("~/Documents/GitHub/dsc520")

classifierdata.binary <- read.csv("data/binary-classifier-data.csv")
head(classifierdata.binary)
summary(classifierdata.binary)

## Load the `trinary-classifier-data.csv`
classifierdata.trinary <- read.csv("data/trinary-classifier-data.csv")
head(classifierdata.trinary)
summary(classifierdata.trinary)

classifierdata.binary$label <- as.factor(classifierdata.binary$label)
classifierdata.trinary$label <- as.factor(classifierdata.trinary$label)

library(ggplot2)
ggplot(data = classifierdata.binary, aes(y = y, x = x, color = label)) + 
  geom_point() + ggtitle("Binary Classifier data")

ggplot(data = classifierdata.trinary, aes(y = y, x = x, color = label)) + 
  geom_point() + ggtitle("Trinary Classifier data")




## Binary Classifier - Select data points, normalize and Split 80-20 into train and test datasets.

#normalize function
normalize<-function(x){
  return (
    (x - min(x))/max(x)-min(x)
  )
}

classifierdata.normalizedbinary<-as.data.frame(lapply(classifierdata.binary[,c(2:3)], normalize))
head(classifierdata.normalizedbinary)
str(classifierdata.normalizedbinary)
summary(classifierdata.normalizedbinary)

#Select train and test data

data.d = sample(1:nrow(classifierdata.normalizedbinary), size= nrow(classifierdata.normalizedbinary) *0.8, replace = FALSE)
traindata.binary <- classifierdata.binary[data.d,] #80% training data
testdata_binary <- classifierdata.binary[-data.d,] #20% training data

#Create separate dataframes for train and test data for label 
traindata_binary_df<-classifierdata.binary[data.d,1]
testdata_binary_df<-classifierdata.binary[-data.d,1]

k_valuebinary<-round(sqrt(nrow(classifierdata.binary)))

library(class)

# find no of observations
NROW(traindata_binary_df)

#define result data frames
k_binarydata <- c()
accurary_binarydata <- c()

# Calculate KNN for K=3
knn.3 <- knn(train = traindata.binary , test = testdata_binary, cl = traindata_binary_df, k = 3)
# Calculate Accuracy
acc.3 <- 100* sum(testdata_binary_df == knn.3)/NROW(testdata_binary_df)
acc.3
k_binarydata <- c(k_binarydata, 3)
accurary_binarydata<- c(accurary_binarydata, acc.3)

# Calculate KNN for K=5
knn.5 <- knn(train = traindata.binary , test = testdata_binary, cl = traindata_binary_df, k = 5)
# Calculate Accuracy
acc.5 <- 100* sum(testdata_binary_df == knn.5)/NROW(testdata_binary_df)
acc.5
k_binarydata <- c(k_binarydata, 5)
accurary_binarydata<- c(accurary_binarydata, acc.5)

# Calculate KNN for K=10
knn.10 <- knn(train = traindata.binary , test = testdata_binary, cl = traindata_binary_df, k = 10)
# Calculate Accuracy
acc.10 <- 100* sum(testdata_binary_df == knn.10)/NROW(testdata_binary_df)
acc.10
k_binarydata <- c(k_binarydata, 10)
accurary_binarydata<- c(accurary_binarydata, acc.10)

# Calculate KNN for K=15
knn.15 <- knn(train = traindata.binary , test = testdata_binary, cl = traindata_binary_df, k = 15)
# Calculate Accuracy
acc.15 <- 100* sum(testdata_binary_df == knn.15)/NROW(testdata_binary_df)
acc.15
k_binarydata <- c(k_binarydata, 15)
accurary_binarydata<- c(accurary_binarydata, acc.15)

# Calculate KNN for K=20
knn.20 <- knn(train = traindata.binary , test = testdata_binary, cl = traindata_binary_df, k = 20)
# Calculate Accuracy
acc.20 <- 100* sum(testdata_binary_df == knn.20)/NROW(testdata_binary_df)
acc.20
k_binarydata <- c(k_binarydata, 20)
accurary_binarydata<- c(accurary_binarydata, acc.20)

# Calculate KNN for K=25
knn.25 <- knn(train = traindata.binary , test = testdata_binary, cl = traindata_binary_df, k = 25)
# Calculate Accuracy
acc.25 <- 100* sum(testdata_binary_df == knn.25)/NROW(testdata_binary_df)
acc.25 
k_binarydata <- c(k_binarydata, 25)
accurary_binarydata<- c(accurary_binarydata, acc.25)

# Calculate KNN for K=38 (square root of observations)
knn.38 <- knn(train = traindata.binary , test = testdata_binary, cl = traindata_binary_df, k = 38)
# Calculate Accuracy
acc.38 <- 100* sum(testdata_binary_df == knn.38)/NROW(testdata_binary_df)
acc.38 
k_binarydata <- c(k_binarydata, 38)
accurary_binarydata<- c(accurary_binarydata, acc.38)

accuracy_binarydata_df <- data.frame(k_binarydata, accurary_binarydata)
accuracy_binarydata_df
## K Values vs Accuracy Plotting

library(ggplot2)

ggplot(data = accuracy_binarydata_df, aes(y = accurary_binarydata, x = k_binarydata)) + 
  
  geom_line() + ggtitle("Binary Classifier - Accuracy vs K Value") +
  
  ylab("Accuracy %") + xlab("K value")

#====================


## Trinary Classifier - Select data points, normalize and Split 80-20 into train and test datasets.

#normalize function
normalize<-function(x){
  return (
    (x - min(x))/max(x)-min(x)
  )
}

classifierdata.normalizedtrinary<-as.data.frame(lapply(classifierdata.trinary[,c(2:3)], normalize))
head(classifierdata.normalizedtrinary)
str(classifierdata.normalizedtrinary)
summary(classifierdata.normalizedtrinary)

#Select train and test data

data.d = sample(1:nrow(classifierdata.normalizedtrinary), size= nrow(classifierdata.normalizedtrinary) *0.8, replace = FALSE)
traindata.trinary <- classifierdata.trinary[data.d,] #80% training data
testdata_trinary <- classifierdata.trinary[-data.d,] #20% training data

#Create separate dataframes for train and test data for label 
traindata_trinary_df<-classifierdata.trinary[data.d,1]
testdata_trinary_df<-classifierdata.trinary[-data.d,1]

k_valuetrinary<-round(sqrt(nrow(classifierdata.trinary)))

library(class)

# find no of observations
NROW(traindata_trinary_df)

#define result data frames
k_trinarydata <- c()
accurary_trinarydata <- c()

# Calculate KNN for K=3
knn.3 <- knn(train = traindata.trinary , test = testdata_trinary, cl = traindata_trinary_df, k = 3)
# Calculate Accuracy
acc.3 <- 100* sum(testdata_trinary_df == knn.3)/NROW(testdata_trinary_df)
acc.3
k_trinarydata <- c(k_trinarydata, 3)
accurary_trinarydata<- c(accurary_trinarydata, acc.3)

# Calculate KNN for K=5
knn.5 <- knn(train = traindata.trinary , test = testdata_trinary, cl = traindata_trinary_df, k = 5)
# Calculate Accuracy
acc.5 <- 100* sum(testdata_trinary_df == knn.5)/NROW(testdata_trinary_df)
acc.5
k_trinarydata <- c(k_trinarydata, 5)
accurary_trinarydata<- c(accurary_trinarydata, acc.5)

# Calculate KNN for K=10
knn.10 <- knn(train = traindata.trinary , test = testdata_trinary, cl = traindata_trinary_df, k = 10)
# Calculate Accuracy
acc.10 <- 100* sum(testdata_trinary_df == knn.10)/NROW(testdata_trinary_df)
acc.10
k_trinarydata <- c(k_trinarydata, 10)
accurary_trinarydata<- c(accurary_trinarydata, acc.10)

# Calculate KNN for K=15
knn.15 <- knn(train = traindata.trinary , test = testdata_trinary, cl = traindata_trinary_df, k = 15)
# Calculate Accuracy
acc.15 <- 100* sum(testdata_trinary_df == knn.15)/NROW(testdata_trinary_df)
acc.15
k_trinarydata <- c(k_trinarydata, 15)
accurary_trinarydata<- c(accurary_trinarydata, acc.15)

# Calculate KNN for K=20
knn.20 <- knn(train = traindata.trinary , test = testdata_trinary, cl = traindata_trinary_df, k = 20)
# Calculate Accuracy
acc.20 <- 100* sum(testdata_trinary_df == knn.20)/NROW(testdata_trinary_df)
acc.20
k_trinarydata <- c(k_trinarydata, 20)
accurary_trinarydata<- c(accurary_trinarydata, acc.20)

# Calculate KNN for K=25
knn.25 <- knn(train = traindata.trinary , test = testdata_trinary, cl = traindata_trinary_df, k = 25)
# Calculate Accuracy
acc.25 <- 100* sum(testdata_trinary_df == knn.25)/NROW(testdata_trinary_df)
acc.25 
k_trinarydata <- c(k_trinarydata, 25)
accurary_trinarydata<- c(accurary_trinarydata, acc.25)

# Calculate KNN for K=38 (square root of observations)
knn.38 <- knn(train = traindata.trinary , test = testdata_trinary, cl = traindata_trinary_df, k = 38)
# Calculate Accuracy
acc.38 <- 100* sum(testdata_trinary_df == knn.38)/NROW(testdata_trinary_df)
acc.38 
k_trinarydata <- c(k_trinarydata, 38)
accurary_trinarydata<- c(accurary_trinarydata, acc.38)

accuracy_trinarydata_df <- data.frame(k_trinarydata, accurary_trinarydata)
accuracy_trinarydata_df
## K Values vs Accuracy Plotting

library(ggplot2)

ggplot(data = accuracy_trinarydata_df, aes(y = accurary_trinarydata, x = k_trinarydata)) + 
  
  geom_line() + ggtitle("trinary Classifier - Accuracy vs K Value") +
  
  ylab("Accuracy %") + xlab("K value")