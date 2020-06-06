## Run Analysis ##


# 1. Load package ------------------------------------------------------------

library(dplyr)
library(tidyr)


# 2. Create and Set work directory ------------------------------------------------------

if(!file.exists("project")){dir.create("project")}

setwd("./project")
wd <- getwd()


# 3. Download and unzip files ------------------------------------------------

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile = paste0(wd,"/20Dataset.zip"))

unzip(zipfile = "20Dataset.zip")


# 4. Read and Merge data ----------------------------------------------------

dir <- "./UCI HAR Dataset"

 # 4-1. subject    
subject_train <- read.table(paste0(dir,"/train/subject_train.txt"))
subject_test  <- read.table(paste0(dir,"/test/subject_test.txt"))
subject_merge <- bind_rows(subject_train, subject_test)

colnames(subject_merge) <- "subject"

 # 4-2. y
y_train       <- read.table(paste0(dir,"/train/Y_train.txt"))
y_test        <- read.table(paste0(dir,"/test/Y_test.txt"))
y_merge       <- bind_rows(y_train, y_test)

colnames(y_merge) <- "activity_id"
activity_labels   <- read.table(paste0(dir,"/activity_labels.txt"))
colnames(activity_labels) <- c("activity_id", "activity")
y_merge_label             <- y_merge %>% left_join(activity_labels, by = "activity_id")

 # 4-3. x
x_train       <- read.table(paste0(dir,"/train/X_train.txt"))
x_test        <- read.table(paste0(dir,"/test/X_test.txt"))
x_merge       <- bind_rows(x_train, x_test)

features          <- read.table(paste0(dir,"/features.txt"))
colnames(x_merge) <- features[,2]

 # 4-4. Merge 
dim(subject_merge)
dim(y_merge_label)
dim(x_merge)

merged_data <- bind_cols(subject_merge, y_merge_label, x_merge)


# 5. tidy data ---------------------------------------------------

tidydata_long <- merged_data %>% 
          select(subject, activity, contains(c("mean()","std()"))) %>% 
          gather(features, reading, -c(subject, activity)) %>% 
          separate(col = features, into = c("feature", "measurement", "direction"), sep = "-") %>% 
          mutate(measurement = case_when(measurement == "mean()" ~ "mean", 
                                         measurement == "std()" ~ "std"))

tidydata_wide_avg <-  merged_data %>% 
          select(subject, activity, contains(c("mean()","std()"))) %>% 
          group_by(subject, activity) %>% 
          summarise(across(1:66, mean))