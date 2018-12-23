
# The Study

The original experiments were performed by the University of Genoa (Italy). The experiments were done with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

The original data set can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and it contains the sensor signals (accelerometer and gyroscope) divided in two randomly partitioned sets: the training data and the test data. 

The cleaning process focused only on the mean and standard deviation measurements.

# Transformation applied (from the original data set to tidy data)

The original data set is composed by many files. The following are the ones actualy used to produce the file _tidy_data.txt_:

* _activity_labels.txt_: contains the activities labels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

* _features.txt_: contains all the features labels (e.g.: tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z, ...)

* _test/subject_test.txt_:  each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

* _test/X_test.txt_: Test set.

* _test/y_test.txt_: Test labels.

* _train/subject_train.txt_: each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30

* _train/X_train.txt_: Training set.

* _train/y_train.txt_: Training labels.

Main operation performed:

1. For both test and train first _subject_*.txt_, _Y_*.txt_ and _X_*.txt_ were read 

2. They were given column names based on _features.txt_ file

3. The train and test data set were merged in a single one. 

4. Some columns were removed

5. Some column names were changed

6. A column name were added

## Column removed

The only columns preserved were the ones with mean or standard deviation data. In order to do that all the column containing neither "-mean()" nor "-std()" were eliminated. This entails that even columns containing "-meanFreq()" or "tBodyAccMean" were eliminated since they do not fit with the goal of the cleaning process. More information about the removed columns can be found in the orginal _features_info.txt_ file.

## Column names changed

The column naes were changed to make them more clear and human readable. These were the operation performed:

* When starting with "t" were changed to "Time" (from _features_info.txt_: "prefix 't' to denote time")

* When starting with "f" were changed to "Frequency" (from _features_info.txt_: "Note the 'f' to indicate frequency domain signals")

* Changed "Acc" to "Accelerometer"

* Changed "Gyro" to "Gyroscope"

