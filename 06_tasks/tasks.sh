tasks=();
while true; 
do
	echo -e "\n\n_________Todo List__________"
	echo -e "\n1.Add a new Task"
	echo -e "\n2.View all Tasks"
	echo -e "\n3.Delete a Task"
	echo -e "\n4.Store tasks in file(todo.txt)"
	echo -e "\n0.Exit"
	echo -e "\n\nSelect and Option(1...4) :"

	read option

	case $option in
		0)
			clear
			break
			;;
		1)
			echo -e "\n\nEnter the task : "
			read task
			tasks+=("$task")

			clear
			;;
		2)
			echo -e "\n\n____Tasks List_____"	
			for(( i = 0; i < ${#tasks[@]} ; i++ ))
			do
				echo -e "\n$i.${tasks[$i]}"
			done
			;;
		3)
			echo -e "\n\nEnter the task number to delete : "
			read task


			unset "tasks[$task]"
			tasks=("${tasks[@]}")

			clear
			;;
		4)
			touch todo.txt
			echo "" > todo.txt
			for(( i = 0; i < ${#tasks[@]}; i++ ))
			do
				echo -e "\n$i.${tasks[$i]}" >> todo.txt
			done

			echo -e "\n\ntasks are now written in file : todo.txt"
			;;
			
	esac

done
