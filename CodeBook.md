CodeBook for run_analysis.R
===========

Files included as raw datasets:
* activity_labels.txt
* features.txt
* subject_train.txt
* X_train.txt
* y_train.txt
* subject_test.txt
* X_test.txt
* y_test.txt

(Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Run statement in R console:
source('~/datasciencecoursera/run_analysis.R')

### Variables

* features = Measured variable names (column names for data frame)
* act_labels = Activity labels
* train_subj = Training set subject IDs
* train_act = Training activities
* train_data = Training set data
* test_subj = Test set subject IDs
* test_act = Test activities
* test_data = Test set data
* train_data = Training data set
* test_data = Test data set
* alldata = Combined training and test data sets
* mean_std_cols = columns with mean or standard deviation (STD) values
* subdata = subset of the data with only mean and STD
* newlabels = renamed labels for measurements
* subdatasum = summarized data set (with mean values of each measurement)

### Data Transformations

Data from "subject_train.txt", "X_train.txt" and "y_train.txt" were combined to create the training data set. Contents from "subject_test.txt", "X_test.txt", and "y_test.txt" were combined to create the test data set. Each data set were combined into an overall data frame, using contents of "features.txt" as column headings for measured variables. The total dataset was subset with only mean and standard deviation measurements. Contents of "activity_labels.txt" provide translation of numbers representing activities into text. Measurement column headings were renamed to unabbreviated values. Final data set contains average measurement values for six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) per participant of the study.
