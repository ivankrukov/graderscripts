#!/bin/bash
while (( "$#" )); do
    case "$1" in
        -h|--help)
            echo "-q/--rubric-only; -b/--build; -w/--no-web; -r/--no-readme"
            exit 0
            ;;
        -q|--rubric-only)
            RONLY=1
            shift
            ;;
        -b)
            BUILD=1
            shift
            ;;
        -w|--no-web)
            NOWEB=1
            shift
            ;;
        -r|--no-readme)
            NOREADME=1
            shift
            ;;
        -*|--*=)
            echo "WARN: Unknown flag $1=" >&2
            shift
            ;;
    esac
done

for student in `cat tograde`; do
	echo $student
	if [ ! -d ext/$student* ]; then
		echo -ne "\e[48;5;88m No sub detected: $student"
        echo -e "\e[0m"
		continue
	fi
	cd ext/$student*
    if [ -f "LATEFLAG" ]; then
		echo -ne "\e[48;5;93m Submitted late: $student"
        echo -e "\e[0m"
    fi
    if [ -v RONLY ]; then
        # readme=`find . -name README.txt`
		# cat "$readme" /dev/null
        cat rubric
        read -p "Edit?> " yn
        if [[ $yn =~ ^[YyeE]$ ]]; then
            vim rubric
        elif [[ $yn =~ ^[Qq]$ ]]; then
            echo "exiting..."
            exit 0
        fi
    else
        code=`find . -name main.cpp`
        readme=`find . -name README.txt`

# re    adme/website
        test -v NOREADME || cat "$readme" /dev/null

        test -v NOWEB || xdg-open `find . -name *.html`

        echo "Zip Submission:"
        find ../../zips -name $student*

        read -p "<Continue>"
# co    de/rubric view
        test -v NOREADME && vim -O rubric "$code" -c ":term" ||
        vim $readme -O rubric "$code" -c ":term"

        bash
    fi
	cd ../..
done
echo "Grading script terminated successfully"
