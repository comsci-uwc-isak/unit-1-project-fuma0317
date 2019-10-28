9/24 19
Reflection
Today, I identified the input and output of various program and list up the steps which shows how I make this app step by step
And also, I saw the expalanation of car rental.
What I learned is that how to indentify the input and output and I felt this process is really important before you make a program.  I learned that steps should be understandable for people wh don't know how to code.

**installation program
```
#!/bin/bash

#This file creates the folder structure for the
#minimal Car Rental App

echo "Starting the installation"
echo "Press Enter"

read

#moving to desktop
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
```
**9/27 19

Reflection
Today, I reviewed how to use for loop through making the system which shows the frame and also learned how to repeat for loop.



#frame program


**Friday hw repeat 0123 and stop at the count user typed

```
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
```

**Friday hw greet with full name

```
#!/bin/bash

#This program is for greeting the user with his full name.

#get full name


echo "Hello $USER!!"
```

**Reflection/ 10/02/2019

Today, I presented my coodings for proposing the solution for editing system.
And I found a lot of issues such as how to use single argument or how to label each file to make it easier to select the file.

**Program for changing the name of car file

```
#edit the file
echo "If you want to edit the name of file, please type EDIT"
read res
if [$res = EDIT]; then
    cd ~/Desktop/RentalCarApp/db/maincarfile.txt
    echo ls
    echo "Please select the file you want to edit with Plate, Model, Color, PP"
    read file
fi
if [ -e $file ]; then
    echo "Please rename the file with Plate, Model, Color, PP"
    read rename
    mv $file $rename

    else echo "$file NOT found"
fi
```

**Test program for create.sh

```
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
```
**HW delete program for car data

```
#!/bin/bash

#This program is for deleting a single car file

#moving to database file
cd ~/Desktop/RentalCarApp/db/

#get argument of plate and check if it exits and delete the car file
plate=$1

if [[ ($# -ne 1) ]];then
	echo "Input is wrong, please type Plate again"


elif [ ! -f "$1.txt" ];then
	echo "The file don't exis. Please try again"

else 
	rm $1.txt
	echo "The file was successfully deleted"
fi


#delete whole line which includes the plate
sed -i '' "/$1/d" maincarfile.txt
echo "The car information was successfully deleted"
```
**HW test program for installation
```
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
```
**Summary program for calculating the total km
```
#!/bin/bash

#This program is for summarizing car data
bash frame.sh Summary
#get argument from user first
if [ $# -ne 1 ];then
  echo "Enter a license number"
  exit
else
    #check that car file exits
    cd ../db/
    if [ ! -f "$1.txt" ];then
      echo "File not found"
      exit
    else
      #caluculate the total km
      echo "File exits. Starting summary"
      while read line;
        do
          for km in $line
          do
            (( total=$total+$km ))
            break
          done
        done < "$1.txt"
#Show result nicely
cd ../scripts/
bash frame.sh "Tottal distance traveled for $1 was $total"
exit
fi
fi
```
**Reflection 10/9/2019**
Today I made the summary program for calculating the total km of single car.
I reviewed how to use while loop and for loop and also how to check if the file exits.  I remembered them almost all of them so i felt I made some progress.

**Reflection 10/28/2019**
Q1.What skill have you developed so far?
	I have learned so many basic skills such as many ways to use for loop, ways to use if and some commands which is 	RANDOM, seq..
Q2.What have worked for you in the classroom of cs?
	Dr.Ruben's advice always helped me whenever I asked some questions. 
Q3.What are some things strategies that you would change in the cs classroom to achieve your best in the next 6 weeks?
	For me, the style we did today is favorite which some of HL sttudents propose the solution to us and teacher teachs the give some advices about it.





