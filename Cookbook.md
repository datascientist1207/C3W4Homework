# Cookbook for Course 3 Week 4 Homework assignment

The data for the Train and Test users were read into memory, this included what type of activity they were doing, what the subject ID was, and the measurements from their smart devices. 

The activity i.e. walking, running,etc was joined together with a simple concatentation.  The excercise measurements and the subject IDs were combined with an rbind.  

Once the Train and Test users were combined all of the data was combined into a single data.frame.  The columns for the activity was converted into a factor variable so the numeric identifier would be translated to something human readable.  This column was also named Activity.

The column containing the subject id for each participant was labelled Subject_ID.  For the 561 measurement variables they are labelled V1 thru V561.

Once this was completed the dplyr package was used to do create a summary with averages and standard deviations for each activity and user.

