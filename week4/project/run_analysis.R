#
# Final project getting and cleaning data
# Author: Juan Pablo Calle
#

# Read required libraries ------------------------------------------------------

library(data.table)

# Read the data ----------------------------------------------------------------

feature_names <- fread("uci_har_dataset/features.txt",
                       header = FALSE, select = 2, col.names = "varname")

activities <- fread("uci_har_dataset/activity_labels.txt",
                    header = FALSE, col.names = c("actlabel", "actname"))
activities$actname <- tolower(activities$actname)

d_train_x <- fread("uci_har_dataset/train/X_train.txt", header = FALSE)
names(d_train_x) <- feature_names$varname

d_train_y <- fread("uci_har_dataset/train/y_train.txt",
                   header = FALSE, col.names = "actlabel")

subject_train <- fread("uci_har_dataset/train/subject_train.txt",
                       header = FALSE, col.names = "subjectid")

d_test_x <- fread("uci_har_dataset/test/X_test.txt", header = FALSE)
names(d_test_x) <- feature_names$varname

d_test_y <- fread("uci_har_dataset/test/y_test.txt",
                  header = FALSE, col.names = "actlabel")

subject_test <- fread("uci_har_dataset/test/subject_test.txt",
                      header = FALSE, col.names = "subjectid")


# Merge the data ---------------------------------------------------------------

# Merging the columns
d_train <- cbind(subject_train, d_train_y, d_train_x)
d_test <- cbind(subject_test, d_test_y, d_test_x)

# Merging the train and test
data <- rbind(d_train, d_test)

# Remove training and test data, not needed anymore
rm(d_test, d_test_x, d_test_y, d_train, d_train_x, d_train_y,
   subject_test, subject_train, feature_names)


# Extract only the mean and standard deviationcolumns ------------------------

mean_sd_cols <- names(data)[grepl("mean\\(\\)|std\\(\\)", names(data))]
select_cols <- c("subjectid", "actlabel", mean_sd_cols)

data <- data[, select_cols, with = FALSE]


# Use descriptive activity names -----------------------------------------------

data <- merge(data, activities, by = "actlabel")  # get activity names
data[, actlabel := NULL]  # drop activity label, not needed anymore


# Use descriptive variable names -----------------------------------------------

selected_vars <- names(data)

# Replace t by time
descriptive_var_names <- gsub("^t", "time-", selected_vars)

# Replace f by freq
descriptive_var_names <- gsub("^f", "freq-", descriptive_var_names)

# Replace mean() by mean and std() by std
descriptive_var_names <- gsub("\\(\\)", "", descriptive_var_names)

# Convert to lowercase
descriptive_var_names <- tolower(descriptive_var_names)

names(data) <- descriptive_var_names


# Write tidy dataset -----------------------------------------------------------

# Order the variable names, subject_id and actname first
last_idx <- length(descriptive_var_names)
ordered_names <- c(descriptive_var_names[1],
                   descriptive_var_names[last_idx],
                   descriptive_var_names[c(-1, -last_idx)])
setcolorder(data, ordered_names)

# Write de tidy data as space separated values in txt file
fwrite(data, "uci_har_dataset.txt", sep = " ")

# Clean the namespace
rm(list = ls())
