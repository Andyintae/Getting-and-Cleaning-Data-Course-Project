## Run Analysis ##



# 1. Load package ------------------------------------------------------------

library(tidyverse)



# 2. Create and Set work directory ------------------------------------------------------


if(!file.exists("project")){dir.create("project")}

setwd("./project")
wd <- getwd()


# 3. Download and unzip files ------------------------------------------------

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile = paste0(wd,"/20Dataset.zip"))

unzip(zipfile = "20Dataset.zip")



# Read and Merge files ----------------------------------------------------

dir <- file.path("./UCI HAR Dataset")

activity_lab  <- read.table(paste0(dir,"/activity_labels.txt"))
names()

features      <- read.table(paste0(dir,"/features.txt"))

subject_train <- read.table(paste0(dir,"/train/subject_train.txt"))
subject_test  <- read.table(paste0(dir,"/test/subject_test.txt"))
subject_merge <- bind_rows(subject_train, subject_test)
colnames(subject_merge) <- "subject"

y_train       <- read.table(paste0(dir,"/train/Y_train.txt"))
y_test        <- read.table(paste0(dir,"/test/Y_test.txt"))
y_merge       <- bind_rows(y_train, y_test)
colnames(y_merge) <- "labels"

x_train       <- read.table(paste0(dir,"/train/X_train.txt"))
x_test        <- read.table(paste0(dir,"/test/X_test.txt"))
x_merge       <- bind_rows(x_train, x_test)
colnames(x_merge) <- features[,2]


dim(activity_lab)
dim(features)
dim(subject_train)
dim(x_train)
dim(y_train)
dim(y_train)
dim(subject_test)
dim(x_test)
dim(y_test)