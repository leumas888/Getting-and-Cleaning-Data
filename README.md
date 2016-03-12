# Getting-and-Cleaning-Data ReadMe
Project Assignment for Coursera

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Assignment Description

The raw data is pulled from the link above. The data is then aggregated and cleaned using the following steps:

    1.  Merges the training and the test sets to create one data set.
    2.  Extracts only the measurements on the mean and standard deviation for each measurement.
    3.  Uses descriptive activity names to name the activities in the data set
    4.  Appropriately labels the data set with descriptive variable names.
    5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each              activity and each subject.

The final compilation is output in the file attached - "sensor_avg_by_subject.txt".

# Repository content

This repository contains three sets of file, as listed below:

- ReadMe.md: this file, which describes the project context and steps taken with the data
- CodeBook.md: description of the raw and tidy datasets, including interpretation of the variables
- run_analysis.R: R script that was used to tidy up the raw data

