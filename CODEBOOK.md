# Getting and Cleaning Data Project
## Introduction

This Codebook will explain the variables contained in the tidy dataset as well as in the resulting data of the run_analysis.R code that is located in this repository.

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

As well as inertia files for both testing and training dataset (but we will not delve into them)

Initially, the dataset was quite messy and really hard to read. However, after a period of digesting the data, we can infer that there are similarities across the datasets contained in the data. Such similarities include:
* The same number of columns in the training dataset with the number of rows in the features dataset (n = 561)  
** From this I infer that the training (and testing) datasets will be named with column names contained in features  
* Number of observations in the *subject_training* dataset matching the number of observation of the training (and testing) datasets (i.e., X_train, y_train, and subject_train)
** From this I infer that we will add (or mutate) new variable (or column) horizontally.

