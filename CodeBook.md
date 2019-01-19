# Code book for Coursera data collection and cleaning course project.
 
See the README.md for more background information on this code book in the "tidy_data.txt" data set found in this repository.

# Data.
The set of data found in the file "tidy_data.txt", their values are separated by a space.

The first row contains the name of the variables and the rest contain their values.


# Identifiers

1.  subject

The identifier of the subject, whole, varies from 1 to 30.

2. activity

Activity identifier, string with 6 possible values:

 • WALKING: the subject was walking
 
• WALKING_UPSTAIRS: the subject was walking upstairs

• WALKING_DOWNSTAIRS: the subject was walking down

• SITTING: the subject was sitting

• STANDING: the subject was standing

• LAYING: subject was lying

# Average measures
All measurements are floating point values, normalized and limited within [-1,1].

The magnitudes of the three-dimensional signals (variables containing Magnitude) were calculated using the Euclidean norm.
Prior to normalization, acceleration measurements (variables containing Accelerometer) were performed in g 's (9.81 ms⁻²) and gyroscope measurements (variables containing Gyroscope) were performed in radians per second (rad.s⁻¹) ).

The measurements are classified in two domains:

• Signals in the time domain (variables prefixed by timeDomain), resulting from the capture of unprocessed signals from the accelerometer and the gyroscope.

• Frequency domain signals (variables prefixed by frequencyDomain), resulting from the application of a Fast Fourier Transform (FFT) to some of the time domain signals.

# Time-domain signals

• Average time-domain body acceleration in the X, Y and Z directions:
1. timeDomainBodyAccelerometerMeanX
2. timeDomainBodyAccelerometerMeanY
3. timeDomainBodyAccelerometerMeanZ

• Standard deviation of the time-domain body acceleration in the X, Y and Z directions:
1. timeDomainBodyAccelerometerStandardDeviationX
2. timeDomainBodyAccelerometerStandardDeviationY
3. timeDomainBodyAccelerometerStandardDeviationZ

• Average time-domain gravity acceleration in the X, Y and Z directions:
1. timeDomainGravityAccelerometerMeanX
2. timeDomainGravityAccelerometerMeanY
3. timeDomainGravityAccelerometerMeanZ

• Standard deviation of the time-domain gravity acceleration in the X, Y and Z directions:
1. timeDomainGravityAccelerometerStandardDeviationX
2. timeDomainGravityAccelerometerStandardDeviationY
3. timeDomainGravityAccelerometerStandardDeviationZ

• Standard deviation of the time-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:
1. timeDomainBodyAccelerometerJerkStandardDeviationX
2. timeDomainBodyAccelerometerJerkStandardDeviationY
3. timeDomainBodyAccelerometerJerkStandardDeviationZ

• Average time-domain body angular velocity in the X, Y and Z directions:
1. timeDomainBodyGyroscopeMeanX
2. timeDomainBodyGyroscopeMeanY
3. timeDomainBodyGyroscopeMeanZ

• Standard deviation of the time-domain body angular velocity jerk (derivation of the angular velocity in time) in the X, Y and Z directions:
1. timeDomainBodyGyroscopeJerkStandardDeviationX
2. timeDomainBodyGyroscopeJerkStandardDeviationY
3. timeDomainBodyGyroscopeJerkStandardDeviationZ

• Average and standard deviation of the time-domain magnitude of body acceleration:
1. timeDomainBodyAccelerometerMagnitudeMean
2. timeDomainBodyAccelerometerMagnitudeStandardDeviation

• Average and standard deviation of the time-domain magnitude of gravity acceleration:
1. timeDomainGravityAccelerometerMagnitudeMean
2. timeDomainGravityAccelerometerMagnitudeStandardDeviation

• Average and standard deviation of the time-domain magnitude of body acceleration jerk (derivation of the acceleration in time):1. 
1. timeDomainBodyAccelerometerJerkMagnitudeMean
2. timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation

• Average and standard deviation of the time-domain magnitude of body angular velocity:
1. timeDomainBodyGyroscopeMagnitudeMean
2. timeDomainBodyGyroscopeMagnitudeStandardDeviation

• Average and standard deviation of the time-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time):
1. timeDomainBodyGyroscopeJerkMagnitudeMean
2. timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation
3. Frequency-domain signals

• Average frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:
1. frequencyDomainBodyAccelerometerJerkMeanX
2. frequencyDomainBodyAccelerometerJerkMeanY
3. frequencyDomainBodyAccelerometerJerkMeanZ

• Standard deviation of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in the X, Y and Z directions:
1. frequencyDomainBodyAccelerometerJerkStandardDeviationX
2. frequencyDomainBodyAccelerometerJerkStandardDeviationY
3. frequencyDomainBodyAccelerometerJerkStandardDeviationZ


# Transformations

1.- The training and test sets were merged to create one data set.

2.- The measurements on the mean and standard deviation (i.e. signals containing the strings mean and std) were extracted for each measurement, and the others were discarded.

3.- The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names (see Identifiers section).

4.-The variable names were replaced with descriptive variable names (e.g. tBodyAcc-mean()-X was expanded to timeDomainBodyAccelerometerMeanX), using the following set of rules:

• Special characters (i.e. (, ), and -) were removed

• The initial f and t were expanded to frequencyDomain and timeDomain respectively.

• Acc, Gyro, Mag, Freq, mean, and std were replaced with Accelerometer, Gyroscope, Magnitude, Frequency, Mean, and StandardDeviation respectively.

5.- From the data set in step 4, the final data set was created with the average of each variable for each activity and each subject.
