
questions=(
  "Who made the C Programming language?"
  "In what year did India successfully land a spacecraft on the Moon?"
  "What was the specific Nobel Prize awarded to Rabindranath Tagore in 1913?"
  "In what year the indian national anthem was written?"
  "How many Unions Territories are there in India?"
)

options=(
  "A) Steve Jobs  B) Ken Thompson  C) Dennis Ritchie  D) Bill Gates"
  "A) 2020  B) 2022   C) 2023    D) 2025"
  "A) Nobel Prize in Physics  B) Nobel Prize in Literature  C) Nobel Prize in Peace  D) Nobel Prize in Economics"
  "A) 1911  B) 1920  C) 1947  D) 1951"
  "A) 5  B) 6  C) 7  D) 8"
)

answers=(C C B A D)

score=0

echo ""> quest.txt

for i in {0..4}
do
	
	echo -e "\n\n${questions[$i]},${options[$i]},${answers[$i]}" >> quest.txt
	echo "Q$((i+1)): ${questions[$i]}"
	echo "${options[$i]}"

	read -p "Your answer (A/B/C/D): " ans
	ans=$(echo "$ans" | tr '[:lower:]' '[:upper:]')

	if [ "$ans" = "${answers[$i]}" ]; then
		echo "Correct!"
		score=$((score+1))
	else
		echo "Wrong! Correct answer: ${answers[$i]}"
	fi
done

echo "Quiz finished!"
echo "Your score: $score out of 5"
