#!/usr/bin/Rscript

#####################################################################################################
##                                                                                                 ##
##  Objective: Create one R script called run_analysis.R that does the following.                  ##
##     (a) Merges the training and the test sets to create one data set.                           ##
##     (b) Extracts only the measurements on the mean and standard deviation for each measurement. ##
##     (c) Uses descriptive activity names to name the activities in the data set                  ##
##     (d) Appropriately labels the data set with descriptive variable names.                      ##
##     (e) From the data set in (d), creates a second, independent tidy data set with              ##
##         the average of each variable for each activity and each subject.                        ##
##                                                                                                 ##
#####################################################################################################

# load plyr package
library(plyr)

baseFolder = "UCI HAR Dataset"

getFilePath <- function(filename) {
	#filepath = sprintf("%s%s%s", baseFolder, '/', filename)
	sprintf("%s%s%s", baseFolder, '/', filename)
	#filepath
}

# Read both the Training and Test Data
XTraining <- read.table(getFilePath("train/X_train.txt"))
XTest     <- read.table(getFilePath("test/X_test.txt"))

YTraining <- read.table(getFilePath("train/y_train.txt"))
YTest     <- read.table(getFilePath("test/y_test.txt"))

# Merges the training and the test sets to create one data set.
XData 	  <- rbind(XTraining, XTest)
YData     <- rbind(YTraining, YTest)

# Clean up the work space and clean vars that are no longer required
rm(XTraining, XTest)
rm(YTraining, YTest)

# Read the subject who performed the activity and combine both train and test
subjectTraining <- read.table(getFilePath("train/subject_train.txt"))
subjectTest     <- read.table(getFilePath("test/subject_test.txt"))
SubjectData     <- rbind(subjectTraining, subjectTest)

# Clean up the work space and clean vars that are no longer required
rm(subjectTraining, subjectTest)

# Read in all List of all features and only keep mean and standard deviation for each measurement.
features <- read.table(getFilePath("features.txt"))
keptMesurePositions <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
XData <- XData[, keptMesurePositions]

#########################################################################################
# set and clean column names
names(XData) <- features[keptMesurePositions, 2]

# remove unwanted characters from column names
names(XData) <- gsub("\\(|\\)", "", names(XData))
names(XData) <- tolower(names(XData))

# Clean up the work space and clean vars that are no longer required
rm(keptMesurePositions, features)

# Provides a descriptive activity column, based on activity_labels.txt
activityLabels <- read.table(getFilePath("activity_labels.txt"))

# clean activity names (one line this time!)
activityLabels[, 2] = gsub("_", "", tolower(as.character(activityLabels[, 2])))
YData[,1] = activityLabels[YData[,1], 2]

# name that new column
names(YData) <- "activity"

# label SubjectData
names(SubjectData) <- "subjectnumber"

# Merge everything together and save into a file: XData, YData, SubjectData
# Creates a cleaned up data set
merged <- cbind(SubjectData, YData, XData)
write.table(merged, "mergedTidyData.txt")

# "Creates a 2nd data set with the average of each variable for each activity and each subject."
excludedColumns = which(names(merged) %in% c("subjectnumber", "activity"))
result <- ddply(merged, .(subjectnumber, activity), .fun=function(x){ colMeans(x[,-excludedColumns]) })

write.table(result, "tidyAverageData.txt",row.names=FALSE)
