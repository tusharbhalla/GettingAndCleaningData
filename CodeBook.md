Getting and Cleaning Data Assignment 1
=======================================

Datasets
---------

This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here is the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following files have been used for the Test and Train data :

1. Test Data is available in - "X_test", "y_test", "subject_test" files
2. Train Data is available in - "X_train", "y_train", "subject_train" files
3. Activity Labels are available in "activity_labels" file
4. Features are available in "features" file

Data Cleaning
--------------

### Variables - 

#### Guideline for interpreting variables:

1. Variables prefixed with t - Represent Time domain signals
2. Variable prefixed with f - Represent Frequency domain signals
3. Variables suffixed with -XYZ - Represent 3-axial signals in X, Y, Z direction
4. mean - Mean value
5. std - Standard deviation
6. mad - Median absolute deviation 
7. max - Largest value in array
8. min - Smallest value in array
9. sma - Signal magnitude area
10. energy - Energy measure. Sum of the squares divided by the number of values. 
11. iqr - Interquartile range 
12. entropy - Signal entropy
13. arCoeff - Autorregresion coefficients with Burg order equal to 4
14. correlation - correlation coefficient between two signals
15. maxInds - index of the frequency component with largest magnitude
16. meanFreq - Weighted average of the frequency components to obtain a mean frequency
17. skewness - skewness of the frequency domain signal 
18. kurtosis - kurtosis of the frequency domain signal 
19. bandsEnergy - Energy of a frequency interval within the 64 bins of the FFT of each window.
20. angle - Angle between two vectors.

###Subset Variables

The set of variables that were estimated (and kept for this assignment) from these signals are:

mean(): Mean value
std(): Standard deviation


### Transformation - 

1. Dataset specified above should be available in the working directory. 
2. The files were read using read.table function.
3. The test data from the three files "X_test", "y_test", "subject_test" was loaded in first into three seperate data frames.
4. Descriptive column names were then added to each data set.
5. Activity labels were assigned to the data set. All the columns were then binded together into a single dataframe.
6. A memory cleanup is perfomed after this step to clear off unwanted data frames from the memory for better performance.
7. Steps 3 - 6 are repeated again for the train dataset.
8. Both the final_test, final_train dataframes are merged into a single dataset using the rbind function.
9. A regex is used to filter out the columns for mean() and std() maintained in them.
10. The final tidy dataset is then extarcted in form of a txt file
11. Another operation is performed on the dataset to calculate the averages of all the variables -
11.1 - For this reason we have used a data table to speed the process of calculating the averages by each subject and activity.


Final Output
------------

The run_analysis.R function performs the following actions -

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

