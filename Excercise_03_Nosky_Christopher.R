# DSC520
# Exercise 3: Test Scores
# Nosky, Christopher
# 2020-12-12

# A professor has recently taught two sections of the same course with only one 
# difference between the sections. In one section, he used only examples taken 
# from sports applications, and in the other section, he used examples taken from
# a variety of application areas. The sports themed section was advertised as 
# such; so students knew which type of section they were enrolling in. The 
# professor has asked you to compare student performance in the two sections 
# using course grades and total points earned in the course. You will need to 
# import the Scores.csv dataset that has been provided for you.
# 
# Use the appropriate R functions to answer the following questions:
#   
#   1. What are the observational units in this study?
# Observational units in this study are Students

setwd('C:/Users/cwnos/Documents/DSC520/Git repo/DSC520/dsc520')

library(readr)
scores_df <- read.csv('data/scores.csv', stringsAsFactors = TRUE)

   
#   2. Identify the variables mentioned in the narrative paragraph and 
#      determine which are categorical and quantitative?
# The variables are Count, Score and Section. Count and Score are Quantitative
# and Section is Categorical. 

summary(scores_df)

  
#   3. Create one variable to hold a subset of your data set that contains 
#      only the Regular Section and one variable for the Sports Section.

split_df <- split(scores_df, scores_df$Section)
sports_df <- split_df$Sports 
regular_df <- split_df$Regular
sports_df
regular_df


#   4. Use the Plot function to plot each Sections scores and the number of 
#      students achieving that score. Use additional Plot Arguments to label the 
#      graph and give each axis an appropriate label. Once you have produced your 
#      Plots answer the following questions:
install.packages('ggplot2')
library(ggplot2)


  #   a. Comparing and contrasting the point distributions between the two 
  #      section, looking at both tendency and consistency: Can you say that one 
  #      section tended to score more points than the other? Justify and explain
  #      your answer.
ggplot(scores_df, aes(y=Score, x=Count, col = Section, shape = Section))+
  geom_point(size=3.0)+facet_grid(~Section)->obj1
obj1+labs(title='Scores by Section', x='Count', y='Scores',
          fill='Section')->obj2
obj2+theme(panel.background = element_rect(fill='lightgoldenrod'),
           panel.grid = element_blank())->obj3
obj3
# Comparing both distributions you can see that the tendency of the 'Regular'
# section with overall higher scores reported by a greater number of 
# students with 270 students reporting higher than 250 where as only 210 
# students reported higher than 250 in the 'Sports' section

  #   b. Did every student in one section score more points than every student 
  #      in the other section? If not, explain what a statistical tendency means in 
  #      this context.
ggplot(scores_df, aes(x=Section, y=Score,fill=Section))+geom_boxplot()+
  stat_summary(fun=mean, geom="point", shape=20, size=14, color="red",
              fill="red")->l1
l1+labs(title='Score Tendency by Section', x='Section', y='Score',
        fill='Section')->l2
l2+theme(panel.background = element_rect(fill='navajowhite2'))->l3
l3
# No, given the boxplot 'Score Tendency by Section' we can see that both
# the median and mean scores of the 'Regular' section were higher but, 
# the range of scores was narrower giving a higher consistency of scores. 
# Both the highest and lowest scores came from the 'Sports' section.

  #   c. What could be one additional variable that was not mentioned in the 
  #      narrative that could be influencing the point distributions between the two 
  #      sections?

# Were there any crossover students or had anyone previously taken either class?
# This might influence the distribution of one group. 
