subnet=${1%.*}
from=${1##*.}
to=${2}
outputFile=${3}

# default output file is this
if [ "$3" == "" ]; then
	outputFile=output
fi

# default is to clear the output file
if [ "$4" == "" ]; then 
	> data/ipmi/$outputFile
fi
#echo $outputFile
echo "checking IPMI info from $subnet.$from to $subnet.$to"

for ((c=$from; c<=$to; c++))
do
	sucess=false
	while read line; do
		user=${line% *}
		password=${line#* }
		#echo $user $password
		if `ipmitool -I lanplus -H $subnet.$c -U $user -P $password -R 1 -N 1 lan print > /dev/null 2>&1`; then
			sucess=true
			echo "$subnet.$c $line" >> data/ipmi/$outputFile
			break
		fi
	done < data/ipmi/credentials
 
	if [ "$sucess" == "false" ]; then
		echo "ipmi fail $subnet.$c"
		echo "$subnet.$c" >> data/ipmi/$outputFile
	fi
done
