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

### Variables
features = Variable names (column names for data frame)
act_labels = Activity labels
train_subj = Training set subject IDs
train_act = Training activities
train_data = Training set data
test_subj = Test set subject IDs
test_act = Test activities
test_data = Test set data

# combine data frames
train_data = Training data set
test_data = Test data set
alldata = Combined training and test data sets

mean_std_cols = columns with mean or standard deviation (STD) values
subdata = subset of the data with only mean and STD
newlabels = renamed labels for variables