#!/bin/bash

#	Objectivo:
#	Registar todos os divisores referente a um número
#	Gravar num array, por ordem decrescente, o numero de vezes que é divisivel. Nessa posição gravar os numeros correspondentes.
#	Por exemplo: array quant[0,1,2]
#				quant[0][0] -> 500 - temos o numero 4
#				quant[0][1] -> 500 - temos o numero 15
log="relatorio.c"
data_inicio=$(date)
for ((i=1; i<=10; i++))
do
quant=0
	for ((g=1; g<=1000; g++))
	do
		if ((i%g == 0)); then
			echo $i' é divisel por '$g>>$log 
			((quant++)) 
		fi
	done
	echo '------'$i' é '$quant' divisivel------'>>$log
done
data_fim=$(date)
echo 'O algoritmo começou: '$data_inicio' terminou em: '$data_fim>>$log
