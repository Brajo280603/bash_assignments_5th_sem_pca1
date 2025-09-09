while true;
do
	echo -e "\n\n_________Calculator_________"
	echo -e "\n1.Addition"
	echo -e "\n2.Subtraction"
	echo -e "\n3.Multiplication"
	echo -e "\n4.Division"
	echo -e "\n0.Exit"
	echo -e "\nChoose An Option: "

	read user
	case $user in
		0)
			clear
			break
			;;
		1)
			echo -e "\nEnter the First Number :"
			read first
			echo -e "\nEnter the Second Number :"
			read second

			echo -e "\n$first + $second = $((first+second))"
			;;
		2)
			echo -e "\nEnter the First Number :"
			read first
			echo -e "\nEnter the Second Number :"
			read second
			

			echo -e "\n$first - $second = $((first-second))"
			;;
		3)
			echo -e "\nEnter the First Number :"
			read first
			echo -e "\nEnter the Second Number :"
			read second

			echo -e "\n$first x $second = $((first*second))"
			;;
		4)
			echo -e "\nEnter the First Number :"
			read first
			first="${first}.0"
			echo -e "\nEnter the Second Number :"
			read second
			second="${second}.0"
		
			division=$(echo "scale=3;$first / $second" | bc -l )
			echo -e "\n$first / $second = $division"

			;;
		*)
			echo -e "\nInvalid Option"
			;;
	esac
done
