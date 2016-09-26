#!/bin/bash
	#Declarar constantes
caminho="/patho/to/folder/"
folder_base="folder/"
LOG=$caminho$folder_base'logs.txt'
	#Declarar array com pastas e respectivas url de playlist
#Array folder
folder[0]="folder1"
folder[1]="folder2"
	#Registar horas de inicio
echo `date +%d/%m/%Y-%H:%M:%S`>>$LOG	
	#Criar o Loop
for ((i=0; i<=${#folder[*]}; i++));
do	
	mkdir $caminho$folder_base${folder[i]}>>$LOG
done
	#Registar horas de fim
echo `date +%d/%m/%Y-%H:%M:%S`>>$LOG
