if [ $# -eq 1 ]; then
	> data/ipmi/$1
	while read line; do
		./ping.sh $line
		./ipmi.sh $line $1 1
	done < data/addresses/$1
fi

if [ $# -eq 2 ]; then
	./ping.sh $1 $2
	./ipmi.sh $1 $2
fi
