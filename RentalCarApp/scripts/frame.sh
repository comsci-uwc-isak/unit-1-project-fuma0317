#!/bin/bash

echo "enter"

#this code reads argument, which is bash frame *argument
word=$1


for (( i=0; i<100; i++ ))
do
echo -n "*"
done
echo " "



echo -n "*"


for (( i=1; i<99; i++ ))
do
	echo -n " "
done
echo -n "*"
echo " "

len=${#word}
(( spacing=(100-$len)/2 ))

echo -n "*"
for (( i=1; i<$spacing; i++))
do
	echo -n	" "
done

echo -n $word
#page 1




for (( i=( 100-$spacing ); i<99; i++))
do
	echo -n " "
done

(( odd=($spacing+$spacing+$len) ))
if [ $odd -eq 99 ]; then
echo -n " "
fi
echo -n "*"


echo " "
echo -n "*"
for (( i=1; i<99; i++ ))
do
        echo -n " "
done
echo -n "*"
echo " "

for (( i=0; i<100; i++ ))
do
echo -n "*"
done
echo " "

