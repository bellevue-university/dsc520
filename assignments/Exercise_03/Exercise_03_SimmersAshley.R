# Assignment: EXERCISE 3
# Name: Simmers, Ashley
# Date: 2020-09-13


##1. What are the observational units in this study?
print("Observation units in this study are Students")

##2. Identify the variables mentioned in the narrative paragraph 
##   and determine which are categorical and quantitative?
class_scores <- read.csv (file = 'data/scores.csv')
str(class_scores)
print(
  "Variables are the amount of students, scores, and section.Section is categorical and scores would be  quantitative")

##3. Create one variable to hold a subset of your data set that contains 
##   only the Regular Section and one variable for the Sports Section.
sports_scores <- subset(class_scores, Section=="Sports")
regular_scores <- subset(class_scores, Section=="Regular")

##4. Use the Plot function to plot each Sections scores and the number 
##   of students achieving that score. Use additional Plot Arguments to 
##   label the graph and give each axis an appropriate label. Once you 
##   have produced your Plots answer the following questions:
library(ggplot2)
library(plyr)

mu<- ddply(class_scores, "Section", summarise, grp.mean=mean(Score))
head(mu)

f <- ggplot(class_scores, aes(x=Score, color=Section, fill=Section)) + 
  geom_histogram(aes(y=..density..), position = "identity", alpha=0.5, bins = 25) +
  geom_density(alpha=0.6) +
  geom_vline(data=mu, aes(xintercept=grp.mean, color=Section), linetype="dashed") +
  labs(title = "Section Scores Histogram", x="Scores", y="Density") +
  theme_classic()
f
##a. Comparing and contrasting the point distributions between the two 
##   section, looking at both tendency and consistency: 
##   Can you say that one section tended to score more points than the 
##   other? Justify and explain your answer.
print("The regular classes had a higher mean score verses the sprots students.")
print("Some of the sport students scored higher but there were also many more lower scores.")
##b. Did every student in one section score more points than every 
##   student in the other section? If not, explain what a statistical 
##   tendency means in this context.
print("Statistical tendancy is most commonly measued by central tendency")
print("We can see that Regular scores mean is higher, scores are also much more dense")
print("There are also less outliers with regular students showing consistancy.")
##c. What could be one additional variable that was not mentioned in the 
##   narrative that could be influencing the point distributions between 
##   the two sections?
print("Another variable that was not mentioned was the count of the scores")
print("If we take into the count of how many scores this variable will change our density")