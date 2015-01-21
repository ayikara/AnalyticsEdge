#Examine the data
library(ROCR)
str(trainData)
str(train)


happyTestrb = glm(Happy ~ . - UserID, data=trainData, family=binomial)
summary(happyTestrb)

happyTestrb1 = glm(Happy ~
#Income+
HouseholdStatus+
EducationLevel+
Party+
#Q122769+
#Q121700+
Q121011+
#Q120194+
Q120012+
Q120014+
Q119334+
Q118237+
Q116797+
#Q116881+
Q116953+
Q116441+
Q115610+
Q115899+
Q115390+
Q114961+
#Q114386+
#Q113583+
#Q113584+
Q111848+
Q108855+
#Q108856+
Q108754+
Q108342+
Q108343+
Q107869+
Q102906+
#Q102674+
#Q102687+
Q102289+
Q101162+
#Q100680+
Q100562+
#Q99581+
Q98869+
votes
,
#data=train, family=binomial)
data=trainData, family=binomial)
summary(happyTestrb1)


#This is the best varirable selection so far...
happyTestrb2 = glm(Happy ~
#Income+
HouseholdStatus+
EducationLevel+
Party+
#Q122769+
Q121700+
Q121011+
Q120194+
Q120012+
Q120014+
Q119334+
Q118237+
Q116797+
#Q116881+
Q116953+
Q116441+
Q115610+
Q115899+
Q115390+
Q114961+
Q114386+
Q113583+
Q113584+
Q111848+
Q108855+
#Q108856+
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
#Q99581+
Q98869
#votes
,
#data=train, family=binomial)
data=trainData, family=binomial)
summary(happyTestrb2)


#This is the for best - adding more vars... 0.74991
happyTestrb2 = glm(Happy ~
#Income+
HouseholdStatus+
EducationLevel+
Party+
Q122769+
Q121700+
Q121011+
Q120194+
Q120012+
Q120014+
Q119334+
Q118237+
Q116797+
Q116881+
Q116953+
Q116441+
Q115610+
Q115899+
Q115390+
Q114961+
Q114386+
Q113583+
Q113584+
Q111848+
Q108855+
Q108856+
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
#Q99581+
Q98869
#votes
,
#data=train, family=binomial)
data=trainData, family=binomial)
summary(happyTestrb2)







