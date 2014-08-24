## To Run: 
##          source('')
##          function()

downloader <- function() {
    zipped_file_name = "DataPackage.zip"
    unzipped_file_name = "UCI HAR Dataset"
    download_url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

    is_exists_zipped_file = file.exists(zipped_file_name)
    is_exists_unzipped_file = file.exists(unzipped_file_name)

    if(!is_exists_unzipped_file){
        print("Unzipped file not available for parsing. Checking zipped file existance")
        if(!is_exists_zipped_file){
            print("Zipped file not found preparing to download")
            download.file(download_url, destfile=zipped_file_name, method="curl")
        }
        else{
            print("Zipped file found")
        }
        print("Unzipping data")
        unzip(zipped_file_name)
    }
    print("Downloaded file available. Reading & Preparing data")
}

processor <- function() {
    #Download Necessary files on computer
    downloader()
    #Read tables into variables
    activitylabels <-  read.table("./UCI HAR Dataset/activity_labels.txt")
    features <-  read.table("./UCI HAR Dataset/features.txt")    
    subjecttrain <-  read.table("./UCI HAR Dataset/train/subject_train.txt")
    subjecttest <-  read.table("./UCI HAR Dataset/test/subject_test.txt")
    xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
    xtest <-  read.table("./UCI HAR Dataset/test/X_test.txt")
    ytrain <-  read.table("./UCI HAR Dataset/train/y_train.txt")
    ytest <-  read.table("./UCI HAR Dataset/test/y_test.txt")
    
    #Prepare & write the first data set
    subjectall <- rbind(subjecttest, subjecttrain)
    xall <- rbind(xtest, xtrain)
    yall <- rbind(ytest, ytrain)
    names(xall) <- features$V2
    names(subjectall) <- c("subject")
    names(yall) <- c("activity")
    data_all <- cbind(subjectall, yall, xall)
    data_all$activity <- factor(data_all$activity,activitylabels[[1]],activitylabels[[2]])
    mean_or_sd <- grepl("subject|activity|mean|std", names(data_all))
    extracted_data <- data_all[mean_or_sd]
    write.table(extracted_data, file="mean_std_data_set.txt")
    
    #Prepare & write the second data set
    tidy_data <- aggregate(data_all, by=list(data_all$subject, data_all$activity), FUN=mean)
    sprintf("%d rows aggregated into %d rows \n", nrow(data_all), nrow(tidy_data))
    write.table(tidy_data, file="tidy_data_set.txt", row.names=FALSE)    
}

processor()
