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
