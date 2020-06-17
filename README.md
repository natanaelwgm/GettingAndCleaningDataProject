# GettingAndCleaningDataProject
My repository for the assignment of Getting and Cleaning Data course at Coursera

## How was the initial dataset?
The dataset was adopted from the UCI HAR Dataset. The initial version contained the datasets such as:
* features  
* features_info  
* activity_labels  
* X_train  
* X_test  
* y_train  
* y_test  
* subject_test  
* subject_train  
* README  

As well as inertia files for both testing and training dataset (but we will not delve into them).

Initially, the dataset was quite messy and really hard to read. However, after a period of digesting the data, we can infer that there are similarities across the datasets contained in the data. Such similarities include:
* The same number of columns in the training dataset with the number of rows in the features dataset (n = 561). From this I infer that the training (and testing) datasets will be named with column names contained in features  
* Number of observations in the *subject_training* dataset matching the number of observation of the training (and testing) datasets (i.e., X_train, y_train, and subject_train). From this I infer that we will add (or mutate) new variable (or column) horizontally.

All the steps for data manipulation was included in the run_analysis.R

## Assignment Description (from Coursera website)

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
