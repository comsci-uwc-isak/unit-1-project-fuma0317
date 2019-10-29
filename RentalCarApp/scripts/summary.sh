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









