9/24 19
Reflection
Today, I identified the input and output of various program and list up the steps which shows how I make this app step by step
And also, I saw the expalanation of car rental.
What I learned is that how to indentify the input and output and I felt this process is really important before you make a program.  I learned that steps should be understandable for people wh don't know how to code.

**installation program

#!/bin/bash

#This file creates the folder structure for the
#minimal Car Rental App

echo "Starting the installation"
echo "Press Enter"

read

#moving to the desired location
echo "moving to desktop"

#Check for correct change directory
cd ~/Desktop

#Create App folder
mkdir RentalCarApp
cd RentalCarApp

#Create folder for database and scripts
mkdir db
mkdir scripts
echo "structure created successfully"

**9/27 19
Reflection
Today, I reviewed how to use for loop through making the system which shows the frame and also learned how to repeat for loop.



#frame program


**Friday hw repeat 0123 and stop at the count user typed

#!/bin/bash

#This program is for repeating the pattern 0123 0123, for a length of n numbers

#get the randam number from user
declare -i num
echo "Please type one integer"
read num

#show the sequence
declare -i it
declare -b bo

bo=true
while [[ $bo ]]; do
	for i in $(seq 0 3);do
		echo $i
		((it++))
		if [[ $it -eq $num  ]];then
			exit 1	
		fi
	done
done

**Friday hw greet with full name

#!/bin/bash

#This program is for greeting the user with his full name.

#get full name


echo "Hello $USER!!"

**Reflection/ 10/02/2019
Today, I presented my coodings for proposing the solution for editing system.
And I found a lot of issues such as how to use single argument or how to label each file to make it easier to select the file.		

