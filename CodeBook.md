---
title: "Coursera - Getting And Cleaning Data Project - Data Codebook"
output: html_document
---

Purpose of this document is being codebook of the data produced by given project. see <https://www.coursera.org/course/getdata>.

The raw data used in this project is data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> 

And the raw data is available in 

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The R script given in run_analysis.R is merges and cleanes raw data given.

Used Steps are.

1. Merges the training and the test sets to create one data set.
- The raw data consists of data set **X_train.txt**, **X_test.txt**, **Y_train.txt**,**Y_test.txt**,  **subject_train.txt** and **subject_test.txt** files.
- Merge of **X_train.txt**, **X_test.txt** files results data frame of *10299* instances and *561* variables. Data consists of collected data from accelerometers.
- Merge of **subject_train.txt** and **subject_test.txt** files are produces a 10299x1 data frame with *subjectIDs*.
- Merge of **Y_train.txt** and **Y_test.txt** files are produces a 10299x1 data frame with *activityIDs*.

2.Read features from **features.txt** file.

3.Read features from **activity_labels.txt** file.

4.Extract feature name to *featureNames*.

5.Extract feature names with **mean** or **std** to *featuresMeanSTD* data frame.

6.Extract features with **mean** or **std** to **featuresMS**.

7.Bind *featurenames*, *train* and *test* data into **dataMS**.

8.Set column names in *dataSet* and *dataMS* with **names()** function.

9.Created a *selectedData* from *dataSet* using Means ans STD data.

10.Changed *Activity* names with more understandable text.

11.Written tidy data to **csv** and **txt** format.

12.Calculated and Written mean and standard deviation data of per person per activity in **csv** and **txt** format.
