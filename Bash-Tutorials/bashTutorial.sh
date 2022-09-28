## TUTORIAL: https://www.freecodecamp.org/news/shell-scripting-crash-course-how-to-write-bash-scripts-in-linux/

## CHEATSHEET: https://devhints.io/bash

## which bashto know the path of shebang 
#! /bin/bash
## chmod u+x filename.sh to add execution rights (x) to user (u)
echo Hello World

## we set variables with the = sign. To call a variable we use $
hello=Hello
world=World

echo $hello $world

## Arithmetic expressions
expr 2 + 2
var=$((3+9))
echo $var

##  We can take user input using the read command
## To prompt the user with a custom message, use the -p flag

read -p "Enter your age: " age
echo $age

echo "Enter a number"
read number
echo $number


## Logical Operators
# Equality	num1 -eq num2
# Greater than equal to	num1 -ge num2	
# Greater than	num1 -gt num2
# Less than equal to	num1 -le num2
# Less than	num1 -lt num2
# Not Equal to	num1 -ne num2

if [ $number -gt $age ]
then echo Number is greater than Age
elif [ $number -lt $age ]
then echo Age is greater than Number
elif [ $number -eq $age ]
then echo Both Age and Number are the same!
fi

# IF STATEMENTS:

# if...then...fi statements
# if...then...else...fi statements
# if..elif..else..fi
# if..then..else..if..then..fi..fi.. (Nested Conditionals)

# To create meaningful comparisons, we can use AND -a and OR -o as well.

a=1 b=2 c=3
if [ $a == $b -a $b == $c -a $a == $c ]
then
echo EQUILATERAL

elif [ $a == $b -o $b == $c -o $a == $c ]
then 
echo ISOSCELES
else
echo SCALENE

fi


## LOOPING
# numbers:
for i in {1..3}
do
    echo $i
done

# strings:
for X in cyan magenta yellow  
do
	echo $X
done


## WHILE LOOPS
i=1
while [[ $i -le 3 ]] ; do
   echo "$i"
  (( i += 1 ))
done

## READING FILES
# line by line
LINE=1
while read -r CURRENT_LINE
	do
		echo "$LINE: $CURRENT_LINE"
    ((LINE++))
done < "sample.txt"

# all at once
cat sample.txt | while read line; do
  echo $line
done

#########################
# Open JSON file
cat test.json | jq '.[]'

# -c option uses with jq command to print each JSON object in each line
cat test.json | jq -c '.[]'
