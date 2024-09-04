#!/bin/bash
echo "Script - Script de Confguracao do Samba"

#Variaveis
samba=/etc/samba
smbini=`/sbin/chkconfig smb --list`
smblist=`/bin/ls -ls $samba/smb.conf`
listperm=`/bin/ls -ls /sistema`

#Iniciando Configuracoes

echo "Salvando Arquivo Original"
        /bin/mv  $samba/smb.conf $samba/smb.old

echo "Criando Novo arquivo configuracao Samba"
        touch $samba/smb.conf

echo "Listando Novo Arquivo smb.conf"
echo "$smblist"

echo "Habilitando samba na Inicializacao"
        /sbin/chkconfig smb on
echo "$smbini"

Menu(){
        echo "-------------------------------------"
        echo "-------------------------------------"
        echo "[ 1 ] Adicionar novo Usuario"
        echo "[ 2 ] Adicionar novo Grupo"
        echo "[ 3 ] Adicionar novo Usuario ao Samba"
        echo "[ 4 ] Habilitando novo Usuario do Samba"
        echo "[ 5 ] Lista Usuario Criados no Samba"
        echo "[ 6 ] Finalizar configuracoes"
        echo "[ 7 ] Sair"
        echo
        echo -n "Qual a opcao desejada ?"
read opcao
        case $opcao in
         1) ADDUSER ;;
         2) ADDGROUP ;;
         3) ADDUSERSMB ;;
         4) ENABLEUSERSMB;;
         5) LISTUSERSMB ;;
         6) ENDCONFIG ;;
         7) exit ;;
         *) "Opcao desconhecida." ; echo ; Principal ;;
        esac
}
ADDUSER(){
        echo "Digite o nome do usuario"
        read usuario
        /usr/sbin/adduser $usuario
        echo "Informe a senha para o novo usuario"
        /usr/bin/passwd $usuario
           Menu
}
ADDGROUP(){
        echo "Digite o nome do Grupo"
        read grupo
        /usr/sbin/groupadd $grupo
        echo "Adcionado Usuario UserWinthor ao Grupo Winthor"
        read usuario
        read grupo
        /usr/bin/gpasswd -a $usuario $grupo
           Menu
}
ADDUSERSMB(){
        echo "Digite o nome do usuario depois informe a senha"
        read usersmb
        /usr/bin/smbpasswd -a $usersmb
           Menu
}
ENABLEUSERSMB(){
        echo "Habilitando User SMB: Entre com Usuario"
        read $usersmb
        /usr/bin/smbpasswd -e $usersmb
           Menu
}
LISTUSERSMB(){
        echo "Listando User SMB: Entre com Usuario"
        read $usersmb
        /usr/bin/pdbedit -L -v $usersmb
           Menu
}
ENDCONFIG(){
echo "Criando Diretorio Sistema"
/bin/mkdir /sistema

echo "Atribuindo Permissoes"
/bin/chmod 755 /sistema -R

echo "Atribuindo Usuario e Grupo Dono ao Diretorio: sistema"
/bin/chown admwinthor:winthor /sistema -R

echo "Listando Permissoes Diretorio"
echo "$listperm"
}
Menu
