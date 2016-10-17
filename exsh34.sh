#!/bin/bash

# author: ENO
# email: edgaroliveira.dev@gmail.com
# date: 17/10/2016
# Numbers primes of the any one number, factorize this number

########################################################
################# MAIN FUNCTIONS #######################
########################################################

validate_number () {
	# if the variable has different characters of digits
	re='^[0-9]+$'
	if [[ $1 =~ $re ]]
	then
		factorize $1
	else
		echo "please choose only characters numeric"
	fi	
}

factorize () {
	# assign value passed through parameter to variable
	number=$1
	# assign and initialize variable divider with value 2
	divider=2
	# while denominator is smaller or equal than the numerator
	while (( $divider <= $number )) 
	do
		if [ $((number%divider)) != 0 ] # the rest of division different a zero
		then
			# increment plus value in divider
			((divider++))
		else # the rest of division equal a zero
			# do division
			number=$((number/divider))
			# print the message with divider
			echo "divider: $divider"
		fi
	done
}

########################################################
################## MAIN PROGRAM ########################
########################################################

echo "digit your number, positive, please:"
read value
validate_number $value



