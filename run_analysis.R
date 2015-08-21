library(plyr)
#Load training and test datasets
x_train<-read.table("UCI HAR Dataset/train/X_train.txt")
x_test<-read.table("UCI HAR Dataset/test/X_test.txt")
y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
y_test<-read.table("UCI HAR Dataset/test/y_test.txt")

subject_train<-read.table("subject_train.txt")
subject_test<-read.table("subject_test.txt")
activity_lables<-read.table("activity_labels.txt")
features<-read.table("features.txt")

#add training and test measurements
x_complete<-rbind(x_train, x_test)

#add column names
colnames(x_complete)<-c(as.character(features[,2]))

#drop cols without mean or std
keep<-grep("-mean|-std", colnames(x_complete))
x_subset<-x_complete[,c(keep)]

#add training and test subjects
subject_complete<-rbind(subject_train, subject_test)
colnames(subject_complete)<-"subject"

#merge subjects with measurements
tidy_data<-cbind(subject_complete, x_subset)

#add activity labels to data
activity<-rbind(y_train, y_test)
activity<-merge(activity, activity_lables, by=1)[,2]
tidy_data<-cbind(tidy_data, activity)

#create means
td_avg<-ddply(tidy_data, .(subject, activity), colwise(mean))
write.table(td_avg, file="tidy_data.txt", row.names=FALSE)
