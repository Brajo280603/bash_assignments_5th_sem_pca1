echo -e "\n\nEnter a list of numbers separated by commas ',' : \n"

read numStr

IFS=',' 
read -a numArray <<< "$numStr"


odds=""
evens=""


for number in "${numArray[@]}"
do
	if [[ number%2 -eq 0 ]]; then
		evens+="$number"
		evens+=" "
	else
		odds+="$number"
		odds+=" "
	fi
done


touch odd.txt
touch even.txt

echo "$evens" > even.txt
echo "$odds" > odd.txt

echo -e "\n\nOdd numbers are saved in ./odd.txt \nEven numbers are saved in ./even.txt"

cat odd.txt
cat even.txt
