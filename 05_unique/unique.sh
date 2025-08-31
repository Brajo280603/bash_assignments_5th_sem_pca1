if [ ${#1} -eq 0 ]; then

	echo -e "\n\nEnter the name of the file : "

	read fileName
else 
	fileName=$1
fi

uniq --unique $fileName
