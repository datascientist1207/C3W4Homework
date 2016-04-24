SamsungTestDataSet <- read.table(".X_test.txt",  header=FALSE)
SamsungTestActivity <- read.table("./y_test.txt", header=FALSE)
SamsungTrainDataSet <- read.table("./X_train.txt",  header=FALSE)
SamsungTrainActivity <- read.table("./y_train.txt", header=FALSE)
SamsungTrainUsers <- read.table("./subject_train.txt",  header=FALSE)
SamsungTestUsers <- read.table("./subject_test.txt", header=FALSE)



SamsungCombinedActivity<-c(SamsungTrainActivityFactor,SamsungTestActivityFactor)
SamsungCombinedDataSet<-rbind(SamsungTrainDataSet,SamsungTestDataSet)
SamsungCombinedUsers<-rbind(SamsungTrainUsers,SamsungTestUsers)


SamsungCombinedDataFrame <- data.frame(SamsungCombinedActivity,SamsungCombinedUsers,SamsungCombinedDataSet)
colnames(SamsungCombinedDataFrame)[1] <- "Activity"
colnames(SamsungCombinedDataFrame)[2] <- "Subject_ID"

SamsungCombinedDataFrame$Activity<-factor(SamsungCombinedDataFrame$Activity, labels = c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying") )
ExtractionRequestedinStepTwo <- summarize_each(group_by(SamsungCombinedDataFrame,Activity),funs(mean,sd))
SamsungDatabyActivity <-  summarize_each(group_by(SamsungCombinedDataFrame,Activity,Subject_ID),funs(mean,sd))


SamsungDatabyActivity
write.table(SamsungDatabyActivity, file = "./tidy-data-output.txt", row.name=FALSE)
