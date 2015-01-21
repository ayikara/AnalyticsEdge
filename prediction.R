# Predictions on the test set
predictTest = predict(happyTestrb2, type="response", newdata=testData)
predictTest2 = predict(best.tree, type="response")

predictTrain = predict(best.tree, type="response")
predictTestData = predict(happyTestrb2, type="response", newdata=testData)

#crossvalid
predictTest = predict(best.tree, type="response", newdata=testData)
pred10<-predict(tr,newdata=testData, type="prob")
str(predictTest)
predictTest
#Load Library
library(ROCR)
#Prediction method
GetAUC = function(MODEL, DATASET, DEPVAR) {
    result =     as.numeric(performance(prediction(predict(MODEL, type="response", newdata=DATASET), DEPVAR),"auc")@y.values)
    return(result)
}



aucTrain = GetAUC(happyTestrb2, trainData, trainData$Happy)
aucTest = GetAUC(best.tree, testData, testData$Happy)

submission = data.frame(UserID = testData$UserID, Probability1 = predictTrain)
submission = data.frame(UserID = testData$UserID, Probability1 = predictTest)
write.csv(submission, "submission.csv", row.names=FALSE)
