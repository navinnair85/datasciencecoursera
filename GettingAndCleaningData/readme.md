#Getting and Cleaning Data Course Project

##Overview
This project involves collecting, working with, and cleaning a data set in order to prepare tidy data that can be used for later analysis. The original source data comes from the UCI Machine Learning Repository and can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

This data represents data collected from the accelerometers of the Samsung Galaxy S smartphone.

##Files and folders in Repo
###1. UCI HAR Dataset Folder
Contains Human Activity Recognition Using Smartphones Data Set in original form, downloaded from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

###2. run_analysis R script
The R script run_analysis.R does the following:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set.
  4. Labels the data set with descriptive variable names.
  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject and writes the dataset to a file called average_data.txt.

###3. CodeBook.md
A markdown file that describes the variables, the data, and any work performed to clean up the data.

##Running the run_analysis script
To run the run_analysis script, download the UCI HAR Dataset folder and set it as the working directory. You can then run the run_analysis script which will create a text file containing the tidy average data  of each variable for each activity and each subject. 