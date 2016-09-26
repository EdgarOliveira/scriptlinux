#!/bin/bash
	#Declarar constantes
caminho="/path/to/folder/"
folder_base="folder/"
LOG=$caminho$folder_base'logs.txt'
	#Declarar array com pastas e respectivas url de playlist
#Array folder
folder[0]="folder1"
folder[1]="folder2"
#Array url
url[0]="channel youtube"
url[1]="channel youtube"
	#Registar horas de inicio
echo `date +%d/%m/%Y-%H:%M:%S`>>$LOG	
	#Criar o Loop
for ((i=0; i<=${#folder[*]}; i++));
do	
	cd $caminho$folder_base${folder[i]}>>$LOG
	echo "|--------------------------------|">>$LOG
	youtube-dl -itcv --yes-playlist ${url[i]}>>$LOG
done
	#Registar horas de fim
echo `date +%d/%m/%Y-%H:%M:%S`>>$LOG
