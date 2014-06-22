run_analysis <- function() {

##Read all the Files required for creating the data set

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)

names(subject_test) <- "Subject"
names(Y_test) <- "Activity"
## 3. Uses descriptive activity names to name the activities in the data set
Y_test$Activity <- activity_labels[Y_test$Activity,]$V2
## 4. Appropriately labels the data set with descriptive variable names. 
names(X_test) <- features$V2
final_test <- cbind(subject_test,Y_test,X_test)

##Clearing unused variables which are not required for any further use
rm(subject_test)
rm(X_test)
rm(Y_test)
gc()

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

names(subject_train) <- "Subject"
names(Y_train) <- "Activity"
## 3. Uses descriptive activity names to name the activities in the data set
Y_train$Activity <- activity_labels[Y_train$Activity,]$V2
## 4. Appropriately labels the data set with descriptive variable names. 
names(X_train) <- features$V2
final_train <- cbind(subject_train,Y_train,X_train)

##Clearing unused variables which are not required for any further use
rm(subject_train)
rm(X_train)
rm(Y_train)
gc()


## 1. Merges the training and the test sets to create one data set.
final_data <- rbind(final_test,final_train)

##Clearing unused variables which are not required for any further use
rm(final_test)
rm(final_train)
gc()



## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

tidy_data <- final_data[, grep("mean\\(\\)|std\\(\\)|Subject|Activity", names(final_data))]

## Extract Tidy Data
dir.create("./UCI HAR Dataset/TidyData")
write.csv(tidy_data, "./UCI HAR Dataset/TidyData/tidy_data_UCI.csv")


library(data.table)

tidy_table <- data.table(tidy_data)

avg_table <- tidy_table[, lapply(.SD, mean), by=c("Subject", "Activity")]

##5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
##Extract Averages Data

write.csv(avg_table, "./UCI HAR Dataset/TidyData/tidy_avgs_data_UCI.csv")

}