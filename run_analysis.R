
# Create directory if missing -- this will be used as a sub working directory
if(!file.exists("data")){
  dir.create("data")
}

# download and extract the file if missing
if(!file.exists("data/UCI HAR Dataset")){
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  zipFile<-"./data/getdata_projectfiles_UCI HAR Dataset.zip"
  download.file(fileUrl, destfile=zipFile)
  
  # extract data
  unzip(zipFile,exdir="./data")
}

# read the necessary data to merge and clean later
features<-read.table("data/UCI HAR Dataset/features.txt")

XTrain<-read.table("data/UCI HAR Dataset/train/X_train.txt")
XTest<-read.table("data/UCI HAR Dataset/test/X_test.txt")

# Subject
subjectTrain<-read.table("data/UCI HAR Dataset/train/subject_train.txt")
subjectTest<-read.table("data/UCI HAR Dataset/test/subject_test.txt")

# Activity
activityLabes<-read.table("data/UCI HAR Dataset/activity_labels.txt")

YTrain<-read.table("data/UCI HAR Dataset/train/y_train.txt")
YTest<-read.table("data/UCI HAR Dataset/test/y_test.txt")


#---------- Merge --------
dfTrain<-cbind(XTrain,subjectTrain, YTrain)
dfTest<-cbind(XTest,subjectTest, YTest)

# Create readable header ---> remove "-" and "("  ")" characters and convert the value lowercase
featuresHeaderList<-tolower(gsub("[\\(\\)-]","",as.list(as.character(features$V2))))
# add subject and activity to the header
header<-c(featuresHeaderList,"subject","activity")

# merge the test and train data
mergedDataSet<-rbind(dfTrain,dfTest)

# Set header
names(mergedDataSet)<-header

# replace numbers with descriptive values
mergedDataSet$activity<-activityLabes[mergedDataSet$activity,2]

# get the column names what contain mean or standard deviation
dataMeanAndStd<-c(grep("mean", featuresHeaderList, ignore.case=TRUE , value=TRUE),grep("std", featuresHeaderList, ignore.case=TRUE , value=TRUE), "subject", "activity") 

extraxtedData<-mergedDataSet[dataMeanAndStd]

# aggregate the result
ag<-aggregate(x=extraxtedData, by=list(activity=extraxtedData$activity,subject=extraxtedData$subject), mean)

# drop the duplicate columns (subject, activity)
tidy<-ag[,1:88]

# save the tidy data
write.table(tidy,file="data/humanActivityTidyData.txt",sep="\t", row.names=FALSE)
