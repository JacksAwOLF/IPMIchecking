subnet=${1%.*}
from=${1##*.}
to=${2}
time=${3}
time=2

echo "checking ping from $subnet.$from to $subnet.$to"

sudo ifconfig en6 $subnet.222 netmask 255.255.255.0 

for ((c=$from; c<=$to; c++))
do
	echo `ping -c $time -W 1 $subnet.$c` | grep "0 packets received" > /dev/null
	if [ $? -eq 0 ]
	then
		echo "ping fail $subnet.$c"
	fi
done
