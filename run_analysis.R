library(readr)
url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./data.zip")
unzip("data.zip")
y_train <- read_csv("~/Curso/Getting and Cleaning Data/UCI HAR Dataset/train/y_train.txt", 
                    col_names = "activity")
subject_train <- read_csv("~/Curso/Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt", 
                          col_names = "subject")
features <- read_csv("~/Curso/Getting and Cleaning Data/UCI HAR Dataset/features.txt", 
                     col_names = FALSE)
activity_labels<-read_delim("~/Curso/Getting and Cleaning Data/UCI HAR Dataset/activity_labels.txt", 
                          " ", col_names = FALSE)
vector_labels<-factor(activity_labels$X1, labels = activity_labels$X2)
y_train$activity<-factor(y_train$activity, labels=vector_labels)
X_train<-read_delim("~/Curso/Getting and Cleaning Data/UCI HAR Dataset/train/X_train.txt", 
                               " ", escape_double = FALSE, col_names = features$X1, 
                               trim_ws = TRUE)

data_train=cbind(subject_train,y_train,X_train)

y_test <- read_csv("~/Curso/Getting and Cleaning Data/UCI HAR Dataset/test/y_test.txt", 
                    col_names = "activity")
subject_test <- read_csv("~/Curso/Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt", 
                          col_names = "subject")
y_test$activity<-factor(y_test$activity, labels=vector_labels)
X_test<-read_delim("~/Curso/Getting and Cleaning Data/UCI HAR Dataset/test/X_test.txt", 
                    " ", escape_double = FALSE, col_names = features$X1, 
                    trim_ws = TRUE)
data_test<-cbind(subject_test,y_test,X_test)
data_total<-rbind(data_train,data_test)

vector_mean_std<-grep("subject|activity|mean\\(\\)|std\\(\\)", names(data_total), value = TRUE)
data_selected<-data_total[,vector_mean_std]

nn<-sub("^[0-9]+", "", names(data_selected))

library(stringr)
nn<-str_trim(nn)
names(data_selected)<-nn

library(dplyr)
tidy_data<-data_selected %>% group_by(subject,activity) %>% summarise(across(, mean))

write.table(tidy_data, file="tidy_data.txt", row.names = FALSE)
