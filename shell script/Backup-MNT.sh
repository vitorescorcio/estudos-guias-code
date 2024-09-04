#!/bin/bash
# Author: [Vitor Escorcio]
# Date: 2024-08-23
# Versao 1.0
##################
# Description: Este script cria um backup do tipo FTP, ou seja vai enviar 
# para um servidor FTP o conteúdo do diretorio de backup automaticamente.
# O backup é salvo em um arquivo .tgz com o nome escolhido pelo usuário.
###################
# Confs do script
# DIR_BKP é o diretório a ser backupeado 
# BKP_NAME é o nome do arquivo de backup a ser criado 
# MNT_DIR é o caminho para o diretório que será montado
# MNT_USER e MNT_PASS são respectivamente o usuário e a senha usados ao montarmos partições SMBFS
# MNT_SMB define se o diretorio a ser montado é SMBFS ou não (0 para não, 1 para sim)
# SMB_WORK é o workgroup ao montar uma partição smbfs
# Caso for um diretório SMBFS, coloque o caminho desta forma:
# //NOMEDAMAQUINA/diretorio/

DIR_BKP="/diretorio/a/ser/compactado/"
BKP_NAME="nome-do-arquivo.tgz"
MNT_DIR="/dev/hdb5/"
MNT_USER="usuario"
MNT_PASS="senha"
MNT_SMB="0"
#MNT_SMB="1"
SMB_WORK="workgroup"

# compactação do diretório a ser backpeado
tar -czpf ./${BKP_NAME} ${DIR_BKP}

# verifica se o diretorio montado é SMBFS ou não
# se sim montando-o e copia o arquivo para o diretório
if [ "$MNT_SMB" = "0" ]; then
mount ${MNT_DIR} ./mnt
cp ./${BKP_NAME} ./mnt
else
mount -t smbfs -o username=${MNT_USER},password=${MNT_PASS},workgroup=${SMB_WORK} ${SMB_DIR} ./mnt
cp ./${BKP_NAME} ./mnt
fi

# resultado
echo "Seu backup foi realizado com sucesso."
echo "Diretório: ${DIR_BKP}"
if [ "$MNT_SMB" = "0" ]; then
echo "Destino: ${MNT_DIR}"
else
echo "Destino: ${MNT_DIR} (smbfs)"
fi
exit 0