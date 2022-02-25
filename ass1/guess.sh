#!/bin/bash

arr=(red blue orange green pink yellow black white purple grey)
color1=${arr[RANDOM%${#arr[@]}]}
for each in 1 2 3
do
 read -p "CHANCE $each guess the color: " color2
 if [ "$color2" = "$color1" ]
 then 
   echo "yeahhh! you guessed it correct in $each chance"
 else
   echo "oops! better luck next time"
 fi
done 