library(dplyr)

# load in all necessary files 
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

# merge files into one dataframe

#turn 2nd features column into vector then make applicable names
name_vec <- as.vector(features[,'V2'])
names <- make.names(name_vec, unique = TRUE)

#create the dataset   !NOTE, THE DATA IS INPUTTED TRAIN FIRST THEN TEST FOR ALL
data <- X_train
colnames(data) <- names
colnames(X_test) <- names
data <- rbind(data, X_test) #data is now combination of X_train and X_test

# create subject data, train first then test
subjectData <- rbind(subject_train, subject_test)
colnames(subjectData) <- "Subject"

#create activity data, train first then test
activityData <- rbind(y_train, y_test)
colnames(activityData) <- "Activity"

#append both to the dataset
data <- cbind(data, subjectData)
data <- cbind(data, activityData)

# extracting measurements on standard deviation and mean and create new dataset
meanNames <- grep("mean.", names, value = TRUE, fixed = TRUE)
stdNames <- grep("std.", names, value = TRUE, fixed = TRUE)
bothNames <- c(meanNames, stdNames)
meanStdData <- data[bothNames]
#add on the activity and subject columns again
meanStdData <- cbind(meanStdData, subjectData)
meanStdData <- cbind(meanStdData, activityData)

#name activities in the dataset
meanStdData$Activity[meanStdData$Activity==1] <- "Walking"
meanStdData$Activity[meanStdData$Activity==2] <- "Walking_Upstairs"
meanStdData$Activity[meanStdData$Activity==3] <- "Walking_Downstairs"
meanStdData$Activity[meanStdData$Activity==4] <- "Sitting"
meanStdData$Activity[meanStdData$Activity==5] <- "Standing"
meanStdData$Activity[meanStdData$Activity==6] <- "Laying"

#group by subject and activity
#groups <- group_by(meanStdData, Subject, Activity) MAYBE DONT NEED THIS
aggdata <- aggregate(meanStdData, by=list(meanStdData$Subject,meanStdData$Activity), FUN=mean)

#create the tity dataset
write.table(aggdata, file = "tidyData.txt", row.name = FALSE)







