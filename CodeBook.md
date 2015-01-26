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