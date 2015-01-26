####################################################################
## Step 1 
## Merges the training and the test sets to create one data set.
#################################################################### 

## Load Train Set
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
Ytrain <- read.table("UCI HAR Dataset/train/Y_train.txt", header=FALSE)
Strain <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
## Load Test Set
Xtest <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
Ytest <- read.table("UCI HAR Dataset/test/Y_test.txt", header=FALSE)
Stest <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
## Merge train and test with cbind
TrainDataSet <- cbind(Ytrain, Strain, Xtrain)
TestDataSet <- cbind(Ytest , Stest, Xtest)

#Merge All with rbind
dataSet <- rbind(TrainDataSet, TestDataSet)

####################################################################
## Step 2
## Extracts only the measurements on the mean and standard 
## deviation for each measurement. 
#################################################################### 

features <- read.table("UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors = FALSE)
activities <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE, stringsAsFactors = FALSE)
featureNames <- as.character(features[[2]])
## Features with mean and std
featuresMeanSTD <- features[grep("mean|std", features[,2]),]
featureNamesMS <- as.character(featuresMeanSTD[[2]])
dataMS <- dataSet[,featuresMeanSTD[,1]]
dataMS <- cbind(dataMS, rbind(Ytrain,Ytest))
dataMS <- cbind(dataMS, rbind(Strain,Stest))


####################################################################
## Step 3
## Uses descriptive activity names to name the activities
## in the data set  
#################################################################### 
####################################################################
## Step 4
## Appropriately labels the data set with descriptive 
## variable names. 
#################################################################### 

activityNames <- as.character(activities[[2]])

## Adding column names to data
names(dataSet) <- c( "Activity","Subject", featureNames)
names(dataMS) <- c( "Activity","Subject", featureNamesMS)

## Select Data 
selectedData <- dataSet[,c("Activity", "Subject", featuresMeanSTD[,2])]
#library(dplyr)  Got version problems and did not work as intended will be fixed later
selectedData$Activity[selectedData$Activity == 1] <-  "WALKING" 
selectedData$Activity[selectedData$Activity == 2] <-  "WALKING_UPSTAIRS"
selectedData$Activity[selectedData$Activity == 3] <-  "WALKING_DOWNSTAIRS"
selectedData$Activity[selectedData$Activity == 4] <-  "SITTING"
selectedData$Activity[selectedData$Activity == 5] <-  "STANDING"
selectedData$Activity[selectedData$Activity == 6] <-  "LAYING"


####################################################################
## Step 5
## From the data set in step 4, creates a second, independent
## tidy data set with the average of each variable for 
## each activity and each subject.. 
#################################################################### 

write.csv(selectedData, 'selectedData.csv', row.names=FALSE)
write.table(selectedData, 'selectedData.txt', row.names=FALSE)

## Average Data
library(reshape2)
meltedData <- melt(selectedData, id = c('Subject', 'Activity'))
summaryDataMean <- aggregate(. ~ Activity + Subject, meltedData, FUN=mean)
write.csv(summaryDataMean, 'averageData.csv', row.names=FALSE)