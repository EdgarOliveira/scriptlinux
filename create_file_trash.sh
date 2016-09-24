#!/bin/bash

# author: ENO
# email: edgaroliveira.dev@gmail.com
# date: 24/09/2016
# One day I needed create many files and directory to test another scripts. I didn't want create each files on hand, to meet this need create this script! Enjoy!

# create array with all type format I will want create files
type[0]="mp4"
type[1]="sh"
type[2]="mp3"
type[3]="docx"
type[4]="odf"
type[5]="html"
type[6]="odp"
type[7]="odb"
type[8]="oxt"
type[9]="odm"
type[10]="php"
# create a function to create file and respective directory
create_file () {
	for index in ${!type[@]}; do
		mkdir stuff_4_test/${type[$index]}
			a=0
			until [ ! $a -lt $1 ]
			do
				touch stuff_4_test/${type[$index]}/${type[$index]}_$a.${type[$index]}
				a=`expr $a + 1`
			done
	done
	echo "Good Job! Done!"
}

echo "##############################################################"
echo "######### WELCOME THE RANDOM CREATOR FILES ###################"
echo "##############################################################"
echo ""
echo "Please, choose the number files do you want:"
echo "Notice: this script will create all type format display below and respectfully directory for each one!"
for index in ${!type[@]}; do
	echo $index-${type[$index]}
done
read numbertype
create_file $numbertype