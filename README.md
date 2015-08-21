# Tidy-data-course-project
Tidy data course project
Script to merge and summarize the Samsung Galaxy Accelerometer data. Assumes the data files are in a folder "UCI HAR Dataset" in the working directory. Requires the "plyr" library.

In summary, the script:

Merges the training and the test sets to create one data set.

Extracts only the measurements on the mean and standard deviation for each measurement.

Uses descriptive activity names to name the activities in the data set

Appropriately labels the data set with descriptive variable names.

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
