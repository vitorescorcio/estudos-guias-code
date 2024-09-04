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
# FTP_HOST é o endereço do servidor de FTP e, FTP_USER e FTP_PASS 
# são respectivamente o usuario e a senha do servidor de FTP.

DIR_BKP="/diretorio/a/ser/compactado/"
BKP_NAME="nome-do-arquivo.tgz"
FTP_HOST="ftp.servidor.com.br"
FTP_USER="usuario"
FTP_PASS="senha"


# compactação do diretório a ser backpeado
tar -czpf ./${BKP_NAME} ${DIR_BKP}

# envio para o FTP, abrir a conexao com o servidor,
# deleta o backup ja existente e envia o novo backup para o
# diretorio home do usuario do FTP.
ftp -in <<EOF
open $FTP_HOST
user $FTP_USER $FTP_PASS
bin
hash
prompt
del $BKP_NAME
put $BKP_NAME
bye
EOF

# mensagem de resultado
echo "Seu backup foi realizado com sucesso."
echo "Diretório: ${DIR_BKP}"
echo "Destino: ${FTP_HOST}/${BKP_NAME}";
exit 0
