#Description of data set
hw1data <- read.csv("~/Desktop/nhanes_small.csv")
View(hw1data)
#Survey includes the ID number, year of survey, gender of the participant, 
#their age, their weight(kg),their poverty level, and whether they smoke or not.

#Class of each object
#ID
class(hw1data$ID)
#Returns integer, which is to be expected.

#Survey Year
class(hw1data$SurveyYr)
#Returns character, which isn't surprising given how the data is formatted, but
#someone could expect this one to return integer, which is would if not for the 
#dashes.

#Gender
class(hw1data$Gender)
#Returns character, which is the default for strings, but this one should be 
#changed to be a factor.

#Age
class(hw1data$Age)
#Returns integer, which is to be expected.

#Weight
class(hw1data$Weight)
#Returns numeric, which is to be expected.

#Poverty level
class(hw1data$Poverty)
#Returns numeric, which is to be expected.

#Smoking status
class(hw1data$Smoke100n)
#Returns character, but data could be formatted to make this be a boolean
#which is more fitting for this category.

#Entire data set
class(hw1data)
#Returns data frame, which is to be expected.

#Change character variables to factors
hw1data$Gender<-factor(hw1data$Gender)


#Summary statistics
#Age
meanAge<-mean(hw1data$Age)
meanAge
SdAge<-sd(hw1data$Age)
SdAge
rangeAge<-range(hw1data$Age)
rangeAge

#Weight
meanWeight<-mean(hw1data$Weight)
meanWeight
SdWeight<-sd(hw1data$Weight)
SdWeight
rangeWeight<-range(hw1data$Weight)
rangeWeight

#Counts of gender
table(hw1data$Gender)
#Separating by category
  hw1data_female<-hw1data[hw1data$Gender=="female",]
  hw1data_female$Gender<-factor(hw1data_female$Gender)
  
  hw1data_male<-hw1data[hw1data$Gender=="male",]
  hw1data_male$Gender<-factor(hw1data_male$Gender)
  
#Separated summary statistics
  fMeanAge<-mean(hw1data_female$Age)
  fMeanAge
  fSdAge<-sd(hw1data_female$Age)
  fSdAge
  fRangeAge<-range(hw1data_female$Age)
  fRangeAge
  
  mMeanAge<-mean(hw1data_male$Age)
  mMeanAge
  mSdAge<-sd(hw1data_male$Age)
  mSdAge
  mRangeAge<-range(hw1data_male$Age)
  mRangeAge
  #The values are pretty similar for both males and females, which means that
  #statistical analysis results can are probably not skewed by age.
  
  fMeanWeight<-mean(hw1data_female$Weight)
  fMeanWeight
  fSdWeight<-sd(hw1data_female$Weight)
  fSdWeight
  fRangeWeight<-range(hw1data_female$Weight)
  fRangeWeight
  
  mMeanWeight<-mean(hw1data_male$Weight)
  mMeanWeight
  mSdWeight<-sd(hw1data_male$Weight)
  mSdWeight
  mRangeWeight<-range(hw1data_male$Weight)
  mRangeWeight
  #The weight values are also pretty similar across genders, which means that
  #statistical analysis results probably aren't skewed by weight either.
  
  
