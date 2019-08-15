#!/bin/bash
# print list of fibonacci sequence numbers

echo .Enter The Number up to which you want to Print: . 
read N 
  
# First Number of the 
# Fibonacci Series 
a=0 
  
# Second Number of the 
# Fibonacci Series 
b=1  
   
echo "The Fibonacci series is : "
   
for (( i=0; i<N; i++ )) 
do
    echo -n "$a "
    fn=$((a + b)) 
    a=$b 
    b=$fn 
done
