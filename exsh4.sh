#!/bin/bash

# author: ENO
# email: edgaroliveira.dev@gmail.com
# date: 24/09/2016
# Check if your bar code or contributor number it is real

validate_number () {
	# Check if the number have exactly nine digits and has only number assigned in this variable 
	if [ ${#1} == 9 ]
	then
		re='^[0-9]+$'
		if [[ $1 =~ $re ]]
		then
			## echo "congratulations"
			string_to_array $1
		else
			echo "please choose only characters numeric"
		fi
	else
		echo "Please choose a number with nine digits"
	fi
}

# put the $number in array
# add all result obtained in last point -> sum_number
string_to_array () {
	word=$1
	# multiple first position by nine, second position by eight, etc, until octave position which multiple by two
	decreasing=9
	# is needed set this value on first loop, see more detail into loop
	last_number=0
	# count how many letters has the word chosen to by user
	# less last position on the array because I don't need this position
	for (( i=0; i<${#word}-1; i++ )); do
	# for each letter, in each cycle, put the letter of the respective index in array
	# the word:1:1 means, read from the first index (letter) and give me only first letter
	# the word:2:3 means, read from the second index (letter) and give me three letter following
	array[$i]=${word:$i:1}
		# for each position on array write your value
		## echo "${array[$i]}"
		# the multiplication and write this result
		value=$((${array[$i]}*$decreasing))
		## echo "the multiplication is $value"
		# this value corresponding of the sum with last value after multiplication
		last_number=$(($value+$last_number))
		## echo "so far the total is $last_number"
		# once the algorithm necessary sum the number in position array with number in decreasing it is necessary this variable to counteract the cycle
		((decreasing--))		
	done
	# last but not least, call function check_digit to check the remainder, see more details below
	check_digit $last_number
}

# get remainder of division between $sum_number and eleven -> remainder
check_digit () {
	# calculate the remainder of the division by eleven
	remainder=$(($1%11))
	# check the result
	# if the result of the remainder is less than two, the remainder is the check digit
	if [[ $remainder < 2 ]]; then
		## echo "the last digit is $remainder"
		# call function to validate the last digit
		check_last_number $remainder
	else
		# if not the check digit it is obtained by eleven minus remainder -> remainder
		last_digit=$((11-$remainder))
		## echo "the last number is $last_digit"
		# call function to validate the last digit
		check_last_number $last_digit
	fi
}

# check if the last_digit calculate in function check_digit correspondy with the last digit digited by user
check_last_number () {
	if [[ $1 == ${number:8:1} ]]; then
		echo "your number, \"$number\", it is valid!"
	else
		echo "unfortunately your number it is invalid! Please try again"
	fi
}

# main body
echo "Please digit your number, exactly nine digits"
read number
validate_number $number

