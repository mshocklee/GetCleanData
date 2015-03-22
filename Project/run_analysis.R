##	features.txt
##		33 hits for std
##		46 hits for mean (-angles)
##		translates to 79 columns of measurements
##	activity_labels.txt
##		lists activity names for y_test/train.txt
##	subject_test/train.txt
##	~	 1 column of subject IDs
##	X_test/train.txt
##	~	79 columns of measurements
##	Y_test/train.txt
##	~	 1 column of activity IDs


#	activity_labels
#		Read in activity labels to use with y_test/train.txt
actLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(actLabels)[1] <- "numID"
names(actLabels)[2] <- "activity"
actLabels$activity <- as.character(actLabels$activity)

#	features
#		Read in feature list, selecting only mean and standard deviation features
#		(minus the angle features)
features <- read.table("UCI HAR Dataset/features.txt")
names(features)[1] <- "colNum"
names(features)[2] <- "ftNames"
features$ftNames <- as.character(features$ftNames)
features <- features[grep("*mean\\(\\)*|*meanFreq\\(\\)*|*std\\(\\)*",features$ftNames),]


##	TEST DATA
#	read in first file
test <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(test)[1] <- "subjectID"	#rename column

#	read in second file and replace integers with activities
temp <- read.table("UCI HAR Dataset/test/y_test.txt")
for(i in 1:6) {
    temp[temp$V1 == i,] <- actLabels$activity[actLabels$numID == i]
}
#	bind activities to data frame
test <- cbind(test, temp)
names(test)[2] <- "activity"	#rename column

#	read in third file
temp <- read.table("UCI HAR Dataset/test/X_test.txt")
ind <- features[,1]	#set variable for column index
temp <- temp[,ind]	#select only mean and std columns from test data
names(temp) <- features$ftNames	#rename columns

#	bind measurements to data frame
test <- cbind(test,temp)


##	TRAIN DATA
#	read in first file
train <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(train)[1] <- "subjectID"	#rename column

#	read in second file and replace integers with activities
temp <- read.table("UCI HAR Dataset/train/y_train.txt")
for(i in 1:6) {
    temp[temp$V1 == i,] <- actLabels$activity[actLabels$numID == i]
}
#	bind activities to data frame
train <- cbind(train, temp)
names(train)[2] <- "activity"	#rename column

#	read in third file
temp <- read.table("UCI HAR Dataset/train/X_train.txt")
temp <- temp[,ind]	#select only mean and std columns from test data
names(temp) <- features$ftNames	#rename columns

#	bind measurements to data frame
train <- cbind(train,temp)


##	Bind test and train data frames together
dat <- rbind(test, train)
dat <- dat[with(dat, order(subjectID, activity)), ]	#sort by subject and activity
row.names(dat) <- NULL	#reset row names

##	Tidy data set creation - Subject/Activity/Average of Variables
for(i in 1:30) {	#30 subjects numbered 1 to 30
	for(j in actLabels$activity) {
		temp <- do.call(cbind, list(unique(dat[dat$subjectID == i & dat$activity == j,1:2]),
									as.list(apply(dat[dat$subjectID == i & dat$activity == j,-(1:2)],2,mean))
									))
		if(!exists("tidydat")){
			tidydat <<- temp
		} else {
			tidydat <<- rbind(tidydat,temp)
		}
	}
}
row.names(tidydat) <- NULL	#reset row names

##	Write tidy data to text file
write.table(tidydat, file = "tidydata_subject.activity.averages.txt", row.names=FALSE)

##	Remove variables from global environment to free memory
#	Comment out if variables need to be analysed after run time
rm(list=ls())