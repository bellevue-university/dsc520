# Assignment: ASSIGNMENT 3
# Name: Sutow, Brett
# Date: 2020-09-17
install.packages("ggplot2")
## Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("/Users/Brett/Desktop/dsc520-master")

## Load the `data/r4ds/heights.csv` to
heights_df <- read.csv("data/r4ds/heights.csv")
print(heights_df)

# https://ggplot2.tidyverse.org/reference/geom_point.html
## Using `geom_point()` create three scatterplots for
## `height` vs. `earn`
earn<- heights_df[,c(1)]
height<- heights_df[,c(2)]
sex<- heights_df[,c(3)]
ed<- heights_df[,c(4)]
age<- heights_df[,c(5)]
race<- heights_df[,c(6)]


ggplot(heights_df, aes(x= height, y= earn)) + geom_point( )+
  labs(title= "Height vs Earnings", x="Height", y="Earnings")

## `age` vs. `earn`
ggplot(heights_df, aes(x=age, y=earn)) + geom_point( )+
  labs(title= "Age vs Earnings", x="Age", y="Earnings")

## `ed` vs. `earn`
ggplot(heights_df, aes(x=ed, y=earn)) + geom_point( )+
  labs(title= "Ed vs Earnings", x="Ed", y="Earnings")

## Re-create the three scatterplots and add a regression trend line using
## the `geom_smooth()` function
## `height` vs. `earn`
ggplot(heights_df, aes(x= height, y= earn)) + geom_point( )+
 geom_smooth() + labs(title= "Height vs Earnings", x="Height", y="Earnings")

## `age` vs. `earn`
ggplot(heights_df, aes(x=age, y=earn)) + geom_point( )+
  geom_smooth() + labs(title= "Age vs Earnings", x="Age", y="Earnings")

## `ed` vs. `earn`
ggplot(heights_df, aes(x=ed, y=earn)) + geom_point( )+
  geom_smooth() + labs(title= "Ed vs Earnings", x="Ed", y="Earnings")


## Create a scatterplot of `height`` vs. `earn`.  Use `sex` as the `col` (color) attribute
ggplot(heights_df, aes(x= height, y= earn, col= sex)) + geom_point( )+
   labs(title= "Height vs Earnings", x="Height", y="Earnings")


## Using `ggtitle()`, `xlab()`, and `ylab()` to add a title, x label, and y label to the previous plot
## Title: Height vs. Earnings
## X label: Height (Inches)
## Y Label: Earnings (Dollars)
ggplot(heights_df, aes(x= height, y= earn, col= sex)) + geom_point( )+
  ggtitle("Height vs Earnings") + labs(x="Height(Inches)", y="Earnings(Dollars)")


# https://ggplot2.tidyverse.org/reference/geom_histogram.html
## Create a histogram of the `earn` variable using `geom_histogram()`
ggplot(heights_df, aes(earn)) + geom_histogram()

## Create a histogram of the `earn` variable using `geom_histogram()`
## Use 10 bins
ggplot(heights_df, aes(earn)) + geom_histogram(bins = 10)

# https://ggplot2.tidyverse.org/reference/geom_density.html
## Create a kernel density plot of `earn` using `geom_density()`
ggplot(heights_df, aes(earn)) +  geom_density()
