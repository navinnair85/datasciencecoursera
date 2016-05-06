#Set working directory to the UCI HAR Dataset folder
library(plyr)

#1.Merge the training and the test sets to create one data set.

#read Train data
xTrain = read.table("./train/X_train.txt")
yTrain = read.table("./train/y_train.txt")
subjectTrain = read.table("./train/subject_train.txt")

#read Test data
xTest = read.table("./test/X_test.txt")
yTest = read.table("./test/y_test.txt")
subjectTest = read.table("./test/subject_test.txt")

#create data sets for x,y and subject
xData <- rbind(xTrain, xTest)
yData <- rbind(yTrain, yTest)
subjectData <- rbind(subjectTrain, subjectTest)

#2.Extract only measurements on mean and standard deviation for each measurement
features<-read.table("features.txt")

#select column names with mean or std in them
features_mean_and_std <- grep("-(mean|std)\\(\\)", features[,2])
xData<-xData[, features_mean_and_std]

#set column names of xData
names(xData)<-features[features_mean_and_std,2]

#3.Use descriptive activity names to name the activities in the data set
activity<-read.table("activity_labels.txt")

#update yData values with activity names 
yData[,1]<-activity[yData[,1],2]

#set column name of yData
names(yData)<-"activity"

#4.Appropriately label data set with descriptive variable names.

names(subjectData)<-"subject"

#combine all 3 data tables into 1 data set
combineData<-cbind(xData, yData, subjectData)

#5.Creates a second tidy data set with the average of each variable 
#for each activity and each subject.

averageData <- ddply(combineData, .(subject, activity), function(x) colMeans(x[,1:66]))
write.table(averageData, "average_data.txt", row.names = FALSE)