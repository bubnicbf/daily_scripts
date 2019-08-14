#!/bin/bash
# checks if a number input from standard input is odd or even

echo "Enter The Number" 
read n 
num=$(expr $n % 2) 
if [ $num -eq 0 ] 
then 
echo "is a Even Number" 
else 
echo "is a Odd Number" 
fi


