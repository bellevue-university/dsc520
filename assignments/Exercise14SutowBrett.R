# Assignment: ASSIGNMENT Binary
# Name: Sutow, Brett
# Date: 2020-10-21

setwd("/Users/Brett/Desktop/dsc520-master")
binary_df<- read.csv("/Users/Brett/Desktop/dsc520-master/data/binary-classifier-data.csv")
head(binary_df)
binarylrm<- glm(binary_df$label ~ binary_df$x + binary_df$y)
binarylrm
summary(binarylrm)

normalize <-function(x) { (x -min(x))/(max(x)-min(x))   }
binary_norm <- as.data.frame(lapply(binary_df[,c(2:3)],normalize))
head(binary_norm)

data_split <- sample(1:nrow(binary_norm), .8 * nrow(binary_norm))
train<- binary_norm[data_split,]
head(train)
dim(train)

test<- binary_norm[-data_split,]

target_category<-binary_df[data_split, 3]
test_category<- binary_df[-data_split, 3]

target_category
test_category
#Based off what we see in the accuracy test in the target_category
#and test_category it shows that the accuracy is off. We can see these when
#we compare the various numbers in the charts. We are getting higher numbers in the test
install.packages('FNN')
library(FNN)
test_pred<- knn(train, test, cl=target_category)
test_pred

df_pred= data.frame(test_category,test_pred)
df_pred

table<- table(test_category, test_pred)
table
#We can see in the output comparison between accuracy and KNN, that there are still differences. 
#Meaning this shows that the data does not match fully with the predictive model. 

accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(table)

#The main difference is that KNN will always stay the same in output,
#where as from the logistic regression we can see changes throughout because 
#we can see it is using random values. .3333 Would have little value for accuracy. 



