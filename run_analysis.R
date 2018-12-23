##
# Johns Hopkins University - Getting and Cleaning Data course
#                Peer-graded Assignment
#
# For more information please check 
#   https://github.com/mattbrepo/jhu_gcd_assignment
#
library(reshape2)

TEST_FAST = FALSE # handy to test the code without keep on downloading and 
                  # unzipping the original data set.

## ------------------------------------------------------------------
## Function that reads the original data set
## ------------------------------------------------------------------
read_data_set <- function(raw_folder, sub_folder, data_col_names) {
  # Read subject IDs
  subject_filename = file.path(raw_folder, sub_folder, 
                               paste("subject_", sub_folder, ".txt", sep = ""))
  subjects <- read.table(subject_filename, sep = "" , header = FALSE)

  # Read subject activities
  y_filename = file.path(raw_folder, sub_folder, 
                         paste("y_", sub_folder, ".txt", sep = ""))
  ys <- read.table(y_filename, sep = "" , header = FALSE)
  
  # Read Samsung data
  x_filename = file.path(raw_folder, sub_folder, 
                         paste("X_", sub_folder, ".txt", sep = ""))
  xs <- read.table(x_filename, sep = "" , header = FALSE)
  
  # Put the columns together
  data <- cbind(subjects, ys, xs)
  
  # Assign column names
  names(data) <- data_col_names
  
  data
}

## ------------------------------------------------------------------
## Init 
## ------------------------------------------------------------------

# data set origin
zip_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# local data set zip file
zip_file <- "getdata_projectfiles_UCI HAR Dataset.zip"
# local data set folder (automatically crated by unzipping the zip file)
raw_data_folder <- "UCI HAR Dataset"
# final tidy data set file path
tidy_data_path <- "tidy_data.txt"

if (!TEST_FAST) {
  # delete the zip file if is already present
  if (file.exists((zip_file))) {
    file.remove(zip_file)
  }

  # remove folder containing the original data set
  if (dir.exists(raw_data_folder)) {
    unlink(raw_data_folder, recursive = TRUE)
  }

  ## ------------------------------------------------------------------
  ## Download and unzip data set 
  ## ------------------------------------------------------------------

  download.file(zip_url, zip_file)
  unzip(zip_file)
}

# This folder should be created by unzipping the file
if (!dir.exists(raw_data_folder)) {
  stop("input folder does not exist!")
}

## ------------------------------------------------------------------
## Prepare table column names
## ------------------------------------------------------------------

# Read the column names from features.txt
features_filename = file.path(raw_data_folder, "features.txt")
features <- read.table(features_filename, sep = "" , header = FALSE)
features_names <- as.vector(t(features[2]))

# Compose data_col_names
data_col_names <- c(c("SubjectID", "ActivityID"), features_names)

## ------------------------------------------------------------------
## Prepare activity labels
## ------------------------------------------------------------------

# Read the activity labels from activity_labels.txt
activity_labels_filename = file.path(raw_data_folder, "activity_labels.txt")
activity_labels <- read.table(activity_labels_filename, sep = "", 
                              header = FALSE)
activity_labels <- as.vector(t(activity_labels[2]))

## ------------------------------------------------------------------
## Read test and train data set 
## ------------------------------------------------------------------

ds_test <- read_data_set(raw_data_folder, "test", data_col_names)
ds_train <- read_data_set(raw_data_folder, "train", data_col_names)

## ------------------------------------------------------------------
## Tidy up 
## ------------------------------------------------------------------

# 1. Merges the training and the test sets to create one data set.
ds <- rbind(ds_test, ds_train)

# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement.
ds <- ds[ , grepl("SubjectID|ActivityID|-mean\\(\\)|-std\\(\\)", names(ds))]

# 3. Uses descriptive activity names to name the activities in the data set
ds$ActivityLabel <- activity_labels[ds$ActivityID]
ds$ActivityID <- NULL # ActivityID is not necessary anymore

# 4. Appropriately labels the data set with descriptive variable names.
ds_names <- names(ds)

# The quotes are from the features_info.txt 
ds_names <- sub("^t", "Time", ds_names) # "prefix 't' to denote time"
ds_names <- sub("^f", "Frequency", ds_names) # "the 'f' to indicate frequency 
                                             # domain signals" 
ds_names <- sub("Acc", "Accelerometer", ds_names) # " ... come from the 
ds_names <- sub("Gyro", "Gyroscope", ds_names)    # accelerometer and gyroscope
                                                  # 3-axial raw signals 
                                                  # tAcc-XYZ and tGyro-XYZ"

ds_names <- sub("Mag", "Magnitude", ds_names) # "Also the magnitude of these 
                                              # three-dimensional signals were 
                                              # calculated using the Euclidean 
                                              # norm (tBodyAccMag, ...)

ds_names <- sub("-mean\\(\\)(-)?", "Mean", ds_names) # "mean(): Mean value"
ds_names <- sub("-std\\(\\)(-)?", "StandardDeviation", ds_names) # "std(): Standard deviation"

names(ds) <- ds_names

# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.
ds_melted <- melt(ds, id = c("SubjectID", "ActivityLabel"))
tidyData <- dcast(ds_melted, SubjectID + ActivityLabel ~ variable, mean)

# Write the tidy data
write.table(tidyData, tidy_data_path, row.names = FALSE)