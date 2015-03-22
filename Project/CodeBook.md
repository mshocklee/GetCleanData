
==================================================================
Getting and Cleaning Data (class 012)
Course Project
==================================================================

This course project was designed to allow the demonstration of students' abilities to collect, work with, and clean a data set. A data set was provided that was collected from the accelerometers from the Samsung Galaxy S smartphone. Multiple files were included with the data set that provided detailed explanations of the collected data as well as the transformed data from two groups, the test group and the training group.

The following files were included explaining the original data set:
* UCI HAR Dataset/README.txt
* UCI HAR Dataset/activity_labels.txt
* UCI HAR Dataset/features.txt
* UCI HAR Dataset/features_info.txt

The project required a new data set to be created using the transformed data from both the test and training groups, specifically all the mean and standard deviation measurements computed from the raw data. The data recorded was from 30 subjects each having performed 6 activities. These measurements were to be averaged for each activity of each subject and written to a new file which was named:
* tidydata_subject.activity.averages.txt

For both the test and training groups, an X_group file included more than 2000 recordings of 561 computed variables each, a subject_group file included subject IDs for each recording, and a y_group file included numerical activity IDs for each recording that corresponded to 1 of 6 activities in the activity_labels.txt file.

The output file resulting from this project included 180 rows of data in the new data set. These 180 rows were sorted by subject ID, 1 through 30, and secondarily sorted by 6 activities, being:
*WALKING
*WALKING_UPSTAIRS
*WALKING_DOWNSTAIRS
*SITTING
*STANDING
*LAYING
Each of the 6 activities for each subject included 79 variables. These variables were computed as the average of the original multiple measurements for each activity/subject combination.

The new data set produced through this project used only the mean and standard deviation recordings from the X_group files resulting in the 79 columns of computed measurements instead of the original 561. These columns were labeled the same as the original data set and an explanation of the variables can be found in the features_info.txt file. Some students may have come up with more than 79 measurements, but this rendition of the project did not include any mean or standard deviation data used in an angle() function as seen at the end of the features.txt file. A new file was created, tidyfeatures.txt, that lists all columns in the new tidy data set.