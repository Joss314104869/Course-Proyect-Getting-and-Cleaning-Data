## ======================================================= ##
##                                                         ##
##                  FILE run_analysis.R                    ##
##                                                         ##
## ======================================================= ##

 library(dplyr)
 

## ================= ##
##     Get Data      ##
## ================= ##

#=============================================================#
#    Download zip file if even has not been downloaded.       #
#=============================================================#

zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- "getdata_UCI HAR Dataset.zip"

if(!file.exist(zipfile)){
	download.file(zipUrl, destfile = zipfile, mode = "wb")
}

#===================================#
#   Extract or List Zip Archives.   #
#===================================#

Namepath <- "UCI HAR Dataset"
if (!file.exists(Namepath)) {
  unzip(zipfile)
}

#===================================#
#            Read Data              #
#===================================#

# Read test data

testSub <- read.table(file.path(Namepath, "test", "subject_test.txt"))
test_X <- read.table(file.path(Namepath, "test", "X_test.txt"))
test_y <- read.table(file.path(Namepath, "test", "y_test.txt"))

# Read train data

trainSub <- read.table(file.path(Namepath, "train", "subject_train.txt"))
train_X <- read.table(file.path(Namepath, "train", "X_train.txt"))
train_y <- read.table(file.path(Namepath, "train", "y_train.txt"))

# Read features

features <- read.table(file.path(Namepath, "features.txt"), as.is = TRUE)

#Read activity labels

activity_labels <- read.table(file.path(Namepath, "activity_labels.txt"))
colnames(activity_labels) <- c("id", "label")

# ==================================================================== #
#   1.Merges the training and the test sets to create one data set.    #
# ==================================================================== #

# Concatenate the data tables for "test".
table_test <- cbind(testSub, test_X, test_y)

# Concatenate the data tables for "train".
table_train <- cbind(trainSub, train_X, train_y)

# We create a new data frame with two tables previous.
if(identical(names(table_test), names(table_train))){
Activity <- rbind(table_test, table_train)
}

# We remove the data frames previous to save memory.
rm(table_test, table_train, testSub, test_X, test_y,
     trainSub, train_X, train_y)

# Assign column names.
colnames(Activity) <- c("subject", features[, 2], "activity")

# =========================================================================================== #
#   2.Extracts only the measurements on the mean and standard deviation                       #
#                         for each measurement.                                               #
# =========================================================================================== #

# Determine columns of data set
columns <- grepl("subject|activity|mean|std", colnames(Activity))
Activity1 <- Activity[, columns] 

# =========================================================================== #
#   3.Uses descriptive activity names to name the activities                  #
#                         in the data set                                     #
# =========================================================================== #


Activity1$activity <- factor(Activity1$activity, 
  levels = activity_labels[, 1], labels = activity_labels[, 2])

# =========================================================================== #
#    4.Appropriately labels the data set with descriptive variable names.     #
# =========================================================================== #

# Names of Activity1
columnNames <- names(Activity1)

# Remove characters

NamesActivity <- gsub(pattern = "[\\(\\)-]", replacement = "", x = columnNames)

# Remove abbreviations and expand names 

NamesActivity <- gsub(pattern = "^f", replacement = "FrequencyDomain", x = NamesActivity )
NamesActivity <- gsub(pattern = "^t", replacement = "TimeDomain", x = NamesActivity)
NamesActivity <- gsub(pattern = "mean", replacement = "Mean", x = NamesActivity)
NamesActivity <- gsub(pattern = "std", replacement = "StandardDesviation", x = NamesActivity)
NamesActivity <- gsub(pattern = "Acc", replacement = "Accelerometer", x = NamesActivity)
NamesActivity <- gsub(pattern = "Mag", replacement = "Magnitude", x = NamesActivity)
NamesActivity <- gsub(pattern = "Freq", replacement = "Frequency", x = NamesActivity)
NamesActivity <- gsub(pattern = "Gyro", replacement = "Gyroscope", x = NamesActivity)
NamesActivity <- gsub(pattern = "BodyBody", replacement = "Body", x = NamesActivity)

# Replace new columns names 

colnames(Activity1) <- NamesActivity

# =======================================================================================# 
#   5.From the data set in step 4, creates a second, independent tidy data set with the  #
#             average of each variable for each activity and each subject.               #
# =======================================================================================#

mean_activity <- Activity1 %>% group_by(subject, activity) %>%
                 summarise_each(funs(mean))

# Write to file of tidy data 

write.table(mean_activity, file = "tidy_data.txt", row.names = FALSE, col.names = TRUE
             quote = FALSE)











 



