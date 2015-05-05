run_analysis.R README

## Summary

The run_analysis.R script can be broken down into 'X' constituent parts:

1. Initialize required R packages.
2. Read in information from .txt files to objects.
3. Bind objects to create 'test' and 'train' data.frame.
4. Select only variables relating to mean results or stdev.
5. Combine 'test' and 'train' to create a single data.frame.
6. Rename activity_id variables.
7. Create new 'long' tidy data
8. Compute Mean of values by subject and activity.
9. Write to .txt file

## Details

# 1. Initialize required R packages

run_analysis. R requires the installation of the 'dplyr' and 'reshape2' packages to assit 
data manipulation and switching between wide and long data.tables

# 2. Read in information from .txt files to objects

The first object read in is 'colNames' from the features.txt file. Subsequently, the x-test.txt,
y-test.txt, and subject-test.txt files are read in to the objects 'x_test', 'y_test' 
and 'subject_test' with colNames passed as an argument to the read.table() function to label 
the variables in 'x-test'. The x-train.txt, y-train.txt, and subject-train.txt files are 
read in via read.table() with identical arguments to create 'x_train', 'y_train' and 
'subject_train'

# 3. Bind objects to create 'test' and 'train' data.frame.

'x_test', 'y_test' and 'subject_test' are combined via cbind() to create the 'test'
data.frame. 'x_train', 'y_train' and 'subject_train' are combined via cbind() to create 
the 'train' data.frame.

# 4. Select only Mean or StDev variables

Variables containing mean or standard deviation (StDev) are extracted from the test and 
train data.frames using select() from the dplyr package and saved into new test and train
data.frames.

# 5. Combine test and train to a single Data.Frame

The test and train are combined into a single data.frame using rbind()

# 6. Rename activity variables

The activity variable is changed from a numeric value into character variable indicating
the activity in question using gsub() according to: 1=walking, 2=walking_upstairs,
3=walking_downstairs, 4=sitting, 5=standing, 6=lying.

# 7. Create new long tidy data

The combined data.frame is then turned into a long tidy data set with id variables of
subject_id, and activity. A column labelled 'feature' is created containing all the
variables with an adjacent column containing the values for each variable.

# 8. Compute mean of values by subject and activity

The data.table is grouped by subject_id and activity using group_by(), and then the
transmute() calculates the mean for each variable, dropping the original values from the
data.table in the process. The duplicated() function then drops all duplicated rows from
the data, ensuring that the data.table is now tidy data containing means of each variable, 
by subject, and activity.

# 9. write to .txt file

The  tidy data.table is then written to a text file in the corresponding directory.
