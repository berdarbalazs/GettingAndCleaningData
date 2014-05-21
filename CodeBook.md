# Code book

## Working with data
Description of the run_analytics.R script

1. Create data directory if missing
* Download required data: [data for the project](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Unzip data into data directory
* Read features data set into `features` from `features.txt`
* Read train and test data sets from `train/X_train.txt` and `test/X_test.txt`
	* `XTrain` contains the train data
  * `XTest` contains the test data
* Read subjects for train and test data from `train/subject_train.txt`, `test/subject_test.txt`
	* `subjectTrain` contains ids of subjects for train data
  * `subjectTest` contains ids of subjects for test data
* Read `activityLabels` from `activity_labels.txt`
* Read activity values for train and test data from `train/y_train.txt`, `test/y_train.txt`  
	* `YTrain` contains the activity values of trade data
	* `YTest` contains the activity values of test data
* Append  subject and activity columns to train (`dfTrain`) and test data (`dfTest`)
* Create readable header `featuresHeaderList` from `features`
* Add subject and activity to the header
* Merge the test and train data (`mergedDataSet`)
* Add readable header to `mergedDataSet`
* Replace activity values with readable values
* Extract columns what contains means and standard deviations (`extraxtedData`)
* Aggregate by `subject` and `activity`
* Drop the duplicate columns (`subject`, `activity`) from aggregated data frame
* Save the tidy data to `data/humanActivityTidyData.txt` (tab separated file)


## humanActivityTidyData.txt
contains 180 rows + header and 88 columns in a tab separated format.

### Columns 
* activity
* subject
* tbodyaccmeanx
* tbodyaccmeany
* tbodyaccmeanz
* tgravityaccmeanx
* tgravityaccmeany
* tgravityaccmeanz
* tbodyaccjerkmeanx
* tbodyaccjerkmeany
* tbodyaccjerkmeanz
* tbodygyromeanx
* tbodygyromeany
* tbodygyromeanz
* tbodygyrojerkmeanx
* tbodygyrojerkmeany
* tbodygyrojerkmeanz
* tbodyaccmagmean
* tgravityaccmagmean
* tbodyaccjerkmagmean
* tbodygyromagmean
* tbodygyrojerkmagmean
* fbodyaccmeanx
* fbodyaccmeany
* fbodyaccmeanz
* fbodyaccmeanfreqx
* fbodyaccmeanfreqy
* fbodyaccmeanfreqz
* fbodyaccjerkmeanx
* fbodyaccjerkmeany
* fbodyaccjerkmeanz
* fbodyaccjerkmeanfreqx
* fbodyaccjerkmeanfreqy
* fbodyaccjerkmeanfreqz
* fbodygyromeanx
* fbodygyromeany
* fbodygyromeanz
* fbodygyromeanfreqx
* fbodygyromeanfreqy
* fbodygyromeanfreqz
* fbodyaccmagmean
* fbodyaccmagmeanfreq
* fbodybodyaccjerkmagmean
* fbodybodyaccjerkmagmeanfreq
* fbodybodygyromagmean
* fbodybodygyromagmeanfreq
* fbodybodygyrojerkmagmean
* fbodybodygyrojerkmagmeanfreq
* angletbodyaccmean,gravity
* angletbodyaccjerkmean,gravitymean
* angletbodygyromean,gravitymean
* angletbodygyrojerkmean,gravitymean
* anglex,gravitymean
* angley,gravitymean
* anglez,gravitymean
* tbodyaccstdx
* tbodyaccstdy
* tbodyaccstdz
* tgravityaccstdx
* tgravityaccstdy
* tgravityaccstdz
* tbodyaccjerkstdx
* tbodyaccjerkstdy
* tbodyaccjerkstdz
* tbodygyrostdx
* tbodygyrostdy
* tbodygyrostdz
* tbodygyrojerkstdx
* tbodygyrojerkstdy
* tbodygyrojerkstdz
* tbodyaccmagstd
* tgravityaccmagstd
* tbodyaccjerkmagstd
* tbodygyromagstd
* tbodygyrojerkmagstd
* fbodyaccstdx
* fbodyaccstdy
* fbodyaccstdz
* fbodyaccjerkstdx
* fbodyaccjerkstdy
* fbodyaccjerkstdz
* fbodygyrostdx
* fbodygyrostdy
* fbodygyrostdz
* fbodyaccmagstd
* fbodybodyaccjerkmagstd
* fbodybodygyromagstd
* fbodybodygyrojerkmagstd

