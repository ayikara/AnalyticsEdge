# Predictions on the test set
predictCartTest = predict(cartTestrb, newdata=testData, type="class")
predictCartTrain = predict(cartTestrb, type="class")
predictCartTestData = predict(happyTestrb2, type="class", newdata=testData)



str(predictTest)
predictTest
#Load Library
library(ROCR)
#Prediction method
GetCARTAUC = function(MODEL, DATASET, DEPVAR) {
    #result =     as.numeric(performance(prediction(predict(MODEL, type="response", newdata=DATASET), DEPVAR),"auc")@y.values)
    result =     as.numeric(performance(prediction(predict(MODEL, type="class", newdata=DATASET), DEPVAR),"auc")@y.values)
    return(result)


}

#as.numeric(performance(predictCartTest, "auc")@y.values)

aucCARTTrain = GetCARTAUC(predictCartTest, train, train$Happy)
aucCARTTest = GetCARTAUC(happyTestrb, test, test$Happy)

str(predictCartTrain)
submission = data.frame(UserID = testData$UserID, Probability1 = predictCartTest)
write.csv(submission, "submission.csv", row.names=FALSE)
