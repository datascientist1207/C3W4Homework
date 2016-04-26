#Reading in the data
SamsungTestDataSet <- read.table("./test/X_test.txt",  header=FALSE)
SamsungTestActivity <- read.table("./test/y_test.txt", header=FALSE)
SamsungTrainDataSet <- read.table("./train/X_train.txt",  header=FALSE)
SamsungTrainActivity <- read.table("./train/y_train.txt", header=FALSE)
SamsungTrainUsers <- read.table("./train/subject_train.txt",  header=FALSE)
SamsungTestUsers <- read.table("./test/subject_test.txt", header=FALSE)
SamsungFeatureNames <- read.table("./features.txt", header=FALSE)

#Combining Train and test together
SamsungCombinedActivity<-rbind(SamsungTrainActivity,SamsungTestActivity)
SamsungCombinedDataSet<-rbind(SamsungTrainDataSet,SamsungTestDataSet)
names(SamsungCombinedDataSet)<-SamsungFeatureNames$V2
SamsungCombinedUsers<-rbind(SamsungTrainUsers,SamsungTestUsers)

#Combining all the data together and labelling it
SamsungCombinedDataFrame <- data.frame(SamsungCombinedActivity,SamsungCombinedUsers,SamsungCombinedDataSet)
colnames(SamsungCombinedDataFrame)[1] <- "Activity"
colnames(SamsungCombinedDataFrame)[2] <- "Subject_ID"
SamsungCombinedDataFrame$Activity<-factor(SamsungCombinedDataFrame$Activity, labels = c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying") )

#Filtering out all columns that isn't the Activity Subject_ID or mean or std
SamsungFilteredDataFrame <- SamsungCombinedDataFrame[ , grepl("Activity|Subject_ID|mean|std", names(SamsungCombinedDataFrame))]

#summarizing the mean for each activity and subject
SamsungDatabyActivity <-  summarize_each(group_by(SamsungFilteredDataFrame,Activity,Subject_ID),funs(mean))
write.table(SamsungDatabyActivity, file="./tidy-data-output.txt", append=FALSE, row.names=FALSE)

