#!/bin/bash

#enviar o script para /usr/local/sbin

#Diretorio de origem do backup
bkp_path="/caminho/da/pasta/de/backup/"

#Diretorio externo (ponto de montagem) do destino do backup 
ext_path="/mnt/backup" 

#Formato do  backup
date_format=$(date "+%d-%m-%Y")
final_archive="bkp-$date_format.tar.gz"

#destino do arquivo de log
log_file="/var/log/bkp.log"

##########################
#testes
##########################
#checando se o dispositivo está montado
if ! mountpoint -q -- $ext_path; then 
    printf "[$date_format] Dispositivo nao está montado em: $ext_path.\n" >> $log_file
    exit 1 
fi

########################
#inicio do backup
########################
if tar -czSpf "$ext_path/$final_archive" "$bkp_path"; then
    printf "[$date_format] backup realizado com sucesso.\n" >> $log_file
else
    printf "[$date_format] backup nao realizado ERRO.\n" >> $log_file  
fi

#excluir os arquivos em x dias 
find $ext_path -mtime +10 -delete