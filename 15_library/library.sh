
FILE="library.txt"

if [ ! -f "$FILE" ]; then
  echo "ID,BookName,Author,Status" > "$FILE"
fi


add_book() {
  read -p "Enter Book ID: " id

  if grep -q "^$id," "$FILE"; then
    echo "ID $id already exists!"
    return
  fi

  read -p "Enter Book Name: " name
  read -p "Enter Author: " author

  echo "$id,$name,$author,Available" >> "$FILE"
  echo "Book added successfully."
}


view_books() {
  column -t -s, "$FILE"
}


search_book() {
  read -p "Search by (1) ID or (2) Name: " choice
  if [ "$choice" = "1" ]; then
    read -p "Enter ID: " id
    grep "^$id," "$FILE" | column -t -s, || echo "Book not found."
  else
    read -p "Enter Name (or part): " name
    grep -i "$name" "$FILE" | column -t -s, || echo "Book not found."
  fi
}


issue_book() {
  read -p "Enter Book ID to issue: " id
  if grep -q "^$id,.*,Available$" "$FILE"; then
    sed -i "/^$id,/s/Available/Issued/" "$FILE"
    echo "Book ID $id issued."
  elif grep -q "^$id,.*,Issued$" "$FILE"; then
    echo "Book with ID $id is already issued."
  else
    echo "Book with ID $id not found."
  fi
}


return_book() {
  read -p "Enter Book ID to return: " id
  if grep -q "^$id,.*,Issued$" "$FILE"; then
    sed -i "/^$id,/s/Issued/Available/" "$FILE"
    echo "Book ID $id returned."
  elif grep -q "^$id," "$FILE"; then
    echo "Book with ID $id is already available."
  else
    echo "Book with ID $id not found."
  fi
}


while true; do
  echo
  echo "===== Library Manager ====="
  echo "1) Add Book"
  echo "2) View All Books"
  echo "3) Search Book"
  echo "4) Issue Book"
  echo "5) Return Book"
  echo "6) Exit"
  read -p "Choose (1-6): " opt

  case $opt in
    1) add_book ;;
    2) view_books ;;
    3) search_book ;;
    4) issue_book ;;
    5) return_book ;;
    6) echo "Goodbye!"; exit ;;
    *) echo "Invalid choice!" ;;
  esac
done
