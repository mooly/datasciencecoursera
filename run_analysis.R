# load libraries
library(plyr)
library(dplyr)

# Assume text files are in working directory:
#   activity_labels.txt
#   features.txt
#   subject_train.txt
#   X_train.txt
#   y_train.txt
#   subject_test.txt
#   X_test.txt
#   y_test.txt

# read data into variables:
features <- read.table("features.txt")
act_labels <- read.table("activity_labels.txt")
train_subj <- read.table("subject_train.txt",col.names="id")
train_act <- read.table("y_train.txt",col.names="activity")
train_data <- read.table("X_train.txt",col.names=features[,2])
test_subj <- read.table("subject_test.txt",col.names="id")
test_act <- read.table("y_test.txt",col.names="activity")
test_data <- read.table("X_test.txt",col.names=features[,2])

# combine data frames
train_data <- bind_cols(train_subj,train_act,train_data)
test_data <- bind_cols(test_subj,test_act,test_data)
alldata <- bind_rows(train_data,test_data)

# select only columns with mean or standard deviation (std) values
mean_std_cols <- grep("mean|std",names(alldata))
subdata <- alldata[,c(1,2,mean_std_cols)]

# convert activity value to text
for (i in 1:length(subdata$activity)) {
    if (subdata$activity[i]==1) subdata$activity[i]<-"walking"
    if (subdata$activity[i]==2) subdata$activity[i]<-"walking upstairs"
    if (subdata$activity[i]==3) subdata$activity[i]<-"walking downstairs"
    if (subdata$activity[i]==4) subdata$activity[i]<-"sitting"
    if (subdata$activity[i]==5) subdata$activity[i]<-"standing"
    if (subdata$activity[i]==6) subdata$activity[i]<-"laying"
}
# rename columns
newlabels<-c("id","activity",
             "BodyAccelerationMeanXaxisTimeDomain",
             "BodyAccelerationMeanYaxisTimeDomain",
             "BodyAccelerationMeanZaxisTimeDomain",
             "BodyAccelerationSTDXaxisTimeDomain",
             "BodyAccelerationSTDYaxisTimeDomain",
             "BodyAccelerationSTDZaxisTimeDomain",
             "GravityAccelerationMeanXaxisTimeDomain",
             "GravityAccelerationMeanYaxisTimeDomain",
             "GravityAccelerationMeanZaxisTimeDomain",
             "GravityAccelerationSTDXaxisTimeDomain",
             "GravityAccelerationSTDYaxisTimeDomain",
             "GravityAccelerationSTDZaxisTimeDomain",
             "JerkAccelerationMeanXaxisTimeDomain",
             "JerkAccelerationMeanYaxisTimeDomain",
             "JerkAccelerationMeanZaxisTimeDomain",
             "JerkAccelerationSTDXaxisTimeDomain",
             "JerkAccelerationSTDYaxisTimeDomain",
             "JerkAccelerationSTDZaxisTimeDomain",
             "BodyGyroscopeMeanXaxisTimeDomain",
             "BodyGyroscopeMeanYaxisTimeDomain",
             "BodyGyroscopeMeanZaxisTimeDomain",
             "BodyGyroscopeSTDXaxisTimeDomain",
             "BodyGyroscopeSTDYaxisTimeDomain",
             "BodyGyroscopeSTDZaxisTimeDomain",
             "JerkGyroscopeMeanXaxisTimeDomain",
             "JerkGyroscopeMeanYaxisTimeDomain",
             "JerkGyroscopeMeanZaxisTimeDomain",
             "JerkGyroscopeSTDXaxisTimeDomain",
             "JerkGyroscopeSTDYaxisTimeDomain",
             "JerkGyroscopeSTDZaxisTimeDomain",
             "BodyAccelerationMagnitudeMeanTimeDomain",
             "BodyAccelerationMagnitudeSTDTimeDomain",
             "GravityAccelerationMagnitudeMeanTimeDomain",
             "GravityAccelerationMagnitudeSTDTimeDomain",
             "JerkAccelerationMagnitudeMeanTimeDomain",
             "JerkAccelerationMagnitudeSTDTimeDomain",
             "BodyGyroscopeMagnitudeMeanTimeDomain",
             "BodyGyroscopeMagnitudeSTDTimeDomain",
             "JerkGyroscopeMagnitudeMeanTimeDomain",
             "JerkGyroscopeMagnitudeSTDTimeDomain",

             "BodyAccelerationMeanXaxisFrequencyDomain",
             "BodyAccelerationMeanYaxisFrequencyDomain",
             "BodyAccelerationMeanZaxisFrequencyDomain",
             "BodyAccelerationSTDXaxisFrequencyDomain",
             "BodyAccelerationSTDYaxisFrequencyDomain",
             "BodyAccelerationSTDZaxisFrequencyDomain",
             "BodyAccelerationWeightedMeanXaxisFrequencyDomain",
             "BodyAccelerationWeightedMeanYaxisFrequencyDomain",
             "BodyAccelerationWeightedMeanZaxisFrequencyDomain",
             "JerkAccelerationMeanXaxisFrequencyDomain",
             "JerkAccelerationMeanYaxisFrequencyDomain",
             "JerkAccelerationMeanZaxisFrequencyDomain",
             "JerkAccelerationSTDXaxisFrequencyDomain",
             "JerkAccelerationSTDYaxisFrequencyDomain",
             "JerkAccelerationSTDZaxisFrequencyDomain",
             "JerkAccelerationWeightedMeanXaxisFrequencyDomain",
             "JerkAccelerationWeightedMeanYaxisFrequencyDomain",
             "JerkAccelerationWeightedMeanZaxisFrequencyDomain",
             "BodyGyroscopeMeanXaxisFrequencyDomain",
             "BodyGyroscopeMeanYaxisFrequencyDomain",
             "BodyGyroscopeMeanZaxisFrequencyDomain",
             "BodyGyroscopeSTDXaxisFrequencyDomain",
             "BodyGyroscopeSTDYaxisFrequencyDomain",
             "BodyGyroscopeSTDZaxisFrequencyDomain",
             "BodyGyroscopeWeightedMeanXaxisFrequencyDomain",
             "BodyGyroscopeWeightedMeanYaxisFrequencyDomain",
             "BodyGyroscopeWeightedMeanZaxisFrequencyDomain",
             "BodyAccelerationMagnitudeMeanFrequencyDomain",
             "BodyAccelerationMagnitudeSTDFrequencyDomain",
             "BodyAccelerationMagnitudeWeightedMeanFrequencyDomain",
             "JerkAccelerationMagnitudeMeanFrequencyDomain",
             "JerkAccelerationMagnitudeSTDFrequencyDomain",
             "JerkAccelerationMagnitudeWeightedMeanFrequencyDomain",
             "BodyGyroscopeMagnitudeMeanFrequencyDomain",
             "BodyGyroscopeMagnitudeSTDFrequencyDomain",
             "BodyGyroscopeMagnitudeWeightedMeanFrequencyDomain",
             "JerkGyroscopeMagnitudeMeanFrequencyDomain",
             "JerkGyroscopeMagnitudeSTDFrequencyDomain",
             "JerkGyroscopeMagnitudeWeightedMeanFrequencyDomain"             
             )
colnames(subdata)<-newlabels
# write.table(subdata,file="tidydata.txt")
subdatasum <- group_by(subdata,id,activity)
subdatasum <- summarise_each(subdatasum,funs(mean))
write.table(subdatasum,file="tidydata.txt")
