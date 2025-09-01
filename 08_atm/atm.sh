balance=0
while true;
do
	echo -e "\n\n_______Welcome To the ATM__________"
	echo -e "\nCurrent Balance : ₹$balance"
	echo -e "\n1.Withdraw"
	echo -e "\n2.Deposit"
	echo -e "\n0.Exit"
	echo -e "\nChoose and Option:"
	
	read choice
	case $choice in 
		0)
			clear
			break
			;;
		1)

			if (( balance <=  0 ));then
				echo -e "\nTransaction Failed! : Not Enough Balance"
			else
				echo -e "\nEnter the Amount: "
				read cash
				if (( balance - cash < 0 ));then
					echo -e "\nTransaction Failed! : Not Enough Balance"
				else
					echo -e "\nTransaction Successful!"
					((balance -= cash))
					echo -e "\nCurrent Balance: $balance"
				fi
			fi
			;;
		2)
			echo -e "\nEnter the Amount: "
			read cash
			
			((balance += cash))
			echo -e "\nTransaction Successful!"
			echo -e "\nCurrent Balance: $balance"
			;;
		*)
			echo -e "\n\nInvalid Option"
			;;
	esac
done
