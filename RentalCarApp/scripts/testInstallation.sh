#!/bin/bash
# This file test the function of installation 

#Step 1: check if RentalCarApp exits
cd ~/Desktop/
if [ -f "RentalCarApp" ];then
	echo "Test one: RentalCarApp file was created in Desktop: passed"
else
	echo "Test one: Error. File not found: not passed"
fi

#Step 2: check if db file exists
cd ~/Desktop/RentalCarApp/
if [ -f "db" ];then
	echo "Test two: db file was created in RentalCarApp file: passed"
else
	echo "Test two: Error. File not found: not passed"
fi

#Step 3: check if scripts file exists
cd ~/Desktop/RentalCarApp/
if [ -f "scripts" ];then
	echo "Test three: scripts file was created in RentalCarApp file: passed"
else
	echo "Test three: Error. File not found: not passed"
fi
