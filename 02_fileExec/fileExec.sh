echo -e "\n\nEnter the file name : "

read fileName

files=$(find . -name "$fileName.*")
filesLen=${#files}
	
	if [ $filesLen -eq 0 ]; then
		echo -e "\nFile Not Found"
	else
		echo -e "\nFile Found at :\n$files\n"

		ls -l "$files"
		
		chmod 777 "$files"
		echo -e "\nFile Permission is changed to be executeable"

	fi


