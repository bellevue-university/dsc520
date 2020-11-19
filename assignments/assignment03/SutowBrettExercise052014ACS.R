install.packages("tidyverse")
install.packages("readxl")
install.packages("readcsv")
install.packages("ggplot2")
library(readxl)
library(ggplot2)
install.packages("pastecs")
library(pastecs)
install.packages("psych")
library(psych)


#Uploading File#
ACS2014<-read.csv("/Users/Brett/Desktop/dsc520-master/acs-14-1yr-s0201.csv")
print(ACS2014)

#Please provide the output from the following functions: str(); nrow(); ncol()#
str(ACS2014)
nrow(ACS2014)
ncol(ACS2014)

#Assigning Graph Values#
HSDegreeHisto <- ggplot(data = ACS2014, aes(x = HSDegree)) + geom_histogram(binwidth = 2) 

HSDegreeDensity <- ggplot(data = ACS2014, aes(x = HSDegree)) + geom_density()

#Histogram#
print(HSDegreeHisto) + labs(title = "2014 American Community Survey", x="Degree Percentage", y= "Count") 

#Histogram with Density Plot#
HSDegreeHisto + geom_density(aes(y=2 * ..count..), color = "red") +
labs(title = "2014 American Community Survey", x="Degree Percentage", y= "Count")

#Probability Plot#
qqnorm(ACS2014$HSDegree)

#Quantify Normality#
stat.desc(ACS2014)
stat.desc(ACS2014$HSDegree)
describe(ACS2014$HSDegree)
