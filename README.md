# GetCleanData_CourseProject

This repo contains 3 files, as result of the Getting and Cleaning Data Course Project: 

* 'run_analysis.R' script, which collects, works with, cleans a data set and prepare tidy data that can be used for later analysis.
* 'CookBook.md' file, which describes the variables and their transformation used in the run_analysis.R script.
* 'README.md' file, Which describes how the R script is working.

This project assignment goals was to createt an R script, which gets the Human Activity Recognition Using Smartphones Data Set, creates a tidy dataset and cleans it in order to be used for further analysis.

## Data Source for the project

The source date can be obtained from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

These data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The source data should be first downloaded and unzipped to the working directory, in order to start 'run_analysis.R' script.

## The script 'run_analysis.R' does the following:

* Using read.table() function to get all data loaded into R for further processing.

Features list into 'features' data frame;
Activity labels list into 'actLabels' data frame;
Training data set into 'xTrain' data.frame;
Subject information into 'subjTrain' data frame;
Activity label information into 'yTrain' data frame;
Test data set into 'xTest' data frame;
Subject information into 'subjTest' data frame;
Activity label information into 'yTest' data frame.

* Merges the training and the test data sets to create one data set:

First the scripts create one data set ('trainData') for training data binding Subject column ('subjTrain') and Activity Label column ('actLabels') information to the training data set ('xTrain').
Then the scripts create one data set ('testData') for test data binding Subject column ('subjTest') and Activity Label column ('actLabels') information to the test data set ('xTest').
Finally binding the training data set with test data set into 'mergedData' data frame.

* Labels the variable names and extracts only the measurements on the mean and standard deviation for each measurement:

## 

* Uses descriptive activity names to name the activities in the data set:

##

* Creates a tidy data set with the average of each variable for each activity and each subject:

##
