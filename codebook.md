Code book

variables in the finished dataset
	- group.1 - the id of the corresponding subject. There were 30 subjects, with id's ranging from 1-30.
		NOTE: IN CERTAIN TEXT EDITORS THE COLUMN NAMES CAN BE SHIFTED TO THE RIGHT BY A SMALL AMOUNT
		THE GROUP.1 COLUMN CORRESPONDS TO THE LEFTMOST COLUMN OF NUMBERS COUNTING UP FROM 1 TO 30 REPEATEDLY
		THE REST OF THE COLUMNS CORRESPOND TO THE CORRECT NUMBER OF COLUMNS TO THE RIGHT OF THAT COLUMN
	
	- group.2 - the activity that particular subject is doing when the measurements were taken, ranging from Walking
		Walking Upstairs, Walking Downstairs, Laying, Sitting, or Standing
	
	- the rest - the rest of the variables are described in their names, either being the mean or the standard deviation
		of that particular measurement in the x, y, or z axis

variables in the Code
	- features - data table of loaded features.txt
	- activity_labels - data table of loaded activity_labels.txt
	- X_train - data table of loaded X_train.txt
	- X_test - data table of loaded X_test.txt
	- subject_test - data table of loaded subject_test.txt
	- subject_train - data table of loaded subject_train.txt
	- y_train - data table of loaded y_train.txt
	- y_test - data table of loaded y_test.txt
	- name_vec - vector of the second column of the features variable, the column names
	- names - name_vec with valid naming procedure
	- data - the first iteration of the tidyied data, repeatedly updated and changed
	- subjectData - the combined data table of subject_test and subject_train
	- activityData - the combined data table of y_train and y_test
	- meanNames - character vector of each element in names that contains mean. in it
	- stdNames - character vector of each element in names that contains std. in it
	- bothNames - combined character vector of meanNames and stdNames
	- meanStdData - new data table containing only the columns of the 'data' data table with 
		varible names corresponding to 'bothNames'
	- aggdata - the data table of the final, tidy data set, showing the measurements of each
		subject id doing each activity