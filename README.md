![CarRental](logo.png)
```.py
Marks=19
Demo=4
Total=(Marks+Demo)=23
```
**Graded on Nov 6**

Car Rental Minimal App
===========================

A car rental management minimal app in Bash.

Contents
-----
  1. [Planning](#planning)
  1. [Design](#design)
  1. [Development](#development)
  1. [Evalution](#evaluation)

Planning
----------
** Defining the problem (Topic 1.1.1)**
100-150 words explaining the context of the problem

I felt before we make this app, we should identify what does "simple based program". I mean to what extent should it be simple.   Unless we identify the world, programmer might be struggling how to simplify the code.

Secondable, when you correct the trip history with the place name, the data probably become wrong because in the case that customers uses a ferry to go across the ocean and park your car on it, the distance might be diffrent from actual one.

Third, if you want to make the file deletable, you should make a autmatical back-up system which automatically save the data after you edit it. 

### Solution proposed
Rationale for proposed solution

I decided that choosing bash would be the best solution for Car rental app because bash is a kind of shells cript and it can be made in terminal which is really familiar with us and also even if you use windows you can download it easily.
And it is easy to understand the structure for beginners.


### Success Criteria
This are measurable outcomes
1. A car can be created and stored in the database 
1. A car information can be edited 
1. A car can be deleted from the database
1. The installation is ***simple-> one step process***.
1. A summary (total/average distance traveled) can be generated for a particular car
1. Trips can be recorded and stored for an existing car
1. A basic database system is implemented
1. A basic backup functionality is avialable.

**Criterion A**

|Level|Descriptor|
|----|-----|
|4|The client in the car rental office is identified and his situation is stated. The rationale for choosing the proposed product is partially explained and includes some appropriate criteria for evaluating the success of the product.|
```.sh
Rational
* You can improve this criterion by solving the following questions about the context: Who is the client?
Why is the product being developed?
* One more justificaiton for using BASH is that we were learning it. 
* Research on the internet other features of BASH that makes it a good choice for this system
* One more justificaiton for using BASH is that we were learning it.
```

Design
---------
### First sketch of the system
![systemDiagram](IMG_2213.JPG)

This is the testing plan
![testingplan](IMG_0179.JPG)

## Criterion B
|**level**|**Description**|
|-----|------------|
|7|An outline test plan is included but partially complete. A system diagram and some flow diagrams for algorithms in the product are included. They provide a basic understanding of how the product was developed.|
```.sh
Rationale
* Great job with the flow diagrams and the system diagram.
* You are losing marks in this criterion because you did not include the figure captions and the descriptions after every figure. The figure caption is: "Fig. 1. Diagram of the system showing the hardware and software components."
The description is a paragraph that explains the figure and tells the reader why you included the figure: "As seen in Fig. 1. the system proposed for the CarRentalApp consist of ..."
```

Development
--------
### 1. Script to install the app
The following script creates the folder structure
1. Move to Desktop
1. Create file "RentalCarApp" and go inside
1. Create db and scripts file inside

```
#!/bin/bash

#This file creates the folder structure for the 
#minimal Car Rental App

echo "Starting the installation"
echo "Press enter to continue installation"

read 

#moving to the desktop
echo "Files will be created in DESKTOP"
echo "moving to desktop"

#Check for correct change directory
cd ~/Desktop

#Create App folder
mkdir RentalCarApp 

cd RentalCarApp

#Create folder for database and scripts
mkdir db 
mkdir scripts

bash frame.sh "structure created successfully"
exit
```
### 2. script to uninstall the app
The following script delete the file of app
1. get input from user (do you want to uninstall yes or no)
1. if it's yes, remove the app
1. if it's no, just exit

flow diagram for unistall.sh
![flowDiagramUN](IMG_0178.JPG)

```
#!/bin/bash
#This program uninstalls the app
echo "Would you like to uninstall CarRentalApp? Type yes or no and press enter"
read cho
if [ $cho == yes ]; then
	echo "Uninstalling file"
	rm -r ~/Desktop/CarRentalApp/
	bash frame.sh "UNINSTALLED SUCCESSFULLY"
else
	echo "The file will be not uninstalled"
	exit
fi
```
### 3. script to create car and its file
The following script creates car and its txt file
1. get input from user(license plate, model, color, passengers)
1. record the sentence in maincarfile.txt
1. create car file

flow diagram for create.sh
![flowDiagramCR](IMG_0156.JPG)
```
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
```
### 4. script to record the car info in its file
The following script records car info in its file
1. get input from user(license plate, km, dateout, datein)
1. move to database
1. check if the info exits
	if it does, record it in $plate.txt
	if it doesn't, exit
```
#!/bin/bash
#This program is for recording the trip data
#Write the data into main

plate=$1
km=$2
dateout=$3
datein=$4

#moving to creation folder
cd ~/Desktop/RentalCarApp/db/

#get 4 arguments and check if the exits and record the data in it
if [[ ($# -ne 4) ]];then
    echo "Input is wrong, please type Plate, kilometers, dateout and datei. Please try again"

elif [ ! -f "$1.txt" ];then
    echo "The file don't exist, please create a car file first"

else
    echo "$plate $km $dateout $datein" >> $plate.txt
    echo "Trip data was successfully recorded"
fi
```
### 5. script to delete car and its file
The following script deletes car and its file
1. get input from user(license plate)
1. check if the car file exits
	if it does, show remove the file
	if it doesn't, show "please try again"
1. delete the line includes the licensse plate in maincarfile.txt
```
#!/bin/bash

#This program is for deleting a single car file

#moving to database file
cd ../db/

#check that argument was provided
#get argument of plate and check if it exits and delete the car file
plate=$1

if [[ ($# -ne 1) ]];then
	echo "Input is wrong, please type Plate again"
elif [ ! -f "$1.txt" ];then
	echo "The file don't exis. Please try again"
else 
	rm $1.txt
	bash frame.sh "The file was successfully deleted"
	#delete whole line which includes the plate
	sed -i '' "/$1/d" maincarfile.txt
	bash frame.sh "The car information was successfully deleted"
fi
exit 
```
### 6. script to edit the car info
The following script edits car info
1. get input from user(license plate, model, color, passengers)
1. check if $license.txt exists
	if it doesn't, exit
1. delete the sentence includes the license plate
1. record new car info
```
#!/bin/bash
#This program edit the information of an exiting car in the maincarfile
#user enters [license plate] [model] [color] [pp]

if [ $# -ne 4 ]; then
	echo "Error with the number of arguments"
	echo "Enter License plate, Model, Color, Passengers"
	exit
fi

license=$1
model=$2
color=$3
pp=$4

cd ../Database

if [ ! -f "$license.txt" ]; then
	echo "File not found!"
fi

#find the line with the given car plate and delete it
sed -i '' "/$license/d" maincarfile.txt
#add the new information
echo "$license $model $color $pp" >> maincarfile.txt
cd ../scripts
bash frame.sh "CAR EDITED SUCCESSFULLY"
```
### 7. script to summarize total km for one and all cars
The following script summarize total km for one and all cars
1. move to database
1. check if the argument user typed is right
	if it doesn't, exit
1. calculate km for all cars ttyped as arguments
1. check if $file.txt exists
	if it doesn't, exit
1. calculate km for one car
```
#!/bin/bash
#This program adds kilometers in car.txt file

#moving to right location
cd ..
cd db
#checking arguments user typed is right
if [$# -ne 1]; then
    echo "plese type license plate"
        ls
    exit
fi

file=$1

#show total distance for all cars user typed as arguments
if [ $file == all]; then
    #calculating total distance
    total=0
    #this loops through all the txt files in folder
    for f in *.txt;
    do
    #this is for avoiding maincarfile.txt
    if [[ ($f == "maincarfile.txt") ]]; then
        continue
    fi

    while read line;
    do
        #for loop for going through line word by word
        for km in $line
        do
            (( total=$km+$total ))
            break
        done
    done < "$f"
done

#show the results with frame
cd ..
cd scripts
bash frame.sh "TOTAL DISTANCE TRAVELED BY ALL CARS: $total"
exit

elif [ ! -f "$file.txt" ]; then
    echo "File for car $file does not exist"
    exit
fi

#calculating total distance for one car
total=0
#while loop for reading the file
while read line;
do
    #for loop for going through line word by word
    for km in $line
    do
        (( total=$km+$total))
        break
    done
done < "$file.txt"

#show the results with frame
cd ..
cd scripts
bash frame.sh "TOTAL DISTANCE TRAVELED BY $file: $total"
```
### 8. script to backup the app
The following script backups the app
1. get input from user(desired location)
1. check if the argument user typed is right 
	if it does, copy the app and paste it on desired locaiton
	if it doesn't, exit

flow diagram for backup.sh
![flowDiagramBa](IMG_0157.JPG)
```
#!/bin/bash

#This program backups the database folder in the MinimalCarRentalApp

location=$1

#check if argument user typed is one digit
if [[ $# -ne 1 ]]; then
	echo "ERROR... Please try again"
	exit
else
	#copy database
	cp -a ~/Desktop/RentalCarApp/db $location
	echo "Successfully backed up into $location"
fi
```
MANPAGES
----------
### 1.manpage for install.sh
```
.TH man 6 "31 Oct 2019" "1.0" "install man page"
.SH NAME
install \- install app
.SH SYNOPSIS
bash install.sh 
.SH DESCRIPTION 
install is a script that installs app
.SH EXAMPLES
bash install.sh
.SH AUTHOR
Programmer_Fuma Ito
```
### 2.manpage for create.sh
```
.TH man 6 "28 Oct 2019" "1.0" "create man page"
.SH NAME
create \- create a new car
.SH SYNOPSIS
bash create.sh [license] [color] [passengers]
.SH DESCRIPTION
create is a script that creates a new record in the database
.SH EXAMPLES
bash create.sh LXH798 Mazda Red 3
.SH AUTHOR
Programmer_Fuma Ito
```
### 3.manpage for record.sh
```
.TH man 6 "31 Oct 2019" "1.0" "record man page"
.SH NAME
record \- record a car
.SH SYNOPSIS
bash record.sh [license plate] [km] [date out] [date in]
.SH DESCRIPTION
record is a script that records a record in the database
.SH EXAMPLES
bash record.sh 123 45 2019/10/2 2019/10/9
.SH AUTHOR
Programmer_Fuma Ito
```
### 4.manpage for edit.sh
```
.TH man 6 "31 Oct 2019" "1.0" "edit man page"
.SH NAME
edit \- edit a car
.SH SYNOPSIS
bash edit.sh [license plate] [model] [color] [passengers]
.SH DESCRIPTION
edit is a script that edits a record in the database
.SH EXAMPLES
bash edit.sh 123 toyota red 4
.SH AUTHOR
Programmer_Fuma Ito
```
### 5.manpage for deletecar.sh
```
.TH man 6 "31 Oct 2019" "1.0" "delete man page"
.SH NAME
delete \- delete a car
.SH SYNOPSIS
bash deletecar.sh [license plate]
.SH DESCRIPTION
delete is a script that deletes a record in the database
.SH EXAMPLES
bash deletecar.sh LXH798
.SH AUTHOR
Programmer_Fuma Ito
```
### 6.manpage for summary.sh
```
.TH man 6 "31 Oct 2019" "1.0" "summary man page"
.SH NAME
summary \- summarize a car or all cars
.SH SYNOPSIS
bash summary.sh [license plate]
.SH DESCRIPTION 
summary is a script that summarize a record in the database
.SH EXAMPLES
bash summary.sh LXH798
.SH AUTHOR
Programmer_Fuma Ito
```
### 7.manpage for backup
```
.TH man 6 "31 Oct 2019" "1.0" "backup man page"
.SH NAME
backup \- backup app
.SH SYNOPSIS
bash backup.sh [desired location]
.SH DESCRIPTION
backup is a script that backups app in location that you want to save
.SH EXAMPLES
bash backup.sh ~/Desktop/kb
.SH AUTHOR
Programmer_Fuma Ito
```

## Criterion C
|**level**|**Description**|
|-----|------------|
|5|The proposed solution is characterized by the appropriate use of existing tools. The techniques are adequate for the task and their use is explained. All sources are identified.|
```.sh
Rationale
* Neat work here Fuma
* One thing you can improve is to research a bit about ManPages and explain what they are/who use them before showing your own manpages.
* You can also include the citations to the references of the sources that you researched in the internet using MLA format. For example: "As shown in [1], to read a file in bash we can use:"  then the reference in the bottom of the document in the References section: [1] Pinzon, Ruben. "Read files in bash", ..... 
```


Evaluation
-----------
Test 1:
First run of the test file was unsuccessful because the Database folder was not existent.  
Also the create program did not store the license file inside the Database folder.  Changing the line `echo " " > $license.txt to `echo 
```.sh
cd ../
```
This is necessary because the `create.sh` resides in the ain folder whereas the test file is inside the /tests folders.
To check that the car was created in the main file (maincarfile.txt), the folowing command is used `lastLine = $( tail -n 1 Database/maincarfile.txt )` which is used for setting the last line at the end of the file in valuable.
`""` is used for recognizing itself as one sentence

### Evaluate success criteria
**1. A car can be created and stored in the database**
	
 ***YES*** -the command is (bash create.sh Plate, Model, Color, PP) and plate.txt file and maincarfile.txt were created
	
**2. A car information can be edited**
	
 ***YES*** -the command jumps to edit (bash edit.sh Plate, Model, Color, PP) plate.txt and entry in maincarfile were replaced
 
**3. A car can be deleted from the database**

 ***YES*** -the command jumps to delete (bash deletecar.sh Plate) plate.txt file and entry in maincarfile were deleted
 
**4. The installation is simple**

 ***YES*** -the command starts installation (bash install.sh) it's pretty simple because users just press enter
 
**5. A summary can be generated for a particular car**

 ***YES*** -the command jumps to summary (bash summary.sh Plate) total km for one and all cars were calculated and printed
 
**6. Trips can be recorded and stored for an existing car

 ***YES*** -the command jumps to record (bash record.sh Plate, Km, Dateout, Datein) information about car were added to plate.txt
 
**7. A basic database system is implemented**

 ***YES*** -all data were properly saved and stored in database file
 
**8. A basic backup functionality is available**

 ***YES*** -all data were backed up in desired location 


	

**Summary:** 
What types of test we did today is that White-box testing.  We firstly create the demo file for testing and then create the program for checking if the file exists or not. And after that, check if the car file was actually added to to the main file by comparing the last line of main file and content of car file.   

## Criterion D
|**level**|**Description**|
|-----|------------|
|3|The product is partially evaluated against the success criteria identified in criterion A. Recommendations for further improvement of the product are largely realistic.
|
```.sh
Rationale
* You evaluation of the success criteria is sufficient however, you are missing marks because you did not include the section for Future Improvements. This is basically a reflection about the limitations of your solution and how it could be improved or extended.
```

