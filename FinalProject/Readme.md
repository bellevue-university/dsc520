### Breast Cancer Identification

#### Breast Cancer is the top rated type of cancer amongst women; which took away 627,000 lives alone. 
![image](https://user-images.githubusercontent.com/13950516/162662163-09a7a2a2-a649-4975-81b1-752f83428054.png)

This high mortality rate due to breast cancer does need attention, for early detection so that prevention can be done in time. 
As a potential contributor to state-of-art technology development, data mining and machine learning finds a multi-fold application in predicting 
Breast cancer. 
The objective of this project is to classify each of the tumor to be malignant or benign.

The intent of this project is to assist doctors in diagnosing breast cancer for patients, allowing physicians to spend more time on treating the disease. Using machine learning methods for diagnostic can significantly increase processing speed and on a big scale can make the diagnostic significantly cheaper.

### Some of the questions that we are looking to solve here are:

- How do we define a tumor as malignant or benign ?
- Can any benign tumor turn to malignant at later time ?
- What are the characteristics of a malignant and benign tumor (size, mass, texture, smoothness etc)?
- Does the chances of a breast cancer varies from individual to individual?

![image](https://user-images.githubusercontent.com/13950516/162662239-6c732024-3b3e-4b3e-90e9-ba7c32b791cb.png)


### Dataset
The dataset is taken from https://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Diagnostic%29

### Variable Descriptions
diagnosis --> The diagnosis of breast tissues (M = malignant, B = benign)

radius_mean --> mean of distances from center to points on the perimeter

texture_mean --> standard deviation of gray-scale values

perimeter_mean --> mean size of the core tumor

smoothness_mean --> mean of local variation in radius lengths

compactness_mean --> mean of perimeter^2 / area - 1.0

concavity_mean --> mean of severity of concave portions of the contour

concave points_mean --> mean for number of concave portions of the contour

fractaldimensionmean --> mean for "coastline approximation" - 1

radius_se --> standard error for the mean of distances from center to points on the perimeter

texture_se --> standard error for standard deviation of gray-scale values

smoothness_se --> standard error for local variation in radius lengths

compactness_se --> standard error for perimeter^2 / area - 1.0

concavity_se --> standard error for severity of concave portions of the contour

concave points_se --> standard error for number of concave portions of the contour

fractaldimensionse --> standard error for "coastline approximation" - 1

radius_worst --> "worst" or largest mean value for mean of distances from
center to points on the perimeter

texture_worst --> "worst" or largest mean value for standard deviation of gray-scale values

smoothness_worst --> "worst" or largest mean value for local variation in radius lengths

compactness_worst --> "worst" or largest mean value for perimeter^2 / area - 1.0

concavity_worst --> "worst" or largest mean value for severity of concave portions of the contour

concave points_worst --> "worst" or largest mean value for number of concave portions of the contour

fractaldimensionworst--> "worst" or largest mean value for "coastline approximation" - 1

### Approach

We will first analyze the data and look for any cleanups needed, then we will derive correlation between the variables, after visualizing and analyzing the data we will use machine learning algorithm KNN to derive at a conclusion.

I have considered variables such as tumor size, mass, texture, smoothness, thickness etc that can help in predicting the chances of a tumor being malignant or benign, 

I have used K-nearest neighbor algorithm to classify the tumor, the result of this algorithm provided an accurate response.

<img width="420" alt="image" src="https://user-images.githubusercontent.com/13950516/162662282-ad502e34-3b56-4690-9b04-234091bd4ab7.png">

### Conclusion

We have features of a tumor but I was not sure what does they mean or actually how much do we need to know about these features I believe that we do not need to know meaning of these features however in order to imagine in our mind we should know something like variance, standard deviation, number of sample (count) or max min values. 

These type of information helps to understand about what is going on data. For example , the question is appeared in my mind the area_mean feature’s max value is 2500 and smoothness_mean features’ max 0.16340. Also, it would have been great if i could compare the result of my data model vs other machine learning algorithms like Random Forest, SVM etc. 

In future we can look into the implementation of artificial neural net and deep learning for predictive model development with a larger and un- structured data set. 
This will use unsupervised learning algorithms such SVM etc. to first label the data and distributing them over training set, cross-validation set and test set.

