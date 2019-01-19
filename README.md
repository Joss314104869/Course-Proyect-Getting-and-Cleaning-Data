# Course-Proyect-Getting-and-Cleaning-Data

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

In this project, a set of data was obtained, worked and cleaned, with the final objective of obtaining these data already prepared and ordered and that can be used for a later analysis.
This repository contains the following files:

•	Read.md, this file contains a preview of how to work with the data set.

•	tidy_data.txt which is the file resulting from a subsequent analysis of the ordered data.

•	CodeBook.md, the codebook, which describes the content of the data set (data, variables, etc).

•	run_analysis.R, is an R script, which was created and obviously can be used to obtain the set of data ordered.

# Data Set Information

The following describes how the data was initially collected:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

# Creating ordered data set.

The R script, run_analysis.R can be used to create the ordered data set. First obtain the raw data set (source data), and transform it to produce a final data set by implementing the following steps:

• Download and decompress the source data in case it has not been done.

• Read the data.

• Combine the "set" and "train" data sets to create a new data frame.

• Extract only the measurements on the mean and standard deviation for each measurement.

• Use descriptive activity names to name the activities in the data set.

• Appropriately label the data set with descriptive variable names.

• Create a second, independent tidy set with the average of each variable for each activity and each subject.

• Write the data set to the tidy_data.txt file.

Note: This script requires the dplyr package (version '0.7.8' was used).
