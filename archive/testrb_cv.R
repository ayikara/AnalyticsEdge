library(boot)
k    <- 10
kfCV <- cv.glm(data=trainData, glmfit=happyTestrb, K=k)
strkfCV$delta
str(kfCV)

http://stackoverflow.com/questions/19946930/r-cross-validation-on-a-dataset-with-factors
http://www.uni-kiel.de/psychologie/rexrepos/posts/crossvalidation.html#TOC