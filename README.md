## Folder Structure
1. put grader scripts in .
2. make assignment folder ./lab containing:
	* the .template grading rubric
	* a file called tograde with the lowercase lastnamefirstname of students to grade
	* the submissions.zip you get from Canvas when you download all submissions
3. run ../unzip.sh
4. run ../auto.sh. This will list through each submission and open any website found, print the corresponding zip file the submission came from (for figuring out naming convention), cat readme, and open up vim with multiple splits for an interactive shell, the rubric, and their main.cpp 


