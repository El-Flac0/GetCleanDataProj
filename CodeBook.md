=========================================================================
The data in the tidy_data table is comprised from information from the 
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Provided by:
=========================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Genoa, Italy.

=========================================================================

## DATASET ##

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six activities
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its
embedded accelerometer and gyroscope, we captured 3-axial linear
acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually. The
obtained dataset has been randomly partitioned into two sets, where 70% of
the volunteers was selected for generating the training data and 30% the
test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows of
2.56 sec and 50% overlap (128 readings/window). The sensor acceleration
signal, which has gravitational and body motion components, was separated
using a Butterworth low-pass filter into body acceleration and gravity.

The gravitational force is assumed to have only low frequency components,
therefore a filter with 0.3 Hz cutoff frequency was used. From each window,
a vector of features was obtained by calculating variables from the time
and frequency domain. See 'features_info.txt' for more details.

========================================================================= 

## FEATURES (VARIABLES) ##

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and
  the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The features selected for this database come from the accelerometer and 
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain 
signals (prefix 't' to denote time) were captured at a constant rate of 
50 Hz. Then they were filtered using a median filter and a 3rd order low 
pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and 
gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were 
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and 
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals 
were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, 
tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these 
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to 
indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for 
each pattern:
  
't-' prefix denotes time domain signals
'f-' prefix denotes frequency domain signals
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-X        ---- Body acceleration along the X axis
tBodyAcc-Y        ---- Body acceleration along the Y axis
tBodyAcc-Z        ---- Body acceleration along the Z axis

tGravityAcc-XYZ   ---- Gravity acceleration along the X/Y/Z axis
tBodyAccJerk-XYZ  ---- Linear acceleration in time along X/Y/Z axis
tBodyGyro-XYZ     ---- Angular velocity in time along X/Y/Z axis
tBodyGyroJerk-XYZ ---- Body gyroscope along the X/Y/Z axis

tBodyAccMag       ---- Magnitude of body acceleration in 3 dimensions
tGravityAccMag    ---- Magnitude of gravity acceleration in 3 dimensions
tBodyAccJerkMag   ---- Magnitude of linear acceleration in time in 3 dimensions
tBodyGyroMag      ---- Magnitude of angular velocity in time in 3 dimensions
tBodyGyroJerkMag  ---- Magnitude of body gyroscope in time in 3 dimensions

fBodyAcc-XYZ      ---- FFT of body acceleration along the X/Y/Z axis
fBodyAccJerk-XYZ  ---- FFT of linear acceleration in time along X/Y/Z axis
fBodyGyro-XYZ     ---- FFT of angular velocity in time along X/Y/Z axis

fBodyAccMag       ---- FFT of magnitude of body acceleration in 3 dimensions
fBodyAccJerkMag   ---- FFT of magnitude of linear acceleration in time in 3 dimensions
fBodyGyroMag      ---- FFT of magnitude of angular velocity in time in 3 dimensions
fBodyGyroJerkMag  ---- FFT of magnitude of body gyroscope in time in 3 dimensions


The following variables were provided for each of the features described
above:

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude

============================================================================

## TRANSFORMATIONS ##

# The following data was combined to form the 'test' and 'train' data.tables:

'train/X_train.txt': Training set.
'train/y_train.txt': Training labels.
'test/X_test.txt': Test set.
'test/y_test.txt': Test labels.
'train/subject_train.txt': Identifies the subject who performed the activity
	for each window sample.
	
# Only the following variables were selected for comparison in the tidy data.table:

mean(): Mean value
std(): Standard deviation

# Numeric activity identifiers were replaced with human-readable descriptors
  according to the following schema:
  
1=walking, 2=walking_upstairs, 3=walking_downstairs, 4=sitting, 5=standing, 6=lying.

# The data.table generated from the 'test' and 'train' data.tables was reformed
  into a long form tidy data table using melt
  
# The mean of each variable was calculated and corresponding original data dropped
  from the data. Duplicate data was also dropped.
