# Author: Hannah Shapiro
# Purpose: Assignment 3
# Date: 2/13/21

# Loading in the tidyverse package
library(tidyverse)

# The test did work, and the notebook loaded what it should.

# Importing in the data set
nhanes_small_assignment3 <- read.csv("~/Desktop/nhanes_small_assignment3.csv")
View(nhanes_small_assignment3)
na.omit(nhanes_small_assignment3)
# Using 3 tidyverse functions
cleanedData<-nhanes_small_assignment3 %>% 
 group_by(Gender,Smoke100n) %>% 
  mutate(AveragePov = mean(Poverty, na.rm=TRUE), SD = sd(Poverty, na.rm=TRUE)) %>% 
  arrange(Gender) %>% 
  na.omit(.)
  
#############
# Results
cleanedDataPlot <- cleanedData[,c(3,6,7,8,9)]


ggplot(data = cleanedDataPlot, aes(x = Gender, y = AveragePov, fill = Smoke100n)) +
  geom_col(position = position_dodge(width=0.9)) +
  geom_errorbar(aes(ymin = AveragePov-SD, ymax = AveragePov+SD),
               position = position_dodge(width = 0.9),
               width=.2)

#############
# Wrangling part 2
# The data is currently in long format.

nhanes<-pivot_wider(nhanes_small_assignment3, names_from = TimePoint, values_from = c(Poverty, Smoke100n))
nhanes[1:15, 1:7]

# I made it so that each ID row would show the poverty level (depicted in the
# output above) as well as the smoker status(not shown in this output) from
# each time rather than show it in multiple rows, making the data wider.
