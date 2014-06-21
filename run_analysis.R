clean_uci_har_data <- function (directory = "raw-data/UCI HAR Dataset/") {
    #lets grab some necessary information
    activities <- read.table(paste(
        directory,
        "activity_labels.txt",
        sep = ""
    ), col.names = c("key", "activity"))
    measurements <- read.table(paste(
        directory,
        "features.txt",
        sep = ""
    ), col.names = c("key", "rawFeature"))
    
    # parse measurements to see what columns we want (only mean and std dev)
    target_measurement_keys <- grep("(std|mean)\\b", measurements$rawFeature)
    target_measurements <- measurements[target_measurement_keys,]
    
    suppressWarnings(
        verbose_measurements <- data.frame(do.call(
            "rbind",
            strsplit(as.character(target_measurements$rawFeature), "-")
        ), col.names = c("measurement", "summary", "direction"))
    )
    
    target_measurements <- cbind(target_measurements, verbose_measurements)
    
    #grab and parse the test data
    test_subjects <- read.table(paste(directory, "test/subject_test.txt", sep = ""))
    test_activities <- read.table(paste(directory, "test/y_test.txt", sep = ""))
    test_data <- read.table(paste(directory, "test/X_test.txt", sep = ""))
    
    test_activities <- merge(test_activities, activities, by.x = "V1", by.y = "key", sort = FALSE)
    
    test_data <- test_data[,target_measurements$key]
    test_data <- cbind(test_subjects, test_activities, test_data)
    
    #TODO - combine measurement meta data w/ test data and sort into sensible table
    #TODO - abstract out logic to repeat for 'train'
    #TODO - combine train & test data
    #TODO - (subject, type = c('test', 'train'), activity, measurement) X (mean, std)
    
    #TODO - reduce first set to average activity per subject
    
}
