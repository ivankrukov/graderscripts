mkdir ext
unzip -o submissions.zip -d zips
cd zips
for f in *.zip; do
	dname="../ext/"$(echo $f | cut -d '_' -f 1)
	unzip -o "$f" -d $dname
	if [[ $f == *"LATE"* ]]; then
		touch $dname/LATEFLAG
	fi
	cp ../*.template $dname/rubric
done
cd ..
