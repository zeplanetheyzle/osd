#!/bin/sh
if [ "$#" -lt 2 ]; then
	echo "how to use: $0 <Float1> <Float2> [Float3 ... ]"
	echo "enter at least two"
	exit 1
fi

echo "==y = 0.5 x2=="
for X in "$@"; do 
	Y=$(echo "0.5 * ($X * $X)" | bc)
	echo "x = $X"
	echo "y = $Y"
done
