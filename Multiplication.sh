#!/bin/bash
# perform multiplication of two numbers

echo .Enter the First Number: . 
read a 
echo .Enter the Second Number: . 
read b 
echo "$a * $b = $(expr $a \* $b)"
