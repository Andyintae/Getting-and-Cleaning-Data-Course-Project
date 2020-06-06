# Getting-and-Cleaning-Data-Course-Project

author: "Andyintae" date: '2020 6 7 '

## Purpose of this project

The purpose of this project is to make tidy dataset with "Getting and Cleaning Data skills"

excerpted from COURSERA(https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project)

====================

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

====================

## run_analysis.R

1. Load package 
 - You need packages 'dplyr 1.0.0' and 'tidyr'
2. Create and Set work directory 
 - make a new directory if there is no ditectory named "project"
3. Download and unzip files 
 - download data from web and unzip the file
4. Read and Merge data 
  4-1. subject 
    - read train and test dataset of subject and bind them
    - attach colnames
  4-2. y
    - read train and test dataset of y and bind them
    - read activity_labels file and join with y
  4-3. x
    - read train and test dataset of x and bind them
    - read features dataset and bind the second column of it as the colnames of x dataset
  4-4. Merge 
    - check the number of rows of subject, x and y dataset
    - bind those dataset as tidydata
5. tidy data
 - make a lone-form dataset
 - make a wide-form dataset (average of each variable for each activity and each subject)
6. Write files
 - write to csv files
