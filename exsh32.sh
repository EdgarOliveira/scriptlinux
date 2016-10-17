#!/bin/bash

# author: ENO
# email: edgaroliveira.dev@gmail.com
# date: 17/10/2016
# Smith number: the sum of the numbers primes which compose himself number it is equal of the sum of the elements himself the number
# Font: https://www.youtube.com/watch?v=mlqAvhjxAjo - 4937775 - Numberphile
# Status: ongoing

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
			#echo "divider: $divider"
			# print total of the elements in the number of the variable $divider
			# echo "total is ${#divider}"
			# se o numero de elementos do divisor for mais do que um
			if [[ ${#divider} > 1 ]]
			then
			#echo "divider is $divider"
				# divide e soma os dois e passa o valor da soma para sum_prime
				# count how many elements has the variable
				for (( iu=0; iu<${#divider}; iu++ )); do
				# for each letter, in each cycle, put the letter of the respective index in array
				arra[$iu]=${divider:$iu:1}
					#
					sum_numbe=$((sum_numbe+${arra[$iu]}))
					# echo "--- $sum_numbe"
				done
				#
				sum_prime $sum_numbe
			else
				sum_prime $divider
			fi
		fi
	done
}

# calculate the sum of the numbers primes
sum_prime () {
	# set the parameter passed through to variable
	prime=$1
	# sum the previous value to a new value
	sum=$((sum+prime))
}

# put the number in array and sum this values
# recebe o numero do utilizador e soma os seus elementos
string_to_array () {
	# set the value passed to this function as a variable
	user_number=$1
	# count how many elements has the number chosen to by user
	for (( i=0; i<${#user_number}; i++ )); do
	# for each letter, in each cycle, put the letter of the respective index in array
	array[$i]=${user_number:$i:1}
		#
		sum_number=$((sum_number+${array[$i]}))
	done
}

# compare the values, results
compare () {
	if [ "$1" == "$2" ]
	then
		echo "$value is the Smith number"
	else
		echo "$value isn't the Smith number"
	fi
}

########################################################
################## MAIN PROGRAM ########################
########################################################

echo "digit your number, positive, please:"
read value
validate_number $value
echo "the sum is $sum"
string_to_array $value
echo "the sum of all elements of the number is: $sum_number"
compare $sum $sum_number