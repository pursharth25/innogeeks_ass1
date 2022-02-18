#!/bin/bash

users=(1123 4323 1075 2315 6719 5422)
len=${#users[@]}

read -p "Enter password : " password
for (( i=0; i<${len}; i++ ));
do
if [[ "$password" -eq ${users[$i]} ]]
 then 
   echo "WELCOME, we are happy to have you"
   break
 else
   echo "PASSWORD INCORRECT!"
   break
 fi
done