#!/bin/bash

origem=$1

#verificar se foi fornecido parâmetro
if [ $# -lt 1 ]; then
    echo
    echo "ERRO: faltando parâmetro"
    echo
    exit
fi
#verificar se o diretório de origem existe
if [ ! -d $origem ]; then
    echo
    echo "ERRO: diretório $origem não existe"
    echo
    exit
fi

clear
data=`date +%H%M%S`
echo
echo "Compactando $origem ..."
echo
zip -r "Backup_$data.zip" "$origem"
echo
echo "Backup criado com sucesso em `pwd`"
echo
exit