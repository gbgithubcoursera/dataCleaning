Getting and Cleaning Data: Course Project
=========================================

Introduction
------------
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

Source raw data
----------------
Data used in this project was downloaded from the following source: 
* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The source zip file contains a README.txt file with a detailed description of the dataset contained within.

The run_anlysis.R script and the tidy dataset
----------------------------------------------
The  created  script called runanalysis.R merges the test and training data sets together.

After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.

The merged data is written to an intermediary file called mergedTidyData.txt from which the same data, the script creates a tidy data set containing the means of all the columns per test subject and per activity.
This tidy dataset is then written to a tab-delimited file called tidyAverageData.txt.

About the Code Book
-------------------
The CodeBook.md file explains the transformations performed and the resulting data and variables.

