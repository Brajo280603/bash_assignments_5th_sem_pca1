echo -e "\n\nThis is the present location : $(pwd)"

userName=$(whoami)

mkdir "$userName"

echo -e "\nEnter the file name:"

read fileName

touch "$userName/$fileName"

echo -e "\nWrite something in that file : Press CTRL+D to stop"

cat > "$userName/$fileName"

echo -e "\nFile saved at './$userName/$fileName' Successfully"

echo -e "\n File Details : "
file "./$userName/$fileName"

