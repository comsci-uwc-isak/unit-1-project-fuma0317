#!/bin/bash

#This file test the first success criterion, namely,
#A car can be created and stored in the database

#Step 1: create a car using the script create 
cd ../
bash create TXM301 nissan red 9

#Step 2: check that the license file .txt was created 
if [ -f "Database/TXM301.txt" ]; then
	echo "Test one: a txt file was created inside the database: passed"
else 
	echo "Test one: Error. File not found: not passed"
fi 

#Step 3: Check that the car was added to the main file
cat Database/maincarfile.txt
lastline=$( tail -n 1 Databse/maincarfile.txt )
echo $lastline
if [ "TXM 301 nissan red 9" == $lastline ]; then
	echo "Test two: Record was entered correctly: passed"
else
	echo "Test two: Failed"
fi
