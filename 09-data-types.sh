#!/bin/bash

var1=10
var2=20

echo "$var1 + $var2 = $((var1 + var2))"
echo "$(($var1 + $var2))"

declare -i COUNT=10 #I am declaring as integer
COUNT=COUNT+1 #incrementing the value of COUNT by 1
echo "Count is: $COUNT"

FRUITS=("Apple" "Banana" "Mango" "Grapes") #This is an array 
echo "Fruits are: ${FRUITS[@]}"
echo "First fruit is: ${FRUITS[2]}"