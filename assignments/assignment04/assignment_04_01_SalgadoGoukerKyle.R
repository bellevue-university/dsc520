# Assignment: ASSIGNMENT 4-1
# Name: Salgado-Gouker, Kyle
# Date: 2023-1-3

## A professor has recently taught two sections of the same course with only one
## difference between the sections. In one section, he used only examples taken
## from sports applications, and in the other section, he used examples taken
## from a variety of application areas. The sports themed section was advertised
## as such; so students knew which type of section they were enrolling in. The
## professor has asked you to compare student performance in the two sections
## using course grades and total points earned in the course. You will need to
## import the Scores.csv dataset that has been provided for you.

## Load the packages
library(data.table)
library(rlist)
library(ggplot2)
library(pastecs)

theme_set(theme_minimal())

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/kyles/OneDrive/Documents/GitHub/dsc520")

## Load the `data/scores.csv` to
scores_df <- read.csv("data/scores.csv")
str(scores_df)
nrow(scores_df)
ncol(scores_df)

## Use the appropriate R functions to answer the following questions:

## 1. What are the observational units in this study?
## Count, Score, Section
## 
## 2. Identify the variables mentioned in the narrative paragraph and determine
## which are categorical and quantitative?
## 
## Quantitative: Count, Score
## Categorical: Section
## 
## 3. Create one variable to hold a subset of your data set that contains only
## the Regular Section and one variable for the Sports Section.

scores_df <- setorder(scores_df, Score)
sports_df = scores_df[scores_df$Section == "Sports", ]
regular_df = scores_df[scores_df$Section == "Regular", ]

## 4. Use the Plot function to plot each Sections scores and the number of
## students achieving that score. Use additional Plot Arguments to label the
## graph and give each axis an appropriate label. Once you have produced your
## Plots answer the following questions:

scores_plot = ggplot(scores_df, aes(x = Score, y = Count, color=Section)) + geom_point() + 
  scale_color_manual(values = c("Sports" = "purple","Regular"="orange")) + 
  ggtitle("Student Performance") + xlab("Total Score") + ylab("Student Count") + lims(x = c(200, 400), y = c(0, 30))

scores_lines = ggplot(scores_df, aes(x=Score, y=Count, color=Section)) + geom_line() + geom_point() + 
  scale_color_manual(values = c("Sports" = "purple","Regular"="orange")) + 
  ggtitle("Student Performance") + xlab("Total Score") + ylab("Student Count") + lims(x = c(200, 400), y = c(0, 30))

# To analyze distribution, consider each student's data. 
# Build a data frame with each student's scores for plotting

total_students = 0
total_regular_students = 0
total_sports_students = 0

student_table <- data.frame();

for (row in 1:nrow(scores_df)) {
  section <- scores_df[row, 'Section']
  count <- scores_df[row, 'Count']
  for (student in 1:count) {
    if (total_students == 0) { # first time
      student_table <- data.frame(scores_df[row, 'Score'], section)
      names(student_table)<-c('Score', 'Section')
    }
    else {
      new_student <- data.frame(scores_df[row, 'Score'], section)
      names(new_student)<-c('Score', 'Section')
      student_table <- rbind(student_table, new_student)
    }
    total_students <- total_students + 1
  }
  if (section=='Regular') {
    total_regular_students <-total_regular_students + count
  }
  else {
    total_sports_students <- total_sports_students + count
  }
  scores_df[row, 'total_regular_students_scoring'] = sum(regular_df$Count)-total_regular_students
  scores_df[row, 'total_sports_students_scoring'] = sum(sports_df$Count)-total_sports_students
  if (section=='Regular') {
    scores_df[row, 'total_students_scoring'] = sum(regular_df$Count)-total_regular_students
  }
  else {
    scores_df[row, 'total_students_scoring'] = sum(sports_df$Count)-total_sports_students
  }
}

# Connect the plot with lines

scores_accum_lines = ggplot(scores_df, aes(x=Score, y=total_students_scoring, color=Section)) + geom_line() + geom_point() + 
  scale_color_manual(values = c("Sports" = "purple","Regular"="orange")) + 
  ggtitle("Student Performance") + xlab("Total Score") + ylab("Student Count") + lims(x = c(200, 400), y = c(0, 300))
# Invert the axes
inverted_scores_accum_lines = ggplot(scores_df, aes(x=total_students_scoring, y=Score, color=Section)) + geom_line() + geom_point() +
  scale_color_manual(values = c("Sports" = "purple","Regular"="orange")) + 
  ggtitle("Student Performance") + xlab("Student Count") + ylab("Total Score") + lims(x = c(0, 300), y = c(200, 400))

