# Read in data
trainData = read.csv("train_reformatted.csv")
trainData2 = trainData

testData = read.csv("test_reformatted.csv")
testData2 = testData 

#Investigate into data
str(trainData2)

#Split into test and train
set.seed(144)
library(caTools)

split = sample.split(trainData$Happy, SplitRatio = 0.7)

train = subset(trainData, split == TRUE)
train2 = train 

test = subset(trainData, split == FALSE)
test2 = test


str(test)
summary(testData)
summary(trainData)
nrow(test)
str(trainData$HouseholdStatus)
summary(trainData$HouseholdStatus)
str(train)
summary(train)
nrow(train)




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
for (i in 3:7 ){

levels(testData[,i]) <- c(levels(testData[,i]), "Skipped")
    testData[,i][testData[,i] == ''] <- 'Skipped'
}
#This converts all Yes/No/Blank factor vars to -1,0,1
for( cn in colnames(testData) ) {
  if ( substr(cn, 1, 1) != "Q" ) next
  lvls <- levels( testData[,cn] )
  if ( length(lvls) != 3 ) next  # Paranoia
  testData[,cn] <- as.integer( factor(testData[,cn], levels=c(lvls[2], lvls[1], lvls[3])) ) - 2
}

#removes redundant factor, which is earlier Blank
testData$Gender <- factor(testData$Gender) 
testData$Income <- factor(testData$Income) 
testData$HouseholdStatus <- factor(testData$HouseholdStatus)
testData$EducationLevel <- factor(testData$EducationLevel)
testData$Party <- factor(testData$Party)
summary(testData)
str(testData)
summary(testData$Party)
lvls <- levels( testData[,'Gender'] )
levels=c(lvls[2], lvls[1], lvls[3])

as.integer( factor(testData[,'Gender'], levels=c(lvls[3], lvls[1], lvls[2])) ) - 1
#Remove the Factor levels

i=0
for( cn in colnames(testData) ) {
  i=i+1
  if ((i < 8) && (i > 2))
  { #Start IF
	switch(cn, 
	Gender={
  	# case 'Gender' here...
	lvls <- levels( testData[,cn] )
	testData[,cn] <- as.integer( factor(testData[,cn], levels=c(lvls[3], lvls[1], lvls[2])) ) - 1
},
Income={
  # case 'Income'here...
  lvls <- levels( testData[,cn] )
	testData[,cn] <- as.integer( factor(testData[,cn], levels=c(lvls[7],lvls[1], lvls[2], lvls[3], lvls[4], lvls[5], lvls[6])) ) - 1
    
},
HouseholdStatus={
  # case 'HouseholdStatus'here...
  lvls <- levels( testData[,cn] )
	testData[,cn] <- as.integer( factor(testData[,cn], levels=c(lvls[7],lvls[1], lvls[2], lvls[3], lvls[4], lvls[5], lvls[6])) ) - 1
    
},
EducationLevel={
  # case 'EducationLevel'here...
  lvls <- levels( testData[,cn] )
	testData[,cn] <- as.integer( factor(testData[,cn], levels=c(lvls[8],lvls[1], lvls[2], lvls[3], lvls[4], lvls[5], lvls[6], lvls[7])) ) - 1
    
},
Party={
  # case 'Party'here...
  lvls <- levels( testData[,cn] )
	testData[,cn] <- as.integer( factor(testData[,cn], levels=c(lvls[6],lvls[1], lvls[2], lvls[3], lvls[4], lvls[5])) ) - 1
    
}
)


  } #end the IF
}


#Examine the data
str(trainData)
summary(testData)
nrow(testData)
summary(testData$Income)
table(trainData$Income)
table(trainData$Gender)
summary(testData$Party)
table(testData$Party)

str(test)
str(train2)
train$Gender
summary(train$Gender)

#Restores orignal data
testData$Gender = testData2$Gender 
testData$Income = testData2$Income 
testData$HouseholdStatus = testData2$HouseholdStatus
testData$EducationLevel = testData2$EducationLevel
testData$Party = testData2$Party

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
#for (i in names(trainData)) {
for (i in 3:7 )
{
   	
     levels(trainData[,i]) <- c(levels(trainData[,i]), "Skipped")
     trainData[,i][trainData[,i] == ''] <- 'Skipped'
   
}

str(trainData)


str(trainData)


#This converts all Yes/No/Blank factor vars to -1,0,1
for( cn in colnames(trainData) ) {
  if ( substr(cn, 1, 1) != "Q" ) next
  lvls <- levels( trainData[,cn] )
  if ( length(lvls) != 3 ) next  # Paranoia
  trainData[,cn] <- as.integer( factor(trainData[,cn], levels=c(lvls[2], lvls[1], lvls[3])) ) - 2
}


#removes redundant factor, which is earlier Blank
trainData$Gender <- factor(trainData$Gender) 
trainData$Income <- factor(trainData$Income) 
trainData$HouseholdStatus <- factor(trainData$HouseholdStatus)
trainData$EducationLevel <- factor(trainData$EducationLevel)
trainData$Party <- factor(trainData$Party)

summary(trainData)

#Remove the Factor levels

i=0
for( cn in colnames(trainData) ) {
  i=i+1
  if ((i < 8) && (i > 2))
  { #Start IF
	switch(cn, 
	Gender={
  	# case 'Gender' here...
	lvls <- levels( trainData[,cn] )
	trainData[,cn] <- as.integer( factor(trainData[,cn], levels=c(lvls[3], lvls[1], lvls[2])) ) - 1
},
Income={
  # case 'Income'here...
  lvls <- levels( trainData[,cn] )
	trainData[,cn] <- as.integer( factor(trainData[,cn], levels=c(lvls[7],lvls[1], lvls[2], lvls[3], lvls[4], lvls[5], lvls[6])) ) - 1
    
},
HouseholdStatus={
  # case 'HouseholdStatus'here...
  lvls <- levels( trainData[,cn] )
	trainData[,cn] <- as.integer( factor(trainData[,cn], levels=c(lvls[7],lvls[1], lvls[2], lvls[3], lvls[4], lvls[5], lvls[6])) ) - 1
    
},
EducationLevel={
  # case 'EducationLevel'here...
  lvls <- levels( trainData[,cn] )
	trainData[,cn] <- as.integer( factor(trainData[,cn], levels=c(lvls[8],lvls[1], lvls[2], lvls[3], lvls[4], lvls[5], lvls[6], lvls[7])) ) - 1
    
},
Party={
  # case 'Party'here...
  lvls <- levels( trainData[,cn] )
	trainData[,cn] <- as.integer( factor(trainData[,cn], levels=c(lvls[6],lvls[1], lvls[2], lvls[3], lvls[4], lvls[5])) ) - 1
    
}
)


  } #end the IF
}
#Examine the data
nrow(trainData)
str(trainData)
summary(trainData)
summary(trainData$Income)



