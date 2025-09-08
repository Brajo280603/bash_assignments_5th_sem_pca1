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
			
			if $(first -gt second); then
				echo -e "\n$first - $second = $((first-second))"
			else
				echo -e "\n$first is smaller than $second"
			fi

			
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
			echo -e "\nEnter the Second Number :"
			read second
		
			
			if $(first -gt second); then
				echo -e "\n$first / $second = $((first/second))"
			else
				echo -e "\n$first is smaller than $second"
			fi
			;;
		*)
			echo -e "\nInvalid Option"
	esac
done
