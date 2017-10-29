# Human Activity Recognition Using Smartphones _Tidy_ Data Set Code Book

## About the data

This is a unifyed and tidy version of the [Human Activity Recognition Using Smartphones Experiment](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) database, that was origininally composed by four main datasets; the label of the activity (1) and measures on that activiy (2) splited in a training set (3) and a test set (4). The tidy dataset only contains the variables with the mean and standard deviation of each measure.

Taken form the authors (Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto):

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."


## Description of the variables

There are 68 variables:

**subjectid**: Numeric (integer), ranging from 1 to 30. Represent the id of the person that partipated in the experiment.

**actname**: Character, 6 levels: walking, walking_upstairs, walking_downstairs, sitting, standing and laying. Represent the activities each person performed in the experiment.

**[time|freq]-bodyacc-[mean|std]-[x|y|z]**: Numeric (float). Standarized mean/estandar deviation of the body signal acceleration, measured in time/frequency decomposed in the axis x/y/z. Measures taken from the accelerometer.

**[time|freq]-gravityacc-[mean|std]-[x|y|z]**: Numeric (float). Standarized mean/estandar deviation of the gravity signal acceleration, measured in time/frequency decomposed in the axis x/y/z. Measures taken from the accelerometer.

**[time|freq]-bodyaccjerk-[mean|std]-[x|y|z]**: Numeric (float). Standarized mean/estandar deviation of the body signal jerk acceleration, measured in time/frequency decomposed in the axis x/y/z. Measures taken from the accelerometer.

**[time|freq]-bodygyro-[mean|std]-[x|y|z]**: Numeric (float). Standarized mean/estandar deviation of the body signal acceleration, measured in time/frequency decomposed in the axis x/y/z. Measures taken from the gyroscope.

**[time|freq]-bodygyrojerk-[mean|std]-[x|y|z]**: Numeric (float). Standarized mean/estandar deviation of the body signal jerk acceleration, measured in time/frequency decomposed in the axis x/y/z. Measures taken from the gyroscope.

**[time|freq]-bodyaccmag-[mean|std]**: Numeric (float). Standarized mean/estandar deviation of the body signal acceleration magnitude, measured in time/frequency. Measures taken from the accelerometer.

**[time|freq]-gravityaccmag-[mean|std]**: Numeric (float). Standarized mean/estandar deviation of the body signal gravity magnitude, measured in time/frequency. Measures taken from the accelerometer.

**[time|freq]-bodyaccjerkmag-[mean|std]**: Numeric (float). Standarized mean/estandar deviation of the body signal jerk acceleration magnitude, measured in time/frequency. Measures taken from the accelerometer.

**[time|freq]-bodygyromag-[mean|std]**: Numeric (float). Standarized mean/estandar deviation of the body signal acceleration magnitude, measured in time/frequency. Measures taken from the gyroscope.

**[time|freq]-bodygyrojerkmag-[mean|std]**: Numeric (float). Standarized mean/estandar deviation of the body signal jerk acceleration magnitude, measured in time/frequency. Measures taken from the gyroscope.
