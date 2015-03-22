
# Analysis Description

The code file that produces the required data set and the corresponding text file are named:
* __run_analysis.txt__
* __tidydata_subject.activity.averages.txt__

The code file includes many comments explaining the code, but a brief description follows:

1. The activity_labels.txt and features.txt files are first read in as the data frames *actLabels* and *features*, their columns labelled and column classes set appropriately. The *features* data frame is parsed and set to only include the 79 mean and standard deviation features (excluding angle measurements).
2. The test data is read in to the new data frame *test*, through a few steps.
	1. The subject_test.txt file is read in, creating the first column labelled *subjectID* in the *test* data frame.
	2. The y_test.txt file is read in and parsed, replacing the numerical activity values with the corresponding activity labels included in the *actLabels* data frame. The activity data is then bound as a column to the *test* data frame.
	3. The X_test.txt file is then read in, keeping only the columns corresponding to the column indexes saved in the *features* data frame. The columns are renamed corresponding to the feature names in the *features* data frame, and the columns are bound to the *test* data frame.
3. The training data is read in following the same procedures as the test data, but saved in another data frame named *train*.
4. The two data frames *test* and *train* are then bound by rows into the new data frame *dat* and ordered by subjectID followed by activities.
5. *dat* is then sent through two loops that go through each subjectID and corresponding activity, averaging all data and adding a new row for each of the 180 subjectID/activity combinations to the new data frame *tidydat*.
6. The final *tidydat* data frame is written to the text data file mentioned above without row names.
7. The final line of code clears all variables from memory.


The file **CodeBook.md** includes information on how the original data set was used to create the new data set as well as explanations of the *tidydata* variables listed in **tidyfeatures.txt**.