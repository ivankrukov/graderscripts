#!/bin/bash
for student in `cat tograde`; do
	echo $student
	if [ ! -d ext/$student* ]; then
		echo "No sub detected: $student"
		continue
	fi
	cd ext/$student*
	code=`find . -name main.cpp`

	# readme/website
	cat `find . -name README.txt` /dev/null
	xdg-open `find . -name *.html`
	echo "Zip Submission:"
	find ../../zips -name $student*

	read -p "<Continue>"
	# code/rubric view
	vim -O rubric $code -c ":term"
	bash
	cd ../..
done
echo "Grading script terminated successfully"
