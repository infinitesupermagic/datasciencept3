##Background

Course project for Getting and Cleaning data. 


##Explanation

Provided a set of training data and testing data, aggregate them together and extract specific tidy data (mean and std for all variables broken down by subject and activity).

Data must be loaded independently, then cleaned, and merged together.

The script run_analysis.R follows the procedure specified below:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The finished product is a results.txt.

##Script processes

To satisfy the recs the script does the following:

* Import training and test data
* Row bind the 2 sets together
* Import activity and create column names appropriate for merging later
* Import features, fix column names and only take mean/std columns
* Only take rows that we care about and fix column names according to codebook
* Tidy data result set (mean over columns by factors subject and activity)
* Remove extra subject and activity columns that cannot be mean'd 

##Codebook

The codebook is located in codebook.md. It explains the variables used.
