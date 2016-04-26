# Getting and Cleaning Data Course Project Readme

# High level goal 

  > To provide an independent tidy data set with the average of each variable for each activity and each subject that was collected in Samsung's wearable computing devices. 

# Raw data 

  > One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

  Here are the data for the project:

  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# For variable and file details please refer to Cookbook.md


# Steps the script executes

 1. Reads in the data from the files described in the above section with read.table
 2. Combines the data the like data with rbind
 3. Creates a large data frame with the data and provides it with labels some provided by features.txt
 4. Extracts only the Activity, Subject IDs, mean, and standard deviation columns
 5. Summarizes this dataset with an average for each Activity and Subject ID
