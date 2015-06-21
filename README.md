How the script works

- script assumes that the UCI data set is in its own folder, labelled UCI HAR Dataset, in the working directory.
- script loads all the the data

- script then takes the second column of the features data loaded in, and turns it into a vector and then applies make.names
	to coerce each element into a valid argument for the name of a column and makes that vecotr all one variable
	
- script then applies these names to each set of test and train data, before combining the two row-wise
- script then combines the test and train for the subject and activity data, and gives each its corresponding column name before 
	appending both of the columns to the larger dataset consisting of the test and train data
- script then uses grep to search for all the variable names with mean and standard deviation in them, separately in order to 
	leave out the mean frequency variables, and combines them into one vector
- script then subsets the dataset by these names to create a new dataset containing only the means and standard deviations
	of each variable
- script then replaces the numeric activity data with its corresponding written action

- script then, using the aggregate function, creates a new dataset that displays the average for each activity by each subject	
	Note: group.1 is the number of the subject, ranging 1-30, group.2 is the activity list
		the new dataset shows each person's laying data, then moves to each persons sitting data and so forth
	