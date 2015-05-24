library(qdap)

#import training and test data
training = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
training[,562] = read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
training[,563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

testing = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testing[,562] = read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
testing[,563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

#row bind together
mergeData = rbind(training, testing)

#import activity and create column names appropriate for merging later
activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
colnames(activityLabels) <- c("ActivityId","Activity")

#import features, fix column names and only take mean/std columns
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] <- mgsub(c("mean","std","-","(",")"),c("Mean","Std","","",""),features[,2])
impCols <- grep(".*Mean.*|.*Std.*", features[,2])
features <- features[impCols,]
impCols <- c(impCols, 562, 563)

#only take rows that we care about and fix column names
mergeData <- mergeData[,impCols]
colnames(mergeData) <- c(features$V2, "ActivityId", "Subject")

#merge the activityLabels into the main set, fix column names and create factors
mergeData <- merge(mergeData,activityLabels,by = "ActivityId")
colnames(mergeData) <- tolower(colnames(mergeData))
mergeData$activity <- as.factor(mergeData$activity)
mergeData$subject <- as.factor(mergeData$subject)

#tidy data result set
result = aggregate(mergeData, by=list(activity = mergeData$activity, subject=mergeData$subject), mean)

#removed subject and activity columns
result <- result[,c(1:89)]



