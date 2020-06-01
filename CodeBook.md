# Code Book 
This is the code book of the final projet

# About the source data 
The data retired of the UCI Machine Learning Repository, wich is a collection of databases, domain theories, and data generators that are used by the machine learning community for the empirical analysis of machine learning algorithms. The archive was created as an ftp archive in 1987 by David Aha and fellow graduate students at UC Irvine

the site were the data was obtained is here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and the link for download is here
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# the script
At the script, you can see the explanation of the script step by step as clear as I could have done. 
The scrip is divided by the followin steps:

#### creating a directory and setting as wd

#### Downloading and unziping the dataset

#### Topic 1: Merges the training and the test sets to create one data set.

##### 1.  Reading training and test datasets
###### 1.a Reading training datasets
###### 1.b Reading test datasets
###### 1.c Reading features
###### 1.d Reading activity labels
##### 2. Naming columns variable
###### 2.a Naming train columns 
###### 2.b Naming test columns
###### 2.c Naming labels columns
##### 3. Merging columns with activity labels and assigning test or train for each row 
###### 3.a merging labels
###### 3.b creating TRAIN or TEST column
###### 3.c Merging the datasets
###### 3.d Merging all
#### Topic 2: Extracts only the measurements on the mean and standard deviation for each measurement.
##### 1 extracting columns of interest
###### 1.a Getting the colnames of the final dataset
##### 2 Extracting the mean and std
###### 2.a finding columns of interest 
###### 2.b subseting the the Dataset according with mean and std
#### Topic 3: Uses descriptive activity names to name the activities in the data set.
#### Topic 4:Appropriately labels the data set with descriptive variable names. 
 It was already done at steps at topic 1: 3.a, 3.b and 3.c
#### Topic 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##### 1 Making a second tidy data set
##### 2 Writing second tidy data set into a txt file

## About variables:   
* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_data`, `y_data` and `subject_data` merge the previous datasets to further analysis.
* `features` contains the correct names for the `x_data` dataset
