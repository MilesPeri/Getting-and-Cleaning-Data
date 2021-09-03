# Getting-and-Cleaning-Data
3rd assignment

Run the run_analysis.R script

This Script downloads the UCI HAR dataset and unzip it.
Read the features.txt that are going to be the names of the variables, and the activity_labels.txt with the labels for the activities.
Read the train dataset with the names of the variables provided by features, read the activities and pass it like factors and read the subjects.
Make a dataset of the train subjects, activities and measurments by binding the datasets.
Read the test dataset with the names of the variables provided by features, read the activities and pass it like factors and read the subjects.
Make a dataset of the test subjects, activities and measurments by binding the datasets.
Make a dataset combining the test and the train datasets.
Make a vector with the names that include subject, activity, mean and standard deviation, but not the frequency mean.
Subset only those variables from the dataset.
Substitute the numbers at the begining of the variable names with nothing and trim the space at the begining of the variable names
Compute the mean of the selected variables by every subject and activity.
Write the tidy dataset with 180 observations, one per subject and activity with the averages of the mean and the standard deviation of every measure.

