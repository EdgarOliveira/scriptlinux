#!/bin/bash

# author: ENO
# email: edgaroliveira.dev@gmail.com
# purpose: Caught all character after and before the first/last slash
# date: 19/10/2016
# useful links: 
# 1-http://mywiki.wooledge.org/BashFAQ/100#Extracting_parts_of_strings

after_slash () {
	echo "only part after last slash: ${1##*/}"
}

before_slash () {
	echo "only part before last slash: ${1%/*}"
}

with_out_first_part () {
	echo "string without first part of the string: ${1#*/}"
}

# set the string
str="path/to/folder/and/subfolders"
# notice the string
echo "all string: $str"
# call function to caught only character before slash
before_slash $str
# call function to caught only character after slash
after_slash $str
# call function to drop part of the string before first string
with_out_first_part $str
