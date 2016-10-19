#!/bin/bash

# author: ENO
# email: edgaroliveira.dev@gmail.com
# purpose: Rename all files in drive with a tag
# date: 19/10/2016
# version: 1.0

# Note:
# shoulb be execute this script in this way: exsh36.sh path/

find $1 -type f | while read line
do
	((count++))
	# count all characteres in string, relative all elements of the path
	total_characters=${#line}
	# capth name of the file
	name_file=${line##*/}
	# count all characteres in name oldder
	total_characters_name=${#name_file}
	# calculate lenght all element without name of the file
	value=$((total_characters-total_characters_name))
	# put the tag in inception of the name
	new_name_file=$count"_"$name_file
	# capth all string without name of the file
	path_file=${line:0:$value}
	# execute the command mv
	mv $line $path_file$new_name_file
done
