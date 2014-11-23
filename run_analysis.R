#!/usr/bin/Rscript

# Merges the training and the test sets to create one data set.

library(plyr)

baseFolder = "UCI HAR Dataset"

getFilePath <- function(filename) {
	#filepath = sprintf("%s%s%s", baseFolder, '/', filename)
	sprintf("%s%s%s", baseFolder, '/', filename)
	#filepath
}
#getFilePath("test")

# Read both the Traininging and Test Data
XTraining <- read.table(getFilePath("train/X_train.txt"))
XTest     <- read.table(getFilePath("test/X_test.txt"))

#head(XTraining)
#head(XTest)

XData <- rbind(XTraining, XTest)
# be a good citizen and clean vars that are no longer required
rm(XTraining, XTest)

YTraining <- read.table(getFilePath("train/y_train.txt"))
YTest     <- read.table(getFilePath("test/y_test.txt"))
YData     <- rbind(YTraining, YTest)

# ... good citizen...
rm(YTraining, YTest)

subjectTraining <- read.table(getFilePath("train/subject_train.txt"))
subjectTest     <- read.table(getFilePath("test/subject_test.txt"))
SubjectData     <- rbind(subjectTraining, subjectTest)

# ... still a good citizen
rm(subjectTraining, subjectTest)


# #2: We should only keep mean and standard deviation for each measurement.
features <- read.table(getFilePath("features.txt"))

# grep(value = FALSE) returns an integer vector of the indices of the elements of x 
# that yielded a match (or not, for invert = TRUE)
keptMesurePositions <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

XData <- XData[, keptMesurePositions]

head(features, 5)
keptMesurePositions

