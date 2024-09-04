# adicionar usuario na rede

useradd -g "NOME DO GRUPO" "NOME DO USUARIO" -m (adiciona o usuário e cria o /home/usuario)
passwd "NOME DO USUARIO" (cria senha no linux)
smbpasswd -a "NOME DO USUARIO" (cria senha no samba)


# criar o netlogon do usuario (MAPEAR OS DIRETORIOS DO USUARIO)/home/netlogon/usuário

cp -prf grupo_GRUPO DO USUARIO.bat NOME_DO_USUARIO.bat


# adicionar um grupo na rede

groupadd "NOME DO GRUPO"


# adicionar maquina no samba

useradd -c "NOME_DA_MAQUINA" -d /dev/null -s /bin/false NOME_DA_MAQUINA$
passwd -l NOME_DA_MAQUINA$
smbpasswd -a -m NOME_DA_MAQUINA


# remover usuário da rede

userdel -r "NOME DO USUARIO"


# remover grupo da rede

groupdel "NOME DO GRUPO"


# remover do netlogon

rm -rf /home/netlogon/"USUARIO".bat


# CRIAR UMA PASTA NO DIRETORIO /STAND

mkdir /stand/"NOME DA PASTA"


# ENTRAR NO ARQUIVO DE CONFIG DO SAMBA

gedit /etc/samba/smb.conf


# MUDAR O DONO DE UM DIRETORIO OU ARQUIVO

chown "NOME DO DONO":"NOME DO GRUPO" "CAMINHO DO DIRETORIO OU ARQUIVO"


# MUDAR AS PERMISSÕES DE UM DIRETORIO OU ARQUIVO

chmod "permissões" "CAMINHO DO DIRETORIO OU ARQUIVO"

*permissões (DONO GRUPO TODOS)
0 nenhuma permissão
1 somente execução
2 somente gravação
3 gravação e execução
4 somente leitura
5 leitura e execução
6 leitura e gravação
7 leitura, gravação e execução


# EXCLUIR PASTA E INTENS

rm –rf “pasta”

# REINICIAR O SAMBA

/etc/init.d/samba restart
ou:
service smb restart

# verificar um arquivo de configuração smb.conf para correção interna

testparm