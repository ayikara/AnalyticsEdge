# Read in data

#The train.csv data contains  predictors and outcome
trainData = read.csv("train.csv") 
trainData2 = trainData 
#The train.csv contains only outcome
testData = read.csv("test.csv")
testData2 = testData 

#Split into test and train
set.seed(144)
library(caTools)

split = sample.split(trainData$Happy, SplitRatio = 0.7)

train = subset(trainData, split == TRUE)
train2 = train 

test = subset(trainData, split == FALSE)
test2 = test

#Examine data
str(test)
summary(test)
nrow(test)

str(train)
summary(train)
nrow(train)

#Train Data pre-processing

#Preporocess the data for missing vlaues
#Replace all NA in YOB to median value
train$YOB[is.na(train$YOB)]=median(train$YOB,na.rm=TRUE) 

#i=3  #Gender
#i=4  #Income
#i=5	#HouseholdStatus
#i=6	#EducationLevel
#i=7	#Party
#Substitute blank with Skipped
#Iterate through the 3 to 7
for (i in names(train)) {
    if ((i < 8) && (i > 2))
    {
    levels(train[,i]) <- c(levels(train[,i]), "Skipped")
    train[,i][train[,i] == ''] <- 'Skipped'
    }
}

#iterate thro 9 to end for the common vars
for (i in names(train)) {
    if (i > 8)
    {
    levels(train[,i]) <- c(levels(train[,i]), "Skipped")
    train[,i][train[,i] == ''] <- 'Skipped'
    }
}

#removes redundant factor, which is earlier Blank
train$Gender <- factor(train$Gender) 
train$Income <- factor(train$Income) 
train$HouseholdStatus <- factor(train$HouseholdStatus)
train$EducationLevel <- factor(train$EducationLevel)
train$Party <- factor(train$Party)

#removes redundant factor
for (i in names(train)){
      if (i > 8)
    	{
		train[,i] <- factor(train[,i])
	}
}

#Convert back to Integer/Take it from original 
train$Happy= as.integer(train2$Happy)
train$UserID= as.integer(train2$UserID)
train$YOB= as.integer(train2$YOB)
str(train)



#Examine the data
summary(train$Income)
str(test)
str(train2)
train$Gender
summary(train$Gender)



#=======================================================
#Test Data pre-processing

#Preporocess the data for missing vlaues
#Replace all NA in YOB to median value
test$YOB[is.na(test$YOB)]=median(test$YOB,na.rm=TRUE) 

#i=3  #Gender
#i=4  #Income
#i=5	#HouseholdStatus
#i=6	#EducationLevel
#i=7	#Party
#Substitute blank with Skipped
#Iterate through the 3 to 7
for (i in names(test)) {
    if ((i < 8) && (i > 2))
    {
    levels(test[,i]) <- c(levels(test[,i]), "Skipped")
    test[,i][test[,i] == ''] <- 'Skipped'
    }
}

#iterate thro 9 to end for the common vars
for (i in names(test)) {
    if (i > 8)
    {
    levels(test[,i]) <- c(levels(test[,i]), "Skipped")
    test[,i][test[,i] == ''] <- 'Skipped'
    }
}

#removes redundant factor, which is earlier Blank
test$Gender <- factor(test$Gender) 
test$Income <- factor(test$Income) 
test$HouseholdStatus <- factor(test$HouseholdStatus)
test$EducationLevel <- factor(test$EducationLevel)
test$Party <- factor(test$Party)

#remvoes redundant factor
for (i in names(test)){
      if (i > 8)
    	{
		test[,i] <- factor(test[,i])
	}
}

#Convert back to Integer/Take it from original 
test$Happy= as.integer(test2$Happy)
test$UserID= as.integer(test2$UserID)
test$YOB= as.integer(test2$YOB)
str(test)


#Examine the data
summary(test$Income)
str(test)
str(test2)
test$Gender
summary(test$Gender)
========================================================================

#Original Test Data pre-processing

#Preporocess the data for missing vlaues
#Replace all NA in YOB to median value
testData$YOB[is.na(testData$YOB)]=median(testData$YOB,na.rm=TRUE) 

#i=3  #Gender
#i=4  #Income
#i=5	#HouseholdStatus
#i=6	#EducationLevel
#i=7	#Party
#Substitute blank with Skipped
#Iterate through the 3 to 7
for (i in names(testData)) {
    if ((i < 8) && (i > 2))
    {
    levels(testData[,i]) <- c(levels(testData[,i]), "Skipped")
    testData[,i][testData[,i] == ''] <- 'Skipped'
    }
}

#iterate thro 9 to end for the common vars
for (i in names(testData)) {
    if (i > 7)
    {
    levels(testData[,i]) <- c(levels(testData[,i]), "Skipped")
    testData[,i][testData[,i] == ''] <- 'Skipped'
    }
}

#removes redundant factor, which is earlier Blank
testData$Gender <- factor(testData$Gender) 
testData$Income <- factor(testData$Income) 
testData$HouseholdStatus <- factor(testData$HouseholdStatus)
testData$EducationLevel <- factor(testData$EducationLevel)
testData$Party <- factor(testData$Party)

#remvoes redundant factor
for (i in names(testData)){
      if (i > 7)
    	{
		testData[,i] <- factor(testData[,i])
	}
}

#Convert back to Integer/Take it from original 
#testData$Happy= as.integer(testData2$Happy)
testData$UserID= as.integer(testData2$UserID)
testData$YOB= as.integer(testData2$YOB)
str(testData)
nrow(testData)



#Examine the data
summary(train$Income)
str(test)
str(train2)
train$Gender
summary(train$Gender)
===========================================================================

#Original Train Data pre-processing

#Preporocess the data for missing vlaues
#Replace all NA in YOB to median value
trainData$YOB[is.na(trainData$YOB)]=median(trainData$YOB,na.rm=TRUE) 

#i=3  #Gender
#i=4  #Income
#i=5	#HouseholdStatus
#i=6	#EducationLevel
#i=7	#Party
#Substitute blank with Skipped
#Iterate through the 3 to 7
for (i in names(trainData)) {
    if ((i < 8) && (i > 2))
    {
    levels(trainData[,i]) <- c(levels(trainData[,i]), "Skipped")
    trainData[,i][trainData[,i] == ''] <- 'Skipped'
    }
}

#iterate thro 9 to end for the common vars
for (i in names(trainData)) {
    if (i > 8)
    {
    levels(trainData[,i]) <- c(levels(trainData[,i]), "Skipped")
    trainData[,i][trainData[,i] == ''] <- 'Skipped'
    }
}

#removes redundant factor, which is earlier Blank
trainData$Gender <- factor(trainData$Gender) 
trainData$Income <- factor(trainData$Income) 
trainData$HouseholdStatus <- factor(trainData$HouseholdStatus)
trainData$EducationLevel <- factor(trainData$EducationLevel)
trainData$Party <- factor(trainData$Party)

#remvoes redundant factor
for (i in names(trainData)){
      if (i > 8)
    	{
		trainData[,i] <- factor(trainData[,i])
	}
}

#Convert back to Integer/Take it from original 
trainData$Happy= as.integer(trainData2$Happy)
trainData$UserID= as.integer(trainData2$UserID)
trainData$YOB= as.integer(trainData2$YOB)
nrow(trainData)
str(trainData)



#Examine the data
summary(trainData$Income)
str(test)
str(train2)
train$Gender
summary(train$Gender)