# Make histograms for distribution analysis

sports_student_table = student_table[student_table$Section == "Sports", ]
regular_student_table = student_table[student_table$Section == "Regular", ]

## a. Comparing and contrasting the point distributions between the two section,
## looking at both tendency and consistency: Can you say that one section tended
## to score more points than the other? Justify and explain your answer.
##
## The regular section tended to score more points than the sports section.
##
## Use scores_accum_lines or inverted_scores_accum_lines plots too see the
## distributions.

# make histograms

sports_histogram <- ggplot(sports_student_table, aes(Score)) + geom_histogram(binwidth = 20)
regular_histogram <- ggplot(regular_student_table, aes(Score)) + geom_histogram(binwidth =20)

# calculate mean and verify against new student tables.

sports_mean <- sum(sports_df$Score*sports_df$Count)/sum(sports_df$Count)
regular_mean <- sum(regular_df$Score*regular_df$Count)/sum(regular_df$Count)

# > sports_mean
# [1] 306.9231
# > regular_mean
# [1] 335

# Let's check if the two are the same. They should be.
sports_mean_verify <- mean(sports_student_table$Score)
# [1] 306.9231 (GOOD)
regular_mean_verify <- mean(regular_student_table$Score)
# [1] 335 (GOOD)

# Own Mode method to calculate mode
Mode <- function(x, na.rm = FALSE) {
  # it takes two areguments x, and na.rm
  if(na.rm){ #if na.rm is false it means no need to remove NA values
    x = x[!is.na(x)]
  }
  
  valx <- unique(x)
  return(valx[which.max(tabulate(match(x, valx)))])
}

sports_mode <- Mode(sports_student_table$Score, TRUE)
regular_mode <- Mode(regular_student_table$Score, TRUE)

sports_median <- median(sports_student_table$Score)
regular_median <- median(regular_student_table$Score)

# Calculate standard deviations of scores
sports_student_table_sd <- sd(sports_student_table$Score)
regular_student_table_sd <- sd(regular_student_table$Score)

sports_stats = stat.desc(sports_student_table$Score, basic = TRUE, desc = TRUE, norm = TRUE)

# nbr.val      nbr.null        nbr.na           min           max         range           sum 
# 2.600000e+02  0.000000e+00  0.000000e+00  2.000000e+02  3.950000e+02  1.950000e+02  7.980000e+04 
# median          mean       SE.mean  CI.mean.0.95           var       std.dev      coef.var 
# 3.125000e+02  3.069231e+02  3.264270e+00  6.427888e+00  2.770419e+03  5.263477e+01  1.714917e-01 
# skewness      skew.2SE      kurtosis      kurt.2SE    normtest.W    normtest.p 
# -4.297700e-01 -1.422662e+00 -7.197970e-01 -1.195818e+00  9.454843e-01  2.953675e-08 

regular_stats = stat.desc(regular_student_table$Score, basic = TRUE, desc = TRUE, norm = TRUE)

# nbr.val      nbr.null        nbr.na           min           max         range           sum 
# 2.900000e+02  0.000000e+00  0.000000e+00  2.650000e+02  3.800000e+02  1.150000e+02  9.715000e+04 
# median          mean       SE.mean  CI.mean.0.95           var       std.dev      coef.var 
# 3.350000e+02  3.350000e+02  1.796535e+00  3.535952e+00  9.359862e+02  3.059389e+01  9.132505e-02 
# skewness      skew.2SE      kurtosis      kurt.2SE    normtest.W    normtest.p 
# -3.630657e-01 -1.268552e+00 -6.135097e-01 -1.075402e+00  9.536340e-01  5.885064e-08 

# A 3 kurtosis means Normal. Larger than 3 or lower than -3 means more data is
# in the head/tail than a normal distribution.A normal graph has 0 skewness.
# These data, however, both have a negative (left) skewness of -4.3 and -3.6, so
# (again) not normal.
# 
# Convert skew and kurtosis to z-scores, 
# It is possible to determine how common (or uncommon) the level of skew and
# kurtosis in our sample truly are. The value of skew.2SE and kurt.2SE are equal
# to skew and kurtosis divided by 2 standard errors. By normalizing skew and
# kurtosis in this way, if skew.2SE and kurt.2SE are greater than 1, we can
# conclude that there is only a 5% chance (i.e. p < 0.05) of obtaining values of
# skew and kurtosis as or more extreme than this by chance.
# 
# Because these normalized values involve dividing by 2 standard errors, they
# are sensitive to the size of the sample. skew.2SE and kurt.2SE are most
# appropriate for relatively small samples, 30-50. For larger samples, it is
# best to compute values corresponding to 2.58SE (p < 0.01) and 3.29SE (p <
# 0.001).  In very large samples, say 200 observations or more, it is best to
# look at the shape of the distribution visually and consider the actual values
# of skew and kurtosis, not their normalized values.

