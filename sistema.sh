#!/bin/bash

echo "Vou verificar os dados dos sistema! Posso continuar? (s/n)"
read resposta
test "$resposta" == "n" && exit
test "$resposta" != "s" && exit
echo "Data e Hora:"
date
echo
echo "Utilização do Disco:"
df
echo
echo "Utilizadores conectados:"
w
echo "Temperatura de Sistema:"
sensors
