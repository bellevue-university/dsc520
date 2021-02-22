library(foreign)
library(caTools)

setwd('C:/Users/cwnos/Documents/DSC520/Git repo/DSC520/dsc520/Week 8')

surgery <- read.arff('ThoraricSurgery.arff')

head(surgery)

surgery$asthma <- as.factor(surgery$PRE32)

split <- sample.split(surgery, SplitRatio = 0.75) 
split

str(surgery$PRE6)
str(surgery$PRE7)
str(surgery$PRE8)
str(surgery$PRE9)
str(surgery$PRE10)
str(surgery$PRE11)
str(surgery$PRE14)
str(surgery$PRE17)
str(surgery$PRE19)
str(surgery$PRE25)
str(surgery$PRE30)
str(surgery$asthma)
str(surgery$Risk1Yr)

surgery$asthma <- as.factor(surgery$PRE32)


surgery_train <- subset(surgery,  split == 'TRUE')
surgery_test <- subset(surgery, split == 'FALSE')

# Model with all binary variables included
LogModel.1 <- glm(Risk1Yr ~ PRE6 + PRE7 + PRE8 + PRE9 + PRE10 + PRE11 + PRE14 + PRE17 + PRE19 + PRE25 + PRE30, data = surgery_train, family = 'binomial')
summary(LogModel.1)
# Model with significant varibles only
LogModel.2 <- glm(Risk1Yr ~ PRE9 + PRE14 + PRE17, data = surgery_train, family = 'binomial')
summary(LogModel.2)


# Testing
# Model 1 test and train prediction
surgery.1_test_pred <- predict(LogModel.1, surgery_test, type= 'response') 
surgery.1_test_pred

surgery.1_train_pred <- predict(LogModel.1, surgery_train, type = 'response')
surgery.1_train_pred

# Model 2 test and train prediction 
surgery.2_test_pred <- predict(LogModel.2, surgery_test, type = 'response')
surgery.2_test_pred

surgery.2_train_pred <- predict(LogModel.2, surgery_train, type = 'response')
surgery.2_train_pred


# Validate
# Model 1 Train confusion matrix
confmatrix.1 <- table(Actual_Value=surgery_train$Risk1Yr, Predicted_Value = surgery.1_train_pred > 0.5)
confmatrix.1
# Model 1 Test confusion matrix
confmatrix.2 <- table(Actual_Value=surgery_test$Risk1Yr, Predicted_Value = surgery.1_test_pred > 0.5)
confmatrix.2
# Model 2 Train confusion matrix
confmatrix.3 <- table(Actual_Value=surgery_train$Risk1Yr, Predicted_Value = surgery.2_train_pred > 0.5)
confmatrix.3
# Model 2 Train Confusion matrix
confmatrix.4 <- table(Actual_Value=surgery_test$Risk1Yr, Predicted_Value = surgery.2_test_pred > 0.5)
confmatrix.4


# Accuracy
# Model 1 Train acc
(confmatrix.1[[1,1]] + confmatrix.1[[2,2]]) / sum(confmatrix.1)
# Model 1 Test acc
(confmatrix.2[[1,1]] + confmatrix.2[[2,2]]) / sum(confmatrix.2)
# Model 2 Train acc
(confmatrix.3[[1,1]] + confmatrix.3[[2,2]]) / sum(confmatrix.3)
# Model 2 Test acc
(confmatrix.4[[1,1]] + confmatrix.4[[2,2]]) / sum(confmatrix.4)

