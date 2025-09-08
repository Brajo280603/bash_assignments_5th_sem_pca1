
FILE="students.txt"

if [ ! -f "$FILE" ]; then
  echo "Roll,Name,Subject1,Subject2,Subject3" > "$FILE"
fi


add_student() {
  read -p "Roll: " roll
  read -p "Name: " name
  read -p "Subject 1: " s1
  read -p "Subject 2: " s2
  read -p "Subject 3: " s3

  echo "$roll,$name,$s1,$s2,$s3" >> "$FILE"
  echo "Student added!"
}


display_all() {
  column -t -s, "$FILE"
}


search_by_roll() {
  read -p "Enter roll: " r
  grep "^$r," "$FILE" || echo "Not found"
}


calculate_all() {
  echo -e "Roll\tName\tS1\tS2\tS3\tTotal\tAverage\tGrade"
  tail -n +2 "$FILE" | while IFS=, read -r roll name s1 s2 s3; do
    total=$((s1+s2+s3))
    avg=$((total/3))
    if [ $avg -ge 90 ]; then grade="A"
    elif [ $avg -ge 80 ]; then grade="B"
    elif [ $avg -ge 70 ]; then grade="C"
    elif [ $avg -ge 60 ]; then grade="D"
    else grade="F"
    fi
    echo -e "$roll\t$name\t$s1\t$s2\t$s3\t$total\t$avg\t$grade"
  done
}


while true; do
  echo
  echo "=== Student Manager ==="
  echo "1) Add student"
  echo "2) Display all"
  echo "3) Search by roll"
  echo "4) Calculate totals"
  echo "5) Exit"
  read -p "Choose: " choice

  case $choice in
    1) add_student ;;
    2) display_all ;;
    3) search_by_roll ;;
    4) calculate_all ;;
    5) exit ;;
    *) echo "Invalid choice" ;;
  esac
done
