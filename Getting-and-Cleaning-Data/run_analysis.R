rm(list = ls())
cat("\014")

library(dplyr)

# Load data

activity_label = read.table("activity_labels.txt", header = FALSE)

feature_names = read.table("features.txt", header = FALSE)

test_set     = read.table("./test/X_test.txt", header = FALSE, col.names = feature_names$V2)
test_labels  = read.table("./test/y_test.txt", header = FALSE, col.name = c("label"))
test_subject = read.table("./test/subject_test.txt", header = FALSE, col.name = c("subject"))
test_data    = cbind(test_subject,test_labels, test_set )

test_data$data_set = "test"

train_set      = read.table("./train/X_train.txt", header = FALSE, col.names = feature_names$V2)
train_labels   = read.table("./train/y_train.txt", header = FALSE, col.name = c("label"))
train_subject  = read.table("./train/subject_train.txt", header = FALSE, col.name = c("subject"))
train_data     = cbind(train_subject, train_labels, train_set)

train_data$data_set = "train"

# Merges the training and the test sets to create one data set

merged_data_set = rbind(test_data,train_data)

# Extracts only the measurements on the mean and standard deviation for each measurement.

name1 = names(merged_data_set)
name2 = name1[4:length(name1)-1]
selected_mean_std =  merged_data_set[name2[grep("*.mean*|.std", name2)]]

#Uses descriptive activity names to name the activities in the data set

df =cbind(merged_data_set[,c("subject", "label", "data_set")], selected_mean_std)
df[which(df$label==1),]$label = "WALKING"
df[which(df$label==2),]$label = "WALKING_UPSTAIRS"
df[which(df$label==3),]$label = "WALKING_DOWNSTAIRS"
df[which(df$label==4),]$label = "SITTING"
df[which(df$label==5),]$label = "STANDING"
df[which(df$label==6),]$label = "LAYING"

# Appropriately labels the data set with descriptive variable names.

# - completed from the prior steps

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy = df %>% group_by(subject,label,data_set) %>% summarise_each(funs(mean))
write.table(tidy, "tidy_data.txt",sep = "\t", row.names=FALSE)
