# Getting and Cleaning Data Course Project

## Datasource for the project:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The script 'run_analysis.R' does the following:

## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.

run_analysis <- function() {
        
        setwd("C:/Users/HP/Documents/Judit/Data_Science/coursera/data")
        
        ## Reading features, labels, training and test data
        
        features <- read.table("./UCI HAR Dataset/features.txt")                ## Features list
        actLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")        ## Activity labels list
        
        xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")             ## Training data set
        subjTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")    ## Performer information
        yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")             ## Activity label information
        
        xTest <- read.table("./UCI HAR Dataset/test/X_test.txt")                ## Test data set
        subjTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")       ## Performer information
        yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")                ## Activity label information
        
        ## Merging training and test data
        
        trainData <- cbind(subjTrain, yTrain, xTrain)
        testData <- cbind(subjTest, yTest, xTest)
        mergedData <- rbind(trainData, testData)
        
        ## Extracts measurements on the mean and standard deviation
        ## Include descriptive variable names
        
        names(mergedData) <- c("Subject", "Activity", as.character(features[, 2]))
        featuresSubset <- grep("mean|std", names(mergedData))
        subsetData <- mergedData[, c(1, 2, featuresSubset)]
        
        ## Include descriptive activity names
        
        for(i in 1:length(subsetData[, 2])) {
                subsetData[i, 2] <- as.character(actLabels[subsetData[i, 2], 2])
        }
        
        ## Create independent tidy data set
        ## with the average of each variable for each activity and each subject
        
        library(reshape2)
        tidyData <- data.frame()
        
        for(i in 1:length(featuresSubset)) {
                
                meltData1 <- melt(subsetData, id = c("Subject", "Activity"), measure.vars = names(subsetData)[i+2])
                dcastedData1 <- dcast(meltData1, Subject + Activity ~ variable, mean)
                meltData2 <- melt(dcastedData1, id = c("Subject", "Activity"), measure.vars = names(dcastedData1)[3])
                
                tidyData <- rbind(tidyData, meltData2)
        }
        
        ## Create a txt file to store the tidy data set
        
        write.table(tidyData, file = "Train_Test_Mean_Data.txt", row.name = FALSE)        
}