#!/bin/sh

if [ "$#" -ne 2 ]; then
	echo "how to use: $0 <int1> <int2>"
	exit 1
fi

num1=$1
num2=$2

echo "==result=="
echo "sum ($num1 + $num2) = $(($num1+$num2))"
echo "sub ($num1 - $num2) = $(($num1- $num2))"
echo "mul ($num1 * num2) = $(($num1* num2))"
if [ "$num2" -eq 0 ]; then
	echo "div ($num1/$num2) = cannot divide"
else
	echo "div ($num1 / $num2) = $(($num1/$num2))"

fi
