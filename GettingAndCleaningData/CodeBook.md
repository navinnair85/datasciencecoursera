#UCI HAR Dataset
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity was captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

Each record has: 
1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
2. Triaxial Angular velocity from the gyroscope. 
3. A 561-feature vector with time and frequency domain variables. 
4. Its activity label. 
5. An identifier of the subject who carried out the experiment.

##Data Transformation
The run_analysis.R script performs the following actions to clean, transform and process the raw data:

###1. Merge Separate Data Sets
Train and Test data sets were merged to form X, Y and subject data sets

###2. Extract only measurements on the mean and standard deviation for each measurement 
Select only columns that have "mean" or "std" in the header

###3. Use descriptive activity names to name the activities in the data set
Look up activity IDs in activity_labels.txt and replace them with the activity decsription

###4. Combine X, Y and Subject Data Sets
Combines the X, Y and Subject data sets using cbind. 

###5. Create an independent tidy data set with the average of each variable for each activity and each subject
Using ddply in the plyr library, apply colMeans to the intermediate dataset and write the output to a separate file called average_data.txt

The tidy data set contains the mean and standard deviation of the readings for the following signals:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Note:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
- The above labels are appended with either "mean()" or "std()" to indicate mean and standard deviation respectively. 
- There are no unit of measurements as all features were normalized and bounded within (-1,1).    