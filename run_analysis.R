# ----------------------------------------------------------
# SET "TRAIN" DATA FRAME 
# ----------------------------------------------------------

# Set the work directory

# Read "y_train.txt" and assign it to an R objetc

y.train <- read.table ("./UCI HAR Dataset/train/y_train.txt")


# Convert "y_train.txt" integers file to strings (labels of the activities)

activ.labs.train <- ifelse(y.train==1, "WALKING", ifelse(y.train==2,"WALKING_UPSTAIRS", ifelse(y.train==3,"WALKING_DOWNSTAIRS", ifelse(y.train==4,"SITTING", ifelse(y.train==5,"STANDING", ifelse(y.train==6,"LAYING",0))))))


# Check the result

head(activ.labs.train)
tail(activ.labs.train)
dim(activ.labs.train)


# Read "X_train.txt" and assign it to an R objetc

dat.train <- read.table ("./UCI HAR Dataset/train/X_train.txt")


# Join "activ.labs.train" and "dat.train" tables

dat.labs.train <- cbind(activ.labs.train, dat.train)


# Check the result

head(dat.labs.train, n=3)
tail(dat.labs.train, n=3)
dim(dat.labs.train, n=3)


#Read "subject_train.txt" and assign it to an R objetc
subject.train <- read.table ("./UCI HAR Dataset/train/subject_train.txt")


#Join "subject.train" and "dat.labs.train" data frames

dat.train.final <- cbind(subject.train, dat.labs.train)


# Check the result

head(dat.train.final, n=3)
tail(dat.train.final, n=3)
dim(dat.train.final)


# ----------------------------------------------------------
# SET "TEST" DATA FRAME 
# ----------------------------------------------------------

# Read "y_test.txt" file and assign to an R objetc

y.test <- read.table ("./UCI HAR Dataset/test/y_test.txt")


# Convert "y_test.txt" integers file to strings (labels of the activities)

activ.labs.test <- ifelse(y.test==1, "WALKING", ifelse(y.test==2,"WALKING_UPSTAIRS", ifelse(y.test==3,"WALKING_DOWNSTAIRS", ifelse(y.test==4,"SITTING", ifelse(y.test==5,"STANDING", ifelse(y.test==6,"LAYING",0))))))


# Check the result

head(activ.labs.test)
tail(activ.labs.test)
dim(activ.labs.test)


# Read "X_test.txt" and assign it to an R objetc

dat.test <- read.table ("./UCI HAR Dataset/test/X_test.txt")


# Join "activ.labs.test" and "dat.test" tables
dat.labs.test <- cbind(activ.labs.test, dat.test)

# Check the result

head(dat.labs.test, n=3)
tail(dat.labs.test, n=3)
dim(dat.labs.test)


#Read "subject_test.txt" and assign it to an R objetc

subject.test <- read.table ("./UCI HAR Dataset/test/subject_test.txt")


#Join "subject.test" and "dat.labs.test" data frames

dat.test.final <- cbind(subject.test, dat.labs.test)


# Check the result

head(dat.test.final, n=3)
tail(dat.test.final, n=3)
dim(dat.test.final)


# ----------------------------------------------------------
# JOIN "TRAIN" AND "TEST" DATA FRAMES
# ----------------------------------------------------------

# Join "dat.train.final" and "dat.test.final" data frames

dat.traintest <- rbind(dat.train.final, dat.test.final)


# Check the result

head(dat.traintest, n=3)
tail(dat.traintest, n=3)
dim(dat.traintest)


# ----------------------------------------------------------
# SET VARIABLES LABELS OF DATA FRAME
# ----------------------------------------------------------

# Read "features.txt" and assign it to an R objetc 

var.labels.1 <- read.table ("./UCI HAR Dataset/features.txt")
var.labels.2 <- as.character(var.labels.1[,2])


# Transpose vertical to horizontal .....

var.labels.3 <- t(var.labels.2)

# Add labels "Subject" and "Activity" to the first two variables
# of the data frame with all values

