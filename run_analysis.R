library(plyr)
library(data.table)

setwd("C:/Users/Samuel.Hui/DS/March13/project")
path <- getwd()

pathtest <- file.path(path,"test")
pathtrain <- file.path(path,"train")

# Obtain testing dataset
xtest<-read.table(file.path(pathtest,"X_test.txt"))
ytest<-read.table(file.path(pathtest,"Y_test.txt"))
subjecttest <- read.table(file.path(pathtest,"subject_test.txt"))

# Obtain training dataset
xtrain<-read.table(file.path(pathtrain,"X_train.txt"))
ytrain<-read.table(file.path(pathtrain,"Y_train.txt"))
subjecttrain <- read.table(file.path(pathtrain,"subject_train.txt"))

# Obtain activity label
label <- read.table(file.path(path,"activity_labels.txt"))
colnames(label) <- c("ID","Activity")

# Obtain features label
features <- read.table(file.path(path,"features.txt"),colClasses=c("character"))

dtSubject <- rbind(subjecttest,subjecttrain)
names(dtSubject) <- "Subject"

dtY <- rbind(ytest,ytrain)
names(dtY) <- "ID"

# Merge data

dtSubject <- cbind(dtSubject,dtY)
dtX <- rbind(xtest,xtrain)
names(dtX) <- features$V2

dt <- cbind(dtSubject,dtX)


#2. Extracts only the measurements on the mean and standard deviation for each measurement.
meanstd <- dt[,grepl("mean\\(\\)|std\\(\\)|Subject|ID", names(dt))]

#3. Uses descriptive activity names to name the activities in the data set
meanstd <- merge(meanstd, label, by = "ID")

#4. Appropriately labels the data set with descriptive names.
names(meanstd) <- gsub("^t","time",names(meanstd))
names(meanstd) <- gsub("^f","frequency",names(meanstd))
names(meanstd) <- gsub("Acc","Accelerometer",names(meanstd))
names(meanstd) <- gsub("Gyro","Gyroscope",names(meanstd))
names(meanstd)<-gsub("Mag", "Magnitude", names(meanstd))
names(meanstd)<-gsub("BodyBody", "Body", names(meanstd))


#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject 
dtFinal<-ddply(meanstd, c("Subject","Activity"), numcolwise(mean))

names(dtFinal)

# Write to table output
write.table(dtFinal, file = "sensor_avg_by_subject.txt", row.name=FALSE)
