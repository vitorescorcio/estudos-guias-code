#!/bin/bash
#VARIAVEIS

DATE_FORMAT=$(date "+%d-%m-%Y")
ORIG_BKP="/PASTA/DE/ORIGEM/DO/BACKUP"
DEST_BKP="/PASTA/DE/DESTINO"
IP_SERVER="0.0.0.0"
USER_SERVER="USER"
LOG="/var/log/backup.log"

echo "Inicio de backup $DATE_FORMAT" >> $LOG

#fazendo backup
rsync -Cravzp $ORIG_BKP  "ssh -p <numero_da_porta>" $USER_SERVER@$IP_SERVER:$DEST_BKP >> $LOG

#VERIFICANDO O BACKUP
#SE NÃO HOUVE ERRO NO BACKUP FAZ LIMPEZA - 60 DIAS 
if [ "$?" -eq 0 ]; then
 echo "Backup realizado com sucesso" >> $LOG
 echo "Apagando backup antigo 60 dias" >> $LOG
 find $DEST_BKP -maxdepth 1 -mtime +60 -exec rm -rf {} \; 2>> $LOG
else
 echo "Erro ao realizar backup incremental. $DATE_FORMAT" >> $LOG
fi

echo "Fim de backup $(date)"

