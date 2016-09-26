#!/bin/bash

	#Declarar constantes
source="/path/to/folder/"
destiny="/path/to/folder/"
inicio=`date +%d/%m/%Y-%H:%M:%S`
log=/path/to/rel`date +%Y-%m-%d`.c
	#Declarar array (folder) com nomes das pastas
folder[0]="folder1/"
folder[1]="folder2/"
folder[2]="folder3/"
	#Registar horas
echo "|---------------START------------|">>$log
echo "Copia iniciada em: $inicio">>$log
	#Criar o Loop para copiar
for ((i=0; i<${#folder[*]}; i++));
do
	echo "Copia iniciada de: "${folder[i]}>>$log
	rsync -av --delete-after $source${folder[i]} $destiny${folder[i]}
	diff -ryq $source${folder[i]} $destiny${folder[i]}>>$log
done
	#Registar horas
fim=`date +%d/%m/%Y-%H:%M:%S`
echo "|---------------END------------|">>$log
echo "Copia finalizada em: $fim">>$log
echo 'qwert' | sudo -S poweroff
