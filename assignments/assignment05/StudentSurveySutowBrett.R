# Assignment: Student Surveys
# Name: Sutow, Brett
# Date: 2020-09-29

#Setup
setwd("/Users/Brett/Desktop/dsc520-master")
studentsurvey <- read.csv("/Users/Brett/Desktop/dsc520-master/data/student-survey.csv")
head(studentsurvey)
timereading<-studentsurvey[,c(1)]
timetv<-studentsurvey[,c(2)]
happiness<-studentsurvey[,c(3)]
gender<-studentsurvey[,c(4)]

#Covariance of Time Reading and Time TV
cov(timereading,timetv)

#Correlation Test
cor(studentsurvey, use= "everything", method= "pearson")

cor.test(timereading, timetv, use= "everything", method= "pearson", level= 0.95)
cor.test(timereading, timetv, use= "everything", method= "pearson", conf.level= 0.99)

#Coefficient of Determination
timereading.lm = lm(timereading ~ timetv, data= studentsurvey)
summary(timereading.lm)$r.squared
timetv.lm = lm(timetv ~ timereading, data = studentsurvey)
summary(timetv.lm)$r.squared

#Partial Correlation
pcor.test(timereading, timetv, happiness)

