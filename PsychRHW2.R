#Psych R Assignment 2

#Loading in packages
library(knitr)
library(tidyverse)
library(psych)
library(ggpubr)
library(RColorBrewer)
library(broom)
#These are the packages I installed earlier, so 6 in total.

nhanes_small <- read.csv("~/Desktop/School/SPRING 2021/Psych Stats/nhanes_small.csv")
View(nhanes_small)

#Convert to factors, ID number to string
nhanes_small$Gender<-factor(nhanes_small$Gender)
nhanes_small$Smoke100n<-factor(nhanes_small$Smoke100n)
nhanes_small$ID<-toString(nhanes_small$ID)

#Summary statistics using describe
describe(nhanes_small,na.rm=FALSE, omit = TRUE, IQR=TRUE)
describeBy(nhanes_small,nhanes_small$Gender, na.rm=FALSE, omit = TRUE, IQR=TRUE)
#There are now 2 tables, one for each level of my gender categorical variable.

summary(nhanes_small)
#I think either way is nice when the data isn't being sorted into categories of
#an independent variable, but the describe command is definitely more 
#convenient to use when looking for something like a main effect as it directly
#separates your summary statistics for you.


#Results
#I'm going to use age and weight mostly because I know those have to vary
#slightly with each other given the ranges of the variables.

cov(nhanes_small$Age, nhanes_small$Weight)

ageScores<-data.frame(scale(nhanes_small$Age))
ageZScore<-scale(nhanes_small$Age)
weightScores<-data.frame(scale(nhanes_small$Weight))
weightZScore<-scale(nhanes_small$Weight)
zScores<-data.frame(ageScores,
                    weightScores)
zScores

#Covariance of z-scores
cov(zScores)

#Correlation of orignial variables
cor(nhanes_small$Age,nhanes_small$Weight)
#The covariance of the z-scores is equal to the correlation of the original data
#points, which makes sense because the formula to find correlation is just the
#covariance formula for the z-scores. 

#Results: Plotting of data
#Plot of raw data
ggplot(nhanes_small,aes(x=Age, y=Weight))+geom_point(color="red")
#Plot of z-scores
ggplot(zScores, aes(x=ageZScore, y=weightZScore))+geom_point(color="green")

#The point placement on the plots are the same, but the scale of the axes change
#when plotting a z-score plot instead of the raw data values.

#Plot separated by gender
ggplot(nhanes_small,aes(x=Age, y=Weight, shape=gender, color=gender))+geom_point()+
geom_smooth(method="lm", aes(color=gender))
#geom_smooth adds regression lines
#There is a steeper upward trend in males' weights than in females' weights as
#they increase in age.

#Influence of Outliers
#Creation of data frame without outliers

nonOutlier<-nhanes_small[abs(scale(nhanes_small$Age))<2 &
                         abs(scale(nhanes_small$Weight))<2, 3:7]
#I removed ID and year of survey for checking of the data frame, but because it
#isn't necessary for those variables in the plot, I am not adding them back into
#this smaller data frame.

#Plot without outliers
ggplot(nonOutlier,aes(x=Age, y=Weight, shape=Gender, color=Gender))+geom_point()+
  geom_smooth(method="lm", aes(color=Gender))
#Removal of the outliers changes the male regression line more than the female
#one, making the trends more equal in slope, with a slightly higher intercept 
#for males, placing it above females on the plot.


