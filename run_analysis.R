#check for library dependency
library("reshape2")

#grab some necessary information
activities <- read.table(
    "activity_labels.txt",
    col.names = c("key", "activity"),
    as.is = TRUE
)
features <- read.table(
    "features.txt",
    col.names = c("key", "feature"),
    as.is = TRUE
)

#create test data frame
test_uci_data <- cbind(
    read.table("test/subject_test.txt", col.names = "subject"),
    read.table("test/y_test.txt", col.names = "activity_key"),
    read.table("test/X_test.txt", col.names = features$feature)
)

#create train data frame
train_uci_data <- cbind(
    read.table("train/subject_train.txt", col.names = "subject"),
    read.table("train/y_train.txt", col.names = "activity_key"),
    read.table("train/X_train.txt", col.names = features$feature)
)

#combine data frames to one set
uci_data <- rbind(test_uci_data, train_uci_data)
uci_data <- merge(
    uci_data,
    activities,
    by.x = "activity_key",
    by.y = "key",
    sort = FALSE
)
rm(features, activities, test_uci_data, train_uci_data)

#only use the columns we need
uci_data <- uci_data[, c(
    'subject',
    'activity', 
    colnames(uci_data)[grep('(mean|std)\\b', colnames(uci_data))])
]

#recast dataset for tidy format
uci_data <- dcast(
    melt(uci_data, id = c('subject', 'activity')),
    subject + activity ~ variable, mean
)

#finally, write and drop data
write.table(uci_data, "tidy-data.txt", row.names = FALSE)
rm(uci_data)