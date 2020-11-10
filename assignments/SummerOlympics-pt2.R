setwd("/Users/Brett/Desktop/dsc520-master")
summerolympics_df<-read.csv("/Users/Brett/Desktop/dsc520-master/summer.csv")

Year<- summerolympics_df[,c(1)]
City<- summerolympics_df[,c(2)]
Sport<- summerolympics_df[,c(3)]
Discipline<- summerolympics_df[,c(4)]
Athlete<- summerolympics_df[,c(5)]
Country<- summerolympics_df[,c(6)]
Gender<- summerolympics_df[,c(7)]
Event<- summerolympics_df[,c(8)]
Medal<- summerolympics_df[,c(9)]

head(summerolympics_df)






