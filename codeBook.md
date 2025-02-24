# Code Book
The code book describes the variables, the data, and any transformations or work that has been
performed to clean up the data.

## Data source

The data has been downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The source data contains a README.txt file that contains all the details of the experiments carried out. The data set collected was from a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

## Variables

The collected dataset was package in different files each of which contains different details for the dataset.(Please refer to the README.txt in the source data file for a detailed description).

The central data files that are we are working with are:
* Training data set.
* Test data set.

The mojor components of the data set or exprement were:
* Features
* Activities
* Subjects

In brief:
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name. 
* 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample.

# The run_analysis Script:

In this script we are going to accomplish the following:
* Merges the training and the test sets to create one data set.                           
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set                  
* Appropriately labels the data set with descriptive variable names.                      
* From the data set in (d), creates a second, independent tidy data set with              
   the average of each variable for each activity and each subject.         

The script reads both training and test data/files, then merges both the training and test files.
From the merged dataset we retain each record/measuremet that contains mean and standard deviation.
Based on activity_labels.txt, we derive descriptive activity column names.
 
* subjectnumber: the string that corresponds to the subject of the experiment
* activity: a string that represent the activity of the subject while collecting data points

For example, tBodyAcc-mean()-X` becomes tbodyacc-mean-x`.

# Output

* mergedTidyData.txt: a space-delimited value file that contains mean and standard deviation for each measurements from the train and test data,
* tidyAverageData.txt: a space-delimited value file that contains tidy data set with the average of each variable for each activity and each subject
