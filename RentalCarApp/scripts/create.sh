#!/bin/bash
# sep 30
#This program is for creating and recording about cars

if [ $# -ne 4]; then
	echo "Wrong input. Please enter Plate Model Color Passsengers"
	exit 1
fi

#number of arguments is correct. Continue
plate=$1
model=$2
color=$3
pp=$4

#adding new entry to file maincarfile.txt
echo "$plate $model $color $pp" >> ~/Desktop/RentalCarApp/db/maincarfile.txt
echo "" > ~/Desktop/RentalCarApp/db/"$1.txt"
bash frame.sh "Car created successfully"

