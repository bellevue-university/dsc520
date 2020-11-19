#Installing necessary packages for exercise 3#
install.packages("tidyverse")
install.packages("readxl")
install.packages("readcsv")
install.packages("ggplot2")
library(readxl)
library(ggplot2)

#Setup of initial exercise 3#
scores <- read.csv("/Users/Brett/Downloads/scores.csv")
print(scores)
names(scores)

#Assigning names to categories#
count<- scores[,c(1)]
grades <- scores[,c(2)]
section <- scores[,c(3)]
print(section)

#Creating subset#
regular_section <- subset(scores,section == "Regular") 
print(regular_section)

sports_section <- subset(scores, section == "Sports")
print(sports_section)
table(scores$Section)
   
#Plot with all points sharing spots#
ggplot(scores,aes(count, grades)) +
  geom_point(aes(color = section)) + 
  labs(title = "Student Section Comparison",
       subtitle = "Sports vs Regular Course Grades" , 
       caption = "Scores Data")
  
#Below is same plot with jittering and different shape, this ensures all points can be seen#
ggplot(scores,aes(count, grades)) +
  geom_point(aes(color = section), position = "jitter", size = 5, shape = 18) + 
  labs(title = "Student Section Comparison",
       subtitle = "Sports vs Regular Course Grades" , 
       caption = "Scores Data")

