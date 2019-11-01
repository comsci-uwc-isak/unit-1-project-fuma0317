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

echo "structure created successfully"
exit
