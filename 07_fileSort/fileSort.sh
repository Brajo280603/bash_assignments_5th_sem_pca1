for files in *;
do	
	if [[ -f "$files" ]]; then

		folder="$(file -bi "$files"|cut -d'/' -f1)"
	 	mkdir -p "$folder"

	 	mv "$files" "./$folder"
	else
		folder="$(file -bi "$files"|cut -d'/' -f2|cut -d';' -f1)"
		mkdir -p "$folder"

	 	mv "$files" "./$folder"

	fi
done