var.labels.all <- c("Subject", "Activity", var.labels.3)


# Append variable names to "dat.traintest" data frame

names(dat.traintest) <- var.labels.all


# Check the result

head(dat.traintest, n=3)
tail(dat.traintest, n=3)
dim(dat.traintest)

# ----------------------------------------------------------
# SUBSET "MEAN" AND "STD" VARIABLES
# ----------------------------------------------------------

# Create a vector with the column numbers of the
# desired variables (those with "mean" or "std" in label)

var.labels.select <- grep("mean|std", var.labels.all)


# Subset "dat.traintest" selecting the desired columns

dat.final_1 <- dat.traintest[,c(1,2,var.labels.select)]

# Check the result
head(dat.final_1)
tail(dat.final_1)
dim(dat.final_1)


# ----------------------------------------------------------
# CHANGE NAMES OF COLUMNS
# ----------------------------------------------------------

colnames(dat.final_1) <- c("Subject","Activity","tBodyAcc.mean.X","tBodyAcc.mean.Y","tBodyAcc.mean.Z","tBodyAcc.std.X","tBodyAcc.std.Y","tBodyAcc.std.Z","tGravityAcc.mean.X","tGravityAcc.mean.Y","tGravityAcc.mean.Z","tGravityAcc.std.X","tGravityAcc.std.Y","tGravityAcc.std.Z","tBodyAccJerk.mean.X","tBodyAccJerk.mean.Y","tBodyAccJerk.mean.Z","tBodyAccJerk.std.X","tBodyAccJerk.std.Y","tBodyAccJerk.std.Z","tBodyGyro.mean.X","tBodyGyro.mean.Y","tBodyGyro.mean.Z","tBodyGyro.std.X","tBodyGyro.std.Y","tBodyGyro.std.Z","tBodyGyroJerk.mean.X","tBodyGyroJerk.mean.Y","tBodyGyroJerk.mean.Z","tBodyGyroJerk.std.X","tBodyGyroJerk.std.Y","tBodyGyroJerk.std.Z","tBodyAccMag.mean","tBodyAccMag.std","tGravityAccMag.mean","tGravityAccMag.std","tBodyAccJerkMag.mean","tBodyAccJerkMag.std","tBodyGyroMag.mean","tBodyGyroMag.std","tBodyGyroJerkMag.mean","tBodyGyroJerkMag.std","fBodyAcc.mean.X","fBodyAcc.mean.Y","fBodyAcc.mean.Z","fBodyAcc.std.X","fBodyAcc.std.Y","fBodyAcc.std.Z","fBodyAcc.meanFreq.X","fBodyAcc.meanFreq.Y","fBodyAcc.meanFreq.Z","fBodyAccJerk.mean.X","fBodyAccJerk.mean.Y","fBodyAccJerk.mean.Z","fBodyAccJerk.std.X","fBodyAccJerk.std.Y","fBodyAccJerk.std.Z","fBodyAccJerk.meanFreq.X","fBodyAccJerk.meanFreq.Y","fBodyAccJerk.meanFreq.Z","fBodyGyro.mean.X","fBodyGyro.mean.Y","fBodyGyro.mean.Z","fBodyGyro.std.X","fBodyGyro.std.Y","fBodyGyro.std.Z","fBodyGyro.meanFreq.X","fBodyGyro.meanFreq.Y","fBodyGyro.meanFreq.Z","fBodyAccMag.mean","fBodyAccMag.std","fBodyAccMag.meanFreq","fBodyBodyAccJerkMag.mean","fBodyBodyAccJerkMag.std","fBodyBodyAccJerkMag.meanFreq","fBodyBodyGyroMag.mean","fBodyBodyGyroMag.std","fBodyBodyGyroMag.meanFreq","fBodyBodyGyroJerkMag.mean","fBodyBodyGyroJerkMag.std","fBodyBodyGyroJerkMag.meanFreq"
)

# Check the result
head(dat.final_1)
