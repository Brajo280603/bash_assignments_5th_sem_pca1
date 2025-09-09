CONTACTS_FILE="contacts.txt"
touch "$CONTACTS_FILE"   

add_contact() {
  read -p "Enter name: " name
  read -p "Enter phone: " phone
  echo "$name | $phone" >> "$CONTACTS_FILE"
  echo "Contact added!"
}

list_contacts() {
  if [ ! -s "$CONTACTS_FILE" ]; then
    echo "No contacts yet."
  else
    nl "$CONTACTS_FILE"
  fi
}

search_contact() {
  read -p "Enter name to search: " name
  grep -i "$name" "$CONTACTS_FILE" || echo "No match found."
}

delete_contact() {
  list_contacts
  read -p "Enter line number to delete: " num
  sed -i "${num}d" "$CONTACTS_FILE"
  echo "Contact deleted!"
}

while true; do
  echo
  echo "=== Contact Manager ==="
  echo "1) Add contact"
  echo "2) Search contact"
  echo "3) Delete contact"
  echo "4) List contacts"
  echo "5) Exit"
  read -p "Choose (1-5): " choice

  case $choice in
    1) add_contact ;;
    2) search_contact ;;
    3) delete_contact ;;
    4) list_contacts ;;
    5) echo "Goodbye!"; break ;;
    *) echo "Invalid option." ;;
  esac
done
