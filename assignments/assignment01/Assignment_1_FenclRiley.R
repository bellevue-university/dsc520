# Assignment: Assignment 1
# Name: Riley, Fencl
# Date: 4 Decemeber, 2020

# Task 1
num_vector <- c(3,2,1)
num_vector

# Task 2
char_vector <- c("three", "two", "one")
char_vector

# Task 3
# index 1 = Sunday
week1_sleep <- c(6.1, 8.8, 7.7, 6.4, 6.2, 6.9, 6.6)

# Task 4
week1_sleep[3]

# Task 5
week1_sleep_weekdays <- week1_sleep[2:6]

# Task 6 
total_sleep_week1 <- sum(week1_sleep)

# Task 7
week2_sleep <- c(7.1, 7.4, 7.9, 6.5, 8.1, 8.2, 8.9)

# Task 8
total_sleep_week2 <- sum(week2_sleep)

# Task 9
total_sleep_week1 < total_sleep_week2

# Task 10 
mean(week1_sleep)

# Task 11 
days <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")

# Task 12
names(week1_sleep) <- days
names(week2_sleep) <- days

# Task 13
week1_sleep["Tuesday"]

# Task 14
weekdays <- days[2:6]

# Task 15
weekends <- days[c(1,7)]

# Task 16
weekdays1_mean <- mean(week1_sleep[weekdays])
weekdays2_mean <- mean(week2_sleep[weekdays])

# Task 17
weekdays1_mean > weekdays2_mean

# Task 18
week1_sleep > 8

# Task 19 
student01 <- c(100.0, 87.1)
student02 <- c(77.2, 88.9)
student03 <- c(66.3, 87.9)

students_combinded <- c(student01, student02, student03)
grades <- matrix(students_combinded, byrow = TRUE, nrow = 3)

# Task 20 
student04 <- c(95.2, 94.1)
grades <- rbind(grades, student04)

# Task 21
assignment04 <- c(92.1, 84.3, 75.1, 97.8)
grades <- cbind(grades, assignment04)

# Task 22
assignments <- c("Assignment 1", "Assignment 2", "Assignment 3")
students <- c("Florinda Baird", "Jinny FOss", "Lou Purvis", "Nola Maloney")

rownames(grades) <- students
colnames(grades) <- assignments 

# Task 23
colSums(grades)

# Task 24
rowSums(grades)

# Task 25
weighted_grades <- grades * 0.1 + grades

# Task 26
genres_vector <- c("Fantasy", "Sci-Fi", "Sci-Fi", "Mystery", "Sci-Fi", "Fantasy")
factor_genre_vector <- factor(genres_vector)

# Task 27
summary(factor_genre_vector)

# Task 28 
recommendations_vector <- c("neutral", "no", "no", "neutral", "yes")
factor_recommendations_vector <- factor(
  recommendations_vector,
  ordered = TRUE,
  levels = c("no", "neutral", "yes")
)

# Task 29
summary(factor_recommendations_vector)

# Task 30
head(mtcars)

# Task 31
tail(mtcars)

# Task 32
name <- c("Aragon", "Bilbo", "Frodo", "Galadriel", "Sam", "Gandalf", "Legolas", "Sauron", "Gollum")
race <- c("Men", "Hobbit", "Hobbit", "Elf", "Hobbit", "Maia", "Elf", "Maia", "Hobbit")
in_fellowship <- c(TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, FALSE, FALSE)
ring_bearer <- c(FALSE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE)
age <- c(88, 129, 51, 7000, 36, 2019, 2931, 7052, 589)

characters_df <- data.frame(name, race, in_fellowship, ring_bearer, age)

# Task 33
sorted_characters_df <- characters_df[order(age),]
head(sorted_characters_df)

# Task 34
ringbearers_df <- characters_df[characters_df$ring_bearer == TRUE,]
head(ringbearers_df)
