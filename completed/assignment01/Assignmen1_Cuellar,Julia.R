# Assignment: ASSIGNMENT 1
# Name: Cuellar, Julia
# Date: 9/6/2020

# Task 1
c(3,2,1)
assign("num_vector",c(3,2,1))
num_vector

# Task 2
c("three","two","one") 
assign("char_vector",c("three","two","one"))
char_vector

# Task 3
week1_sleep = c(6.1,8.8,7.7,6.4,6.2,6.9,6.6)
week1_sleep

# Task 4
week1_sleep[3]

# Task 5
week1_sleep_weekdays = week1_sleep[2:6]
week1_sleep_weekdays

# Task 6
sum(week1_sleep)
assign("total_sleep_week1",sum(week1_sleep))
total_sleep_week1

# Task 7
week2_sleep = c(7.1,7.4,7.9,6.5,8.1,8.2,8.9)
week2_sleep

# Task 8
sum(week2_sleep)
assign("total_sleep_week2",sum(week2_sleep))
total_sleep_week2

# Task 9
total_sleep_week1 < total_sleep_week2

# Task 10
mean(week1_sleep)

# Task 11
days = c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
days

# Task 12
names(week1_sleep) = c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
week1_sleep
names(week2_sleep) = c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
week2_sleep

# Task 13
week1_sleep["Tuesday"]

# Task 14
days = c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
days 
weekdays = c(days[2:6])
weekdays

# Task 15
weekends = c("Sunday","Saturday")
weekends

# Task 16
mean(week1_sleep[weekdays])
mean(week2_sleep[weekdays])
assign("weekdays1_mean",mean(week1_sleep[weekdays]))
weekdays1_mean
assign("weekdays2_mean",mean(week2_sleep[weekdays]))
weekdays2_mean

# Task 17
weekdays1_mean > weekdays2_mean

# Task 18
week1_sleep > 8

# Task 19
student01 = c(100.0,87.1)
student01
student02 = c(77.2,88.9)
student02
student03 = c(66.3,87.9)
student03
assign("students_combined",c(student01,student02,student03))
students_combined
grades = matrix(students_combined, byrow = TRUE, nrow = 3)
grades

# Task 20
student04 = c(95.2,94.1)
student04
grades = rbind(student01,student02,student03,student04)
grades

# Task 21
assignment04 = c(92.1,84.3,75.1,97.8)
assignment04
grades = cbind(grades, assignment04)
grades

# Task 22
assignments = c("Assignment 1","Assignment 2", "Assignment 3")
assignments
students = c("Florinda Baird","Jinny Foss","Lou Purvis","Nola Maloney")
students
rownames(grades) = c(students)
colnames(grades) = c(assignments)
grades

# Task 23
colSums(grades)

# Task 24
rowSums(grades)

# Task 25
weighted_grades = grades*.1+grades
weighted_grades

# Task 26
genres_vector = c("Fantasy","Sci-Fi","Sci-Fi","Mystery","Sci-Fi","Fantasy")
genres_vector
assign("factor_genre_vector",c("Fantasy","Sci-Fi","Sci-Fi","Mystery","Sci-Fi","Fantasy"))
factor_genre_vector

# Task 27
summary(factor_genre_vector) 

# Task 28
recommendations_vector = c("neutral","no","no","neutral","yes")
recommendations_vector   
factor_recommendations_vector = factor(recommendations_vector, ordered = 3, levels = c("no","neutral","yes"))
factor_recommendations_vector

# Task 29
summary(factor_recommendations_vector)

# Task 30
head(mtcars)

# Task 31
tail(mtcars)

# Task 32
name = c("Aragon","Bilbo","Frodo","Galadriel","Sam","Gandalf","Legolas","Sauron","Gollum")
name  
race = c("Men","Hobbit","Hobbit","Elf","Hobbit","Maia","Elf","Maia","Hobbit")
race
in_fellowship = c(TRUE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,FALSE,FALSE)
in_fellowship
ring_bearer = c(FALSE,TRUE,TRUE,FALSE,TRUE,TRUE,FALSE,TRUE,TRUE)
ring_bearer
age = c(88,129,51,7000,36,2019,2931,7052,589)
age
characters_df = data.frame(name,race,in_fellowship,ring_bearer,age)
characters_df

# Task 33
sorted_characters_df = characters_df[order(age),]
sorted_characters_df

# Task 34
head(sorted_characters_df)

# Task 35
ringbearers_df = characters_df[characters_df$ring_bearer=="TRUE",]
ringbearers_df

# Task 36
head(ringbearers_df)