* Changed "Mag" to "Magnitude" (from _features_info.txt_: "Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, ...))

* Renamed "-mean()" to "Mean"

* Renamed "-std()" to "StandardDeviation"

## Column added

The only column added is named _ActivityLabel_ and contains the activity performed by the subject for this observation (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). It was obtained by combining the activity ID (contained in the _y_*.txt_ file) and the activity labels (contained in the _activity_labels.txt_ file).

# Final Variables

* **SubjectID**: The ID of the subject as in the _subject_test.txt_ file

* **ActivityLabel**: The activity performed by the subject for this observation (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

* **TimeBodyAccelerometerMeanX**: Mean of Time Body Accelerometer for X

* **TimeBodyAccelerometerMeanY**: Mean of Time Body Accelerometer for Y

* **TimeBodyAccelerometerMeanZ**: Mean of Time Body Accelerometer for Z

* **TimeBodyAccelerometerStandardDeviationX**: Standard Deviation of Time Body Accelerometer for X

* **TimeBodyAccelerometerStandardDeviationY**: Standard Deviation of Time Body Accelerometer for Y

* **TimeBodyAccelerometerStandardDeviationZ**: Standard Deviation of Time Body Accelerometer for Z

* **TimeGravityAccelerometerMeanX**: Mean of Time Gravity Accelerometer for X

* **TimeGravityAccelerometerMeanY**: Mean of Time Gravity Accelerometer for Y

* **TimeGravityAccelerometerMeanZ**: Mean of Time Gravity Accelerometer for Z

* **TimeGravityAccelerometerStandardDeviationX**: Standard Deviation of Time Gravity Accelerometer for X

* **TimeGravityAccelerometerStandardDeviationY**: Standard Deviation of Time Gravity Accelerometer for Y

* **TimeGravityAccelerometerStandardDeviationZ**: Standard Deviation of Time Gravity Accelerometer for Z

* **TimeBodyAccelerometerJerkMeanX**: Mean of Time Body Accelerometer Jerk for X

* **TimeBodyAccelerometerJerkMeanY**: Mean of Time Body Accelerometer Jerk for Y

* **TimeBodyAccelerometerJerkMeanZ**: Mean of Time Body Accelerometer Jerk for Z

* **TimeBodyAccelerometerJerkStandardDeviationX**: Standard Deviation of Time Body Accelerometer Jerk for X

* **TimeBodyAccelerometerJerkStandardDeviationY**: Standard Deviation of Time Body Accelerometer Jerk for Y

* **TimeBodyAccelerometerJerkStandardDeviationZ**: Standard Deviation of Time Body Accelerometer Jerk for Z

* **TimeBodyGyroscopeMeanX**: Mean of Time Body Gyroscope for X

* **TimeBodyGyroscopeMeanY**: Mean of Time Body Gyroscope for Y

* **TimeBodyGyroscopeMeanZ**: Mean of Time Body Gyroscope for Z

* **TimeBodyGyroscopeStandardDeviationX**: Standard Deviation of Time Body Gyroscope for X

* **TimeBodyGyroscopeStandardDeviationY**: Standard Deviation of Time Body Gyroscope for Y

* **TimeBodyGyroscopeStandardDeviationZ**: Standard Deviation of Time Body Gyroscope for Z

* **TimeBodyGyroscopeJerkMeanX**: Mean of Time Body Gyroscope Jerk for X

* **TimeBodyGyroscopeJerkMeanY**: Mean of Time Body Gyroscope Jerk for Y

* **TimeBodyGyroscopeJerkMeanZ**: Mean of Time Body Gyroscope Jerk for Z

* **TimeBodyGyroscopeJerkStandardDeviationX**: Standard Deviation of Time Body Gyroscope Jerk for X

* **TimeBodyGyroscopeJerkStandardDeviationY**: Standard Deviation of Time Body Gyroscope Jerk for Y

* **TimeBodyGyroscopeJerkStandardDeviationZ**: Standard Deviation of Time Body Gyroscope Jerk for Z

* **TimeBodyAccelerometerMagnitudeMean**: Mean of Time Body Accelerometer Magnitude 

* **TimeBodyAccelerometerMagnitudeStandardDeviation**: Standard Deviation of Time Body Accelerometer Magnitude 

* **TimeGravityAccelerometerMagnitudeMean**: Mean of Time Gravity Accelerometer Magnitude 

* **TimeGravityAccelerometerMagnitudeStandardDeviation**: Standard Deviation of Time Gravity Accelerometer Magnitude 

* **TimeBodyAccelerometerJerkMagnitudeMean**: Mean of Time Body Accelerometer Jerk Magnitude 

* **TimeBodyAccelerometerJerkMagnitudeStandardDeviation**: Standard Deviation of Time Body Accelerometer Jerk Magnitude 

* **TimeBodyGyroscopeMagnitudeMean**: Mean of Time Body Gyroscope Magnitude 

* **TimeBodyGyroscopeMagnitudeStandardDeviation**: Standard Deviation of Time Body Gyroscope Magnitude 

* **TimeBodyGyroscopeJerkMagnitudeMean**: Mean of Time Body Gyroscope Jerk Magnitude 

* **TimeBodyGyroscopeJerkMagnitudeStandardDeviation**: Standard Deviation of Time Body Gyroscope Jerk Magnitude 

* **FrequencyBodyAccelerometerMeanX**: Mean of Frequency Body Accelerometer for X

* **FrequencyBodyAccelerometerMeanY**: Mean of Frequency Body Accelerometer for Y

* **FrequencyBodyAccelerometerMeanZ**: Mean of Frequency Body Accelerometer for Z

* **FrequencyBodyAccelerometerStandardDeviationX**: Standard Deviation of Frequency Body Accelerometer for X

* **FrequencyBodyAccelerometerStandardDeviationY**: Standard Deviation of Frequency Body Accelerometer for Y

* **FrequencyBodyAccelerometerStandardDeviationZ**: Standard Deviation of Frequency Body Accelerometer for Z

* **FrequencyBodyAccelerometerJerkMeanX**: Mean of Frequency Body Accelerometer Jerk for X

* **FrequencyBodyAccelerometerJerkMeanY**: Mean of Frequency Body Accelerometer Jerk for Y

* **FrequencyBodyAccelerometerJerkMeanZ**: Mean of Frequency Body Accelerometer Jerk for Z

* **FrequencyBodyAccelerometerJerkStandardDeviationX**: Standard Deviation of Frequency Body Accelerometer Jerk for X

* **FrequencyBodyAccelerometerJerkStandardDeviationY**: Standard Deviation of Frequency Body Accelerometer Jerk for Y

* **FrequencyBodyAccelerometerJerkStandardDeviationZ**: Standard Deviation of Frequency Body Accelerometer Jerk for Z

* **FrequencyBodyGyroscopeMeanX**: Mean of Frequency Body Gyroscope for X

* **FrequencyBodyGyroscopeMeanY**: Mean of Frequency Body Gyroscope for Y

* **FrequencyBodyGyroscopeMeanZ**: Mean of Frequency Body Gyroscope for Z

* **FrequencyBodyGyroscopeStandardDeviationX**: Standard Deviation of Frequency Body Gyroscope for X

* **FrequencyBodyGyroscopeStandardDeviationY**: Standard Deviation of Frequency Body Gyroscope for Y

* **FrequencyBodyGyroscopeStandardDeviationZ**: Standard Deviation of Frequency Body Gyroscope for Z

* **FrequencyBodyAccelerometerMagnitudeMean**: Mean of Frequency Body Accelerometer Magnitude 

* **FrequencyBodyAccelerometerMagnitudeStandardDeviation**: Standard Deviation of Frequency Body Accelerometer Magnitude 

* **FrequencyBodyBodyAccelerometerJerkMagnitudeMean**: Mean of Frequency Body Body Accelerometer Jerk Magnitude 

* **FrequencyBodyBodyAccelerometerJerkMagnitudeStandardDeviation**: Standard Deviation of Frequency Body Body Accelerometer Jerk Magnitude 

* **FrequencyBodyBodyGyroscopeMagnitudeMean**: Mean of Frequency Body Body Gyroscope Magnitude 

* **FrequencyBodyBodyGyroscopeMagnitudeStandardDeviation**: Standard Deviation of Frequency Body Body Gyroscope Magnitude 

* **FrequencyBodyBodyGyroscopeJerkMagnitudeMean**: Mean of Frequency Body Body Gyroscope Jerk Magnitude 

* **FrequencyBodyBodyGyroscopeJerkMagnitudeStandardDeviation**: Standard Deviation of Frequency Body Body Gyroscope Jerk Magnitude 
