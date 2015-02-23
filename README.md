datasciencecoursera
===================

This repo contains files for JHU Data Science course project for module 
Getting and Cleaning Data

### run_analysis.R
The run_analysis script reads raw data text files containing signals from mobile
device accelerometer and gyroscope (Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Data downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script accomplishes the following:

1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement. 
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names. 
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.