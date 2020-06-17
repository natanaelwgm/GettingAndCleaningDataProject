#### WEEK 4 Assignment ####

#####################

## STEP 0 -> reading features and activities ##

features <- read.table("./PGA_4/UCI HAR Dataset/features.txt")
head(features)

activities <- read.table("./PGA_4/UCI HAR Dataset/activity_labels.txt")
head(activities)

str(features) ## here we see that the number of rows is 561
str(activities)



######################
## STEP 1 and 3 : reading, merging, and adding descriptive activity nme
## reading training and test data
training <- read.table("./PGA_4/UCI HAR Dataset/train/X_train.txt")
str(training) ## here we see that the number of columns is 561, matching with features
colnames(training) <- features$V2
str(training) ## recheck

y_training <- read.table("./PGA_4/UCI HAR Dataset/train/y_train.txt")
str(y_training) ## here we see that the number of columns is 561, matching with features

nrow(training) ## here we see 7352 rows
nrow(y_training) ## matching here 7352 as well!

training$activity <- y_training$V1
str(training) ## recheck

subject_training <- read.table("./PGA_4/UCI HAR Dataset/train/subject_train.txt")
str(subject_training) ## here we see 7352 obs again, then we have to add new var to training
training$subject <- factor(subject_train$V1)

str(training) ## recheck

## now for the testing data
testing <- read.table("./PGA_4/UCI HAR Dataset/test/X_test.txt")
str(testing) ## here we see that the number of columns is 561, matching with features
colnames(testing) <- features$V2
str(testing) ## recheck

y_testing <- read.table("./PGA_4/UCI HAR Dataset/test/y_test.txt")
str(y_testing) ## here we see that the number of columns is 561, matching with features

nrow(testing) ## here we see 7352 rows
nrow(y_testing) ## matching here 7352 as well!

testing$activity <- y_testing$V1
str(testing) ## recheck

subject_testing <- read.table("./PGA_4/UCI HAR Dataset/test/subject_test.txt")
str(subject_testing) ## here we see 7352 obs again, then we have to add new var to training
testing$subject <- factor(subject_testing$V1)

str(testing) ## recheck

### moving on to the merging process
### here, we rather just 'append' the data or basically rbinding the data
str(testing$subject)
str(training$subject) ## we just checked that the numbers are different, thus we can rbind
testing$tag <- "Test" ## to give ID if needed
training$tag <- "Train" ## to give ID if needed

combined <- rbind(testing, training)  ## data is merged





########################
### STEP 2: only taking the standard deviations or mean columns

cols <- colnames(combined)
cols_filter <- grep("[Mm]ean|[Ss]td|subject|activity|tag", cols, value=T)
cols_filter ## recheck

combined_filter <- combined[, cols_filter]
str(combined_filter) #recheck






#########################
### STEP 4: adding activity labels
combined_filter$activitylabel <- factor(combined_filter$activity,
                                        labels = c("WALKING",
                                                   "WALKING_UPSTAIRS",
                                                   "WALKING_DOWNSTAIRS",
                                                   "SITTING",
                                                   "STANDING",
                                                   "LAYING"))

### Here is the end of data manipulation





#########################
### STEP 5: tidying up
##grep("std\\(\\)|mean\\(\\)", cols, value=TRUE)
library(dplyr)
library(reshape2)
features_col <- grep("[m]ean|[s]td", cols, value=TRUE)
combined_filter_melt <- melt(combined_filter,
                             id = c("activitylabel", "subject"),
                             measure.vars = features_col)
combined_filter_tidy <- dcast(combined_filter_melt,
                              activitylabel + subject ~ variable, mean)

write.table(combined_filter_tidy, "./tidy_data.txt", row.names = FALSE, quote = FALSE)


