echo -e "\n\nSet Timer (in Seconds) : \n"

read timerSec

for ((i = timerSec; i >= 0; i--))
do
	sleep 1
	echo -e "\nremaining : $i sec"
done

echo -e "\nTime's up!"
