#!/bin/bash
#
# www.valedolinux.com.br
# Autor: Eduardo Marcial
# Data: 2018
# Backup Incremental
#
##################################################################################

##################################################################################
# DECLARAÇÃO DE VARIÁVEIS


DATA=$(date +%F)      #Carimbo de data aaaa-mm-dd
ORIGEM="/home/setores"
COMPLETO="/mnt_hdext/backup-incremental/FULL"
DESTINO="/mnt_hdext/backup-incremental/$DATA"
PASTLOG="/mnt_hdext/backup-incremental/log"   
LOG="$PASTLOG/log-$DATA"    #Log do backup
UUID_HD_USB=""

##################################################################################
# CHECA MONTAGEM DO HD EXTERNO

CHECK_MOUNTED=$(mount |grep -w \/mnt_hdext|tail -1|wc -l)
if [ "${CHECK_MOUNTED}" = "0" ]; then
 mount /dev/sdb1 /mnt_hdext 2>> ${LOG}
        if [ $? -gt 0 ]; then
         echo -e "\n ERRO AO MONTAR HD-EXTERNO USB UUID="${UUID_HD_USB}"." >> $LOG
                exit 1
        else
                echo -e "\n OK - HD-EXTERNO USB MONTADO COM SUCESSO" >> $LOG;
        fi
        
fi
##################################################################################
# CRIA DIRETORIOS E ARQUIVOS

if [ ! -d ${DESTINO} ]; then
        mkdir -p ${DESTINO}
fi

if [ ! -d ${COMPLETO} ]; then
        mkdir -p ${COMPLETO}
fi

if [ ! -d ${PASTLOG} ]; then
        mkdir -p ${PASTLOG}
fi

touch $LOG

##################################################################################
# Inicio de bkp

echo "Inicio de backup $(date)" >> $LOG


##################################################################################
# REALIZAR BKP

sudo rsync -azbvP --exclude='TEMP' --delete --backup-dir=$DESTINO $ORIGEM $COMPLETO 2>> $LOG

##################################################################################
# SE NÃO HOUVE ERRO NO BACKUP FAZ LIMPEZA - 60 DIAS 

if [ "$?" -eq 0 ]; then
 find $DESTINO -maxdepth 1 -mtime +60 -exec rm -rf {} \; 2>> $LOG
else
 echo "Erro ao realizar backup incremental. $DATA" >> $LOG
fi

echo "Fim de backup $(date)"