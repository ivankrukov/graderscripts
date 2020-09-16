#!/bin/bash
for student in `cat tograde`; do
	echo $student
	if [ ! -d ext/$student* ]; then
		echo "No sub detected: $student"
		continue
	fi
	vim ext/$student*/rubric
	code=`find . -name main.cpp`
done
echo "Grading script terminated successfully"
