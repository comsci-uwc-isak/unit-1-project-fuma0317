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
    echo "Input is wrong, please type Plate, kilometers, dateout and datein. Please try again"

elif [ ! -f "$1.txt" ];then
    echo "The file don't exist, please create a car file first"

else
    echo "$plate $km $dateout $datein" >> $plate.txt
    echo "Trip data was successfully recorded"
fi
