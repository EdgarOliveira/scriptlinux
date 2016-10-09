#!/bin/bash

# author: ENO
# email: edgaroliveira.dev@gmail.com
# date: 24/09/2016
# Check bar code of your all bar code in your bathroom stuff, books and product of the shopping :) It works for GTIN-8, GTIN-12, GTIN-13, GTIN-14, GSIN, SSCC

# Font: 
#-http://www.gs1.org/how-calculate-check-digit-manually
#-http://www.gtin.info/

#########################################################
########## function necessary for the program ###########
#########################################################

# first function, to allow to the user select which key format he wants to test
key_format () {
	# set array with all key formats
	option[0]="GTIN-8"
	option[1]="GTIN-12"
	option[2]="GTIN-13"
	option[3]="GTIN-14"
	option[4]="GSIN (17)"
	option[5]="SSCC (18)"
	#
	for (( i=0; i<${#option[@]}; i++ ));
	do
		echo $i - ${option[$i]}
	done
	#
	echo "please choose which format key do you want:"
	read format_key
	# pass the value which user selected to function choose_format
	choose_format $format_key
}

# second function, after user selected which key format he wants use we need executed the function corresponding
choose_format () {
	#########-> Place in here the loop, while user didn't choose the right option this code run again
	case "$1" in
		"0")
			gtin_8
			;;
		"1")
			gtin_12
			;;
		"2")
			gtin_13
			;;
		"3")
			gtin_14
			;;
		"4")
			gtin_17
			;;
		"5")
			gtin_18
			;;
		*)
			echo "you selected something wrong";;
	esac
}

# third function, place number which user choose and put in array
place_number_array () {
	for (( i=0; i<${#1}; i++ )); do
		# for each letter, in each cycle, put the letter of the respective index in array
		# the word:1:1 means, read from the first index (letter) and give me only first letter
		# the word:2:3 means, read from the second index (letter) and give me three letter following
		array[$i]=${1:$i:1}
		## echo "${array[$i]}"
	done
	# call function multiply
	multiply_and_sum $2 $3 $1
}

# fourth function, validate the number. this function used for all key formats
validate_number () {
	# Check if the number have exactly nine digits and has only number assigned in this variable 
	if [ ${#1} == $2 ]
	then
		re='^[0-9]+$'
		if [[ $1 =~ $re ]]
		then
			## echo "congratulations"
			place_number_array $1 $3 $2
		else
			echo "please choose only characters numeric"
		fi
	else
		echo "Please choose a number with $2 digits"
	fi
}

# fifth function, multiply for order 3 and 1
multiply_and_sum () {
	# 0 = for 3
	# 1 = for 1
	position=$1
	# less one because because the last digit never it is not multiplied
	for (( i=0; i<$2-1; i++ )); do		
		if [ $position == 0 ]
		then
			## echo "multiply by three, $3"
			# the multiplication by three
			value_multiply=$((${3:$i:1}*3))
			## echo $value_multiply
			# change the multiple
			position="1"
		else
			## echo "multiply by one, $3"
			# the multiplication by one
			value_multiply=$((${3:$i:1}*1))
			## echo $value_multiply
			# change the multiple
			position="0"
		fi
		# add this result to the last
		sum=$(($sum+$value_multiply))
	done
	## echo  "the sum is: $sum"
	remainder $sum
}

# sixth function, sum from nearest equal or higher multiple of ten
remainder () {
	# remainder of the division by 10
	rest=$(($1%10))
	# 10 minuis by rest
	rest=$((10-$rest))
	## echo $rest
	check_last_digit $rest
}

# seventh function, check if the result of the function remainder it is equal of the last digit of the number choose by user
check_last_digit () {
	# check if the value calculate in remainder it is equal with the last digit in variable number
	if [ $1 == ${array[-1]} ]
	then
		echo "great, your number: $number it is correct!"
	else
		echo "sorry, your number: $number it is wrong! The last digit should be $1"
	fi
}

#########################################################
############### function to each key format #############
#########################################################

# function to key format with eight digits
gtin_8 () {
	echo "this is function to the key format 8 digits"
	echo "Please choose your number with eight digits:"
	read number
	validate_number $number	8 0
}

# function to key format with twelve digits
gtin_12 () {
	echo "this is function to the key format 12 digits"
	echo "Please choose your number with twelve digits:"
	read number
	validate_number $number	12 0
}

# function to key format with thirteen digits
gtin_13 () {
	echo "this is function to the key format 13 digits"
	echo "Please choose your number with thirteen digits:"
	read number
	validate_number $number	13 1
}

# function to key format with fourteen digits
gtin_14 () {
	echo "this is function to the key format 14 digits"
	echo "Please choose your number with fourteen digits:"
	read number
	validate_number $number	14 0
}

# function to key format with seventeen digits
gtin_17 () {
	echo "this is function to the key format 17 digits"
	echo "Please choose your number with seventeen digits:"
	read number
	validate_number $number	17 1
}

# function to key format with seventeen digits
gtin_18 () {
	echo "this is function to the key format 18 digits"
	echo "Please choose your number with eighteen digits:"
	read number
	validate_number $number	18 0
}

#########################################################
######################## Main body ######################
#########################################################
key_format
