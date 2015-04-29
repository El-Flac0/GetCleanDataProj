setwd("~/Desktop/UCI HAR Dataset")
require(dplyr) ## initialize 'dplyr' package for data manipulation.
require(reshape2) ## initialize 'reshape2' package to switch between 'wide' and 'long' data tables.

## read in vector of column names
colNames <- read.table("~/Desktop/UCI HAR Dataset/features.txt")
colNames <- lapply(colNames, as.character)
## read test tables into R
x_test <- read.table("~/Desktop/UCI HAR Dataset/test/x_test.txt", quote=" ", col.names = colNames$V2)
y_test <- read.table("~/Desktop/UCI HAR Dataset/test/y_test.txt", quote=" ", col.names = "activity")
subject_test <- read.table("~/Desktop/UCI HAR Dataset/test/subject_test.txt", quote=" ", col.names = "subject_id")
## read train tables into R
x_train <- read.table("~/Desktop/UCI HAR Dataset/train/x_train.txt", quote=" ", col.names = colNames$V2)
y_train <- read.table("~/Desktop/UCI HAR Dataset/train/y_train.txt", quote=" ", col.names = "activity")
subject_train <- read.table("~/Desktop/UCI HAR Dataset/train/subject_train.txt", quote=" ", col.names = "subject_id")

## test data ##
## select variables involving 'mean' and 'stdev'
x_test_mean <- select(x_test, contains("mean"))
x_test_std <-select(x_test, contains("std"))

## re-make x_train with subject and activity id and arrange columns
x_test1 <- cbind(x_test_mean, x_test_std)
test_data <- cbind(subject_test, y_test, x_test1)

## train data ##
## select variables involving 'mean' and 'stdev'
x_train_mean <- select(x_train, contains("mean"))
x_train_std <-select(x_train, contains("std"))

## re-make x_train and arranging columns
x_train1 <- cbind(x_train_mean, x_train_std)
train_data <- cbind(subject_train, y_train, x_train1)

## combine 'test' and 'train' into single dataset
data <- rbind(train_data, test_data)

## rename activity ids
data$activity <- gsub(1, "walking", data$activity)
data$activity <- gsub(2, "walking_upstairs", data$activity)
data$activity <- gsub(3, "walking_downstairs", data$activity)
data$activity <- gsub(4, "sitting", data$activity)
data$activity <- gsub(5, "standing", data$activity)
data$activity <- gsub(6, "lying", data$activity)

## re-order 'data'
data[,order(names(data))]

## Create new 'tidy' dataset using 'melt'
tidy_data <- melt(data, id.vars=c("subject_id", "activity"), variable.name = "feature")

## compute mean of each feature by subject and activity
tidy_data <- tidy_data %>%
  group_by(subject_id, activity, feature) %>%
  transmute(mean = mean(value)) ## computes mean and drops original values

## Removes duplicte rows from data table
tidy_data <- tidy_data[!duplicated(tidy_data),]

## Arranges data frame by subject_id, then activity, presenting table as.. 
## ..mean value for each feature by activity and subject
tidy_data <- arrange(tidy_data1, subject_id)
head(tidy_data, 30) ## quick check data looks as it should

## Write tidy data table to .txt file
write.table(tidy_data, file="tidy_data.txt", row.names=FALSE)

## All done! End of program.