
Copy the script in the downloaded folder from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .

On running, the script takes train and test data from their respective folders (which includes feature data, labels and subject 
information) and will bind them column wise using the R function cbind.

Feature names are added to the binded data set, from "features.txt" file

Another column is added to both train and test data called "data_set" so as to identify the data set type (train/test) when 
merged to a single documnet

Out of all the features, the features names which contain ".mean" and ".std" were selected for analysis

The observation labeles were changed from numeric to catagorical variables based on the file "activity_labels.txt"

For computing tidy data, the data is grouped based on subject, label and data_set (train/test) and the feature means are computed

The output is saved as tidy.txt
