
read -p "Enter number of students: " n


marks=()


for (( i=1; i<=n; i++ )); do
  read -p "Enter mark for student $i: " m
  marks+=($m)
done


highest=${marks[0]}
lowest=${marks[0]}
sum=0


for mark in "${marks[@]}"; do

  if (( $(echo "$mark > $highest" | bc -l) )); then
    highest=$mark
  fi
  
  if (( $(echo "$mark < $lowest" | bc -l) )); then
    lowest=$mark
  fi

  sum=$(echo "$sum + $mark" | bc -l)
done


average=$(echo "scale=2; $sum / $n" | bc -l)


echo -e "\n\nHighest mark: $highest"
echo "Lowest mark:  $lowest"
echo "Average mark: $average"
