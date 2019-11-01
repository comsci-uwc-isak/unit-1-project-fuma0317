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
