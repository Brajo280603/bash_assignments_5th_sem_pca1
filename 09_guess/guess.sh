random=$((1+ $RANDOM %50))
count=0
while true;
do
	echo -e "\nEnter Guess: "
	read user
	count=$((count + 1))
	if (( random < user )); then
		echo -e "\nToo High"
	else 
		if (( random > user ));then
			echo -e "\nToo Low"
		else
			echo -e "\n\nCorrect The number was : $random"
			echo -e "\nCorrectly guessed after $count times"
			break
		fi
	fi
done
