## CodeBook

Source of the data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##### Introduction

We apply various transformations on Human Activity Recognition Data Using Smartphones. Our transformations are as follows

- Create a data set that merges your subject, activity(human readable) and all mean and standard deviation data and writes it out to disk as mean_std_data_set.R
- Create a data set that aggregates data over subject & activity by calculating the average and writes it out to disk as tidy_data_set.R

For more reference see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

##### Variables / Files

Necessary data frame variables loaded at the start of our processing:

- activitylabels from "./UCI HAR Dataset/activity_labels.txt" 
- features from "./UCI HAR Dataset/features.txt"
- subjecttrain from "./UCI HAR Dataset/train/subject_train.txt"
- subjecttest from "./UCI HAR Dataset/test/subject_test.txt"
- xtrain from "./UCI HAR Dataset/train/X_train.txt"
- xtest from "./UCI HAR Dataset/test/X_test.txt"
- ytrain from "./UCI HAR Dataset/train/y_train.txt"
- ytest from "./UCI HAR Dataset/test/y_test.txt"


##### Transformations

For mean_std_data_set.txt

- Test and train data is merged for subject, x and y
- Features are applied for column naming
- Activity labels are applied to the activity column
- extracted_data is produced by filtering only subject, activity, mean, std columns
- File written out

For tidy_data_set.txt

- Test and train data is merged for subject, x and y
- Features are applied for column naming
- Activity labels are applied to the activity column
- Data set is aggregated by subject and by activity by calculating the mean
- File written out
