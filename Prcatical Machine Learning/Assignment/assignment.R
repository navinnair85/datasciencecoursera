library(knitr)
library(caret)
library(rpart)
library(rpart.plot)
library(rattle)
library(randomForest)
library(corrplot)
set.seed(11111)

#loading data
training<-read.csv("pml-training.csv")
testing<- read.csv("pml-testing.csv")

##partition 70% of training set
train_partition<-createDataPartition(training$classe, p = 0.7, list = FALSE)
train_set<-training[train_partition,]
test_set<-training[-train_partition,]

dim(train_set)
dim(test_set)

#data cleaning
##remove mostly NA variables
NAs <- sapply(train_set, function(x) mean(is.na(x)))>.95
train_set<-train_set[, NAs == FALSE]
test_set<-test_set[, NAs == FALSE]

##Near Zero Variance
nearZeroVariance <- nearZeroVar(train_set)
train_set <- train_set[,-nearZeroVariance]
test_set <- test_set[,-nearZeroVariance]

##Remove columns 1 to 5 which are only used for identification
train_set <-train_set[,-(1:5)]
test_set <-test_set[,-(1:5)]

#Correlation Analysis
corMatrix <- cor(train_set[, -54])
corrplot(corMatrix, order = "FPC", method = "color", type = "lower", 
         tl.cex = 0.8, tl.col = rgb(0, 0, 0))

#Building the prediction model
##Random Forest
set.seed(11111)
controlRandForest<-trainControl(method = "cv", number = 3, verboseIter = FALSE)
modelFitRandForest<-train(classe ~ ., data = train_set, method = "rf", trControl = controlRandForest)
modelFitRandForest$finalModel

predictRandForest <- predict(modelFitRandForest, newdata = test_set)
confusionMatrixRandForest <- confusionMatrix(predictRandForest, test_set$classe)
confusionMatrixRandForest

##Generalized Boosted Model
set.seed(11111)
controlGBM <- trainControl(method = "repeatedcv", number = 5, repeats = 1)
modelFitGBM <-train(classe ~ ., data = train_set, method = "gbm", trControl = controlGBM, verbose = FALSE)
modelFitGBM$finalModel

predictGBM <-predict(modelFitGBM, newdata = test_set)
confusionMatrixGBM <- confusionMatrix(predictGBM, test_set$classe)
confusionMatrixGBM

testing<- read.csv("pml-testing.csv")
predictTest<-predict(modelFitRandForest, newdata = testing)
predictTest