#Examine the data
library(ROCR)
str(test)
str(train)


happyTestrb = glm(Happy ~ . - UserID, data=train, family=binomial)
summary(happyTestrb)

happyTestrb1 = glm(Happy ~ . - UserID -votes -Income,
 data=trainData, family=binomial)
summary(happyTestrb2)

happyTestrb2 = glm(Happy ~

#Gender+
HouseholdStatus+
EducationLevel+
Party+
Q122769+
Q121700+
Q121011+
#Q120194+
Q120012+
Q120014+
Q119334+
Q119650+
Q118237+
Q117186+
Q116797+
Q116881+
Q116953+
Q116441+
Q116197+
Q115777+
Q115610+
Q115899+
Q115390+
Q114961+
Q114386+
Q113583+
Q111848+
Q109367+
Q108855+
Q108617+
Q108754+
Q108342+
Q108343+
Q107869+
#Q106388+
Q106389+
Q102906+
Q102674+
Q102687+
Q102289+
Q102089+
Q101162+
Q100680+
Q100562+
Q99716+
Q99581+
Q98869,
data=trainData, family=binomial)

#Cross Validation
library(caret)
library(e1071)

# Number of folds
tr.control = trainControl(method = "cv", number = 10)
tr.control <- trainControl("cv",10,savePred=T)
# cp values
#cp.grid = expand.grid( .cp = (0:10)*0.001)

tr = train(
Happy ~
#Income+ 
HouseholdStatus+
EducationLevel+
Party+
#votes+
Q121700+
Q121011+
Q120194+
Q120012+
Q120014+
Q119334+
#Q118892+
Q118237+
Q116797+
Q116441+
Q116197+
Q115610+
#Q115899+
Q115390+
Q114961+
Q114386+
Q113583+
Q113584+
Q108855+
Q108617+
Q108754+
Q108342+
Q108343+
Q107869+
Q102906+
Q102674+
Q102687+
Q102289+
Q101162+
Q100680+
Q100562+
Q98869,

data = trainData, 
#method = "glm", family=poisson)#This works
method = "glm",trControl = tr.control)

# Extract tree
best.tree = tr$finalModel
str(best.tree)
summary(best.tree)

happyTestrb = glm(Happy ~
#Income+ 
HouseholdStatus+
EducationLevel+
Party+
#votes+
Q121700+
Q121011+
Q120194+
Q120012+
Q120014+
Q119334+
#Q118892+
Q118237+
Q116797+
Q116441+
Q116197+
Q115610+
#Q115899+
Q115390+
Q114961+
Q114386+
Q113583+
Q113584+
Q108855+
Q108617+
Q108754+
Q108342+
Q108343+
Q107869+
Q102906+
Q102674+
Q102687+
Q102289+
Q101162+
Q100680+
Q100562+
Q98869,
data=trainData, family=binomial)


summary(happyTestrb)





