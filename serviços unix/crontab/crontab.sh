#!/bin/bash

crontab -e #edita o arquivo crontab do user atual

crontab -u username -e #edita o arquivo crontab de outro usuario

crontab -l #exibe o conteudo  do arquivo crontab do user atual.

#enviar o script para /usr/local/sbin

#sintaxe do crontab
* * * * * /usr/local/sbin/backup.sh

*      *     *   *   *
minuto horas dia mes dia da semana


Expressão	                                     Significado

0 0 * * * /bin/sh backup.sh	                     Fazer um backup de banco de dados à meia noite de cada dia.

0 6,18 * * * /bin/sh backup.sh	                 Fazer um backup de banco de dados duas vezes por dia (às 6 da manhã e às 18h da tarde).

0 */6 * * * /scripts/monitor.sh	                 Para fazer monitoramentos a cada 6 horas.

*/10 * * * * /home/user/script.sh	             Para executar uma tarefa cron para o arquivo do script localizado no diretório home a cada 10 minutos.

0 * 20 7 * /bin/sh backup.sh	                 Para executar um backup de banco de dados a cada hora em 20 de julho.

0 0 * * 2 * /bin/sh	                             Para executar um backup de banco de dados à meia noite de toda terça-feira.

* * * 1,2,5 *  /script/script.sh	             Para executar um comando em Janeiro, Fevereiro e Maio.

10-59/5 5 * * * /home/user/script.sh	         Para executar um comando a cada 5 minutos às 5:00h da manhã, começando às 5:10h.

0 8 1 */3 * /home/user/script.sh	             Para executar um comando trimestralmente no primeiro dia às 8:00h da manhã.

* * * * * /scripts/script.sh; /scripts/scrit2.sh Para definir uma agenda para tarefas múltiplas em um único Cron Job.

@reboot /scripts/script.sh	                     Para executar uma certa tarefa toda vez que você inicia o sistema.

0 0 1 * * /home/user/script.sh	                 Para executar um comando no primeiro dia de cada mês.



