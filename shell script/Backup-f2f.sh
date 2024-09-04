#!/bin/bash
# Author: [Vitor Escorcio]
# Date: 2024-08-23
# Versao 1.0
##################
# Description: Este script cria um backup do tipo folder to folder.
# O backup é salvo em um arquivo .tgz com o nome escolhido pelo usuário.
# O script também permite a escolha do diretório de origem e destino.
###################
# Confs do script
# DIR_BKP é o diretório a ser backupeado 
# DIR_DEST é o diretório para onde vai o arquivo compactado
# BKP_NAME é o nome ao qual será compactado o diretório.
###################

#Variavveis
DIR_BKP="/home/user/diretorio_a_ser_backupeado/"
DIR_DEST="/home/user/diretorio_de_destino/"
#para escolher o nome do arquivo  de backup
#BKP_NAME="nome_do_arquivo_bkp.tgz"
#ou
#para  criar o nome do arquivo de backup com a data e hora atual.
#onde: %d = dia %m = mes %Y = ano %H = hora %M = minuto
BKP_NAME=bkp-`date +%d-%m-%Y_%H:%M`.tgz
#Fim das variáveis
#Criação do backup
# compactação direto na pasta onde sera feito o backup
tar -czpf ${DIR_DEST}${BKP_NAME} ${DIR_BKP}
# resultado
echo "Seu backup foi realizado com sucesso."
echo "Diretório: ${DIR_BKP}"
echo "Destino: ${DIR_DEST}${BKP_NAME}"
exit 0
