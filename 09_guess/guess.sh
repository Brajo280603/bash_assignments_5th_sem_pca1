random=$((1+ $RANDOM %50))
while true;
do
	echo -e "\nEnter Guess: "
	read user

	if (( random < user )); then
		echo -e "\nToo High"
	else 
		if (( random > user ));then
			echo -e "\nToo Low"
		else
			echo -e "\n\nCorrect The number was : $random"
			break
		fi
	fi
done
