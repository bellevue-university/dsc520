# Assignment: FINAL PROJECT 
# Name: Sutow, Brett
# Date: 2020-11-21
library(tidyverse)
library(ggplot2)
install.packages("devtools")
library(devtools)
install.packages("tm")
library(tm)
library(dplyr)

## Setup 
setwd("/Users/Brett/Desktop/dsc520-master")
olympics_df<-read.csv("/Users/Brett/Desktop/dsc520-master/summer.csv")

Year<- olympics_df[,c(1)]
City<- olympics_df[,c(2)]
Sport<- olympics_df[,c(3)]
Discipline<- olympics_df[,c(4)]
Athlete<- olympics_df[,c(5)]
Country<- olympics_df[,c(6)]
Gender<- olympics_df[,c(7)]
Event<- olympics_df[,c(8)]
Medal<- olympics_df[,c(9)]

summary(olympics_df)

head(olympics_df)

nrow(olympics_df)

## How the Olympics have changed over the years. Shows the changes in sports and athlete winners over time
Ycounts <- olympics_df %>% group_by(Year) %>%
  summarize( Athletes = length(unique(Athlete)), Disciplines = length(unique(Discipline)),
  )
Ycounts

Number_of_Athletes <- ggplot(Ycounts, aes(x= Year, y= Athletes)) + geom_line(color= "blue") +
  labs(title= "Number of Athlete Changes")

Number_of_Athletes 

Number_of_SportDisciplines <- ggplot(Ycounts, aes(x= Year, y= Disciplines)) + geom_line(color= "red") +
  labs(title= "Number of Sport Discipline Changes")

Number_of_SportDisciplines

GenderChanges<- olympics_df %>% group_by(Year, Gender) %>%
  summarize(AthleteGenderGrowth = length(unique(Athlete)))

GenderChanges

GenderChangesGraph <- ggplot(GenderChanges, aes(x= Year, y= AthleteGenderGrowth, color= Gender)) +
  geom_line()+ labs(title = "Gender Changes Over Time")

GenderChangesGraph

GenderChangesTable<- table(Year, Gender)

GenderChangesTable

## Shows the countries that have had the most winners: Gold, Silver, and Bronze totaled 
CountryWincounts <- olympics_df %>% group_by(Country) %>%
  summarize( Athletes = length(unique(Athlete)))

CountryWincounts

Winners_By_Country <- ggplot(CountryWincounts, aes(x= Country, y= Athletes)) + geom_bar(stat='identity') +
  theme(text = element_text(size=3), axis.text.x = element_text(angle=90, hjust=1))+labs(title= "Number of Winners By Country")

Winners_By_Country

Top_Winners <- top_n(CountryWincounts, n=10, Athletes) %>% 
  ggplot(aes(x= Country, y= Athletes))+ geom_bar(stat= "identity", fill = rainbow(n=10)) +
  labs(title = "Top 10 Winning Countries By Athletes")

Top_Winners

MedalCount_Table <- table(Country, Medal)
MedalCount_Table

AMTable<- table(Athlete, Medal)
AMTable


## Country win specific sports

WinnersSport <- olympics_df %>% group_by(Country, Sport) %>%
  summarize( Athletes = length(unique(Athlete)))

WinnersSport

WinnersSportGraph <- top_n(ungroup(WinnersSport), n=10, Athletes) %>%
  ggplot(aes(x= Country, y= Athletes, fill= Sport ))+ geom_bar(stat= "identity") +
  labs(title = "Top Winning Countries by Sports")+
  theme(text = element_text(size=10), axis.text.x = element_text(angle=90, hjust=1))

WinnersSportGraph

CountryWinnersSport <- table(Country, Sport)
CountryWinnersSport

## Athlete winners 

OlympicWinnersAthletes <- olympics_df %>% group_by(Athlete, Country) %>%
  summarize( SportWins = length(unique(Event)))

OlympicWinnersAthletes

OlympicWinnersAthletesGraph <- top_n(ungroup(OlympicWinnersAthletes), n=5, SportWins) %>%
  ggplot(aes(x= Athlete, y= SportWins))+ geom_bar(stat= "identity")+ theme(text = element_text(size=7),axis.text.x = element_text(angle=90, hjust=1))+
  labs(title = "Top Olympic Winners")

OlympicWinnersAthletesGraph


RepeatWins <- olympics_df %>% group_by(Athlete) %>%
  summarize( RepeatWins = length(unique(Medal)))

RepeatWins








