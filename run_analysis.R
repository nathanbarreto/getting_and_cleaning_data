#creating a directory and setting as wd
if(!file.exists("./finalproject")){dir.create("./finalproject")}
setwd("./finalproject")

# Downloading and unziping the dataset
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./finalproject/dataset.zip")
unzip(zipfile = "./finalproject/dataset.zip", exdir = "./finalproject")

## Topic 1: Merges the training and the test sets to create one data set.

#1.  Reading training and test datasets

#1.a Reading training datasets
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# 1.b Reading test datasets
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# 1.c Reading features
features <- read.table("./UCI HAR Dataset/features.txt")

#1.d  Reading activity labels
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#2.Naming columns variable

#2.a Naming train columns 
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

#2.b Naming test columns
colnames(x_test) <- features[,2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

#2.c Naming labels columns 
colnames(activityLabels)<- c("activityID", "activityType")

#3 Merging columns with activity labels and assigning test or train for each row 

#3.a merging labels
y_test<- merge(y_test, activityLabels)
y_train <- merge(y_train, activityLabels)

#3.b creating TRAIN or TEST column
type1<-data.frame(Type = "TRAIN")
type2 <- data.frame(Type = "TEST")

#3.c Merging the datasets
train <- cbind(type1,y_train, subject_train, x_train)
test <- cbind(type2,y_test, subject_test, x_test)

#3.d Merging all
final_DS <- rbind(train, test)

#Topic 2: Extracts only the measurements on the mean and standard deviation for each measurement.

#1 extracting columns of interest

#1.a Getting the colnames of the final dataset
colNames <- colnames(final_DS)

#2 Extracting the mean and std

#2.a finding columns of interest 

mean_and_std <- (grepl("Type", colNames)|
                 grepl("activityID",colNames)|
                 grepl("activityType", colNames)|
                 grepl("subjectID", colNames)|
                 grepl("mean", colNames)|
                 grepl("std", colNames)
                )
#2.b subseting the the Dataset according with mean and std
MeanandStd <- final_DS[, mean_and_std == T]


#Topic 3: Uses descriptive activity names to name the activities in the data set | Topic 4:Appropriately labels the data set with descriptive variable names. 
#It was already done at steps at topic 1: 3.a, 3.b and 3.c

#Topic 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

#1 Making a second tidy data set
tidyds <- aggregate( .~subjectID + activityType + Type, MeanandStd, mean)
tidyds <- tidyds[order(tidyds$subjectID, tidyds$activityType), ]

#2 Writing second tidy data set into a txt file
write.table(tidyds, "tidyds.txt", row.names = FALSE)

View(tidyds)