# for z-scores, use 68, 96, 99.7 rule, that is 68% of data within 1 sd, 96 within 2 sd, and 99.7 within 3.
sports_z_scores <- (sports_student_table$Score-mean(sports_student_table$Score))/sd(sports_student_table$Score)
sports_pos_z_scores <- abs(sports_z_scores)
sports_total_count <- length(sports_pos_z_scores)
sports_within_one_sd <- sum(sports_pos_z_scores<=1)
sports_within_two_sd <- sum(sports_pos_z_scores<=2)
sports_within_three_sd <- sum(sports_pos_z_scores<=3)
sports_within_four_sd <- sum(sports_pos_z_scores<=4)
sports_within_five_sd <- sum(sports_pos_z_scores<=5)
sports_factor_one_sd <- sports_within_one_sd/sports_total_count
sports_factor_two_sd <- sports_within_two_sd/sports_total_count
sports_factor_three_sd <- sports_within_three_sd/sports_total_count
sports_factor_one_sd >= .68
sports_factor_two_sd >= .96
sports_factor_three_sd >= .997


regular_z_scores <- (regular_student_table$Score-mean(regular_student_table$Score))/sd(regular_student_table$Score)
regular_pos_z_scores <- abs(regular_z_scores)
regular_total_count <- length(regular_pos_z_scores)
regular_within_one_sd <- sum(regular_pos_z_scores<=1)
regular_within_two_sd <- sum(regular_pos_z_scores<=2)
regular_within_three_sd <- sum(regular_pos_z_scores<=3)
regular_within_four_sd <- sum(regular_pos_z_scores<=4)
regular_within_five_sd <- sum(regular_pos_z_scores<=5)
regular_factor_one_sd <- regular_within_one_sd/regular_total_count
regular_factor_two_sd <- regular_within_two_sd/regular_total_count
regular_factor_three_sd <- regular_within_three_sd/regular_total_count
regular_factor_one_sd >= .68
regular_factor_two_sd >= .96
regular_factor_three_sd >= .997


# b. Did every student in one section score more points than every student in
# the other section?
#
# >>> No. In general, the regular section scoring (mean of 335) was higher than
# the sports section (mean of 307) scoring.
# >>> However, both the highest and lowest scores were in the sports section
# scoring.
#
# If not, explain what a statistical tendency means in this context.
#
# >>> One of the problems with using mean to ascertain statistical tendency is
# >>> that it is subject to outliers. However, in this data set, not only is the
# >>> regular section student mean of 335 greater than the sports student mean
# >>> of 307, but the regular section student median (335) is larger than the
# >>> sports student mean of 312.5. Also the regular mode of 320 is larger than
# >>> the sports mode of 285. In every instance, then, the regular section
# >>> performs better.
# >>>
# >>> The data is far from normalized in the case of the sports section where
# >>> only 54% of the data is within the first standard deviation. Clearly there
# >>> is another unknown factor that skews the data.
#
# c. What could be one additional variable that was not mentioned in the
# narrative that could be
# influencing the point distributions between the
# two sections?
#   
# >>> There are numerous issues with the data. There is no control group to
# >>> assure us that the different sets of "examples" have the same complexity.
# >>> Sports questions can be incredibly complicated. They can also be hard to
# >>> formulate and interpret. There may be errors on the professor's part too.
# >>> At first glance, it really seems clear that the students in the sports
# >>> section had a more difficult class.
# >>>
# >>> Also, by allowing students to self select the section and announcing the
# >>> type of "examples" beforehand, some students may believe the sports
# >>> section is easier. We do not know how they might have scored in the
# >>> regular group or vice versa. Also, in the text of the problem it does not
# >>> say the quiz or test problems are different in either class, only the
# >>> "examples." It's hard to believe that this alone could be the variable,
# >>> especially because there are thousands of other "examples" of problems of
# >>> any class on the Internet.
# >>> 
# >>> One way to normalize the data would be to include other information about
# >>> the students, their GPA or standardized testing scores, but in a way, this
# >>> just introduces more uncertainty.
# >>>
# >>> The best way to resolve the disparity between course performance is to
# >>> grade the sections as different groups on the whole and score on a curve.
# >>> 