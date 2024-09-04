
#comandos basicos
cd .. #retorna ao diretorio anterior
pwd #listar caminho atual
du -hs * | sort -h #lista os arquivos do menor para maior 
du -hs * #lista o tamanho das partição  
ll -rths #lista arquivos 
ls #lista aquivos e diretorios
lsdev #listagem do hardware
lspci #dispositivos pci.
ls -rths #lista os arquivos e diretorios com mais detalhes
df -hTP  #lista os diretorios montado
lsblk    #lista os discos 
less "nome do arquivo" #visualizar arquivo  sem editar 
cat "arquivo" #visualiza o conteudo do arquivo na tela
touch "nome do arquivo" #cria arquivos vazios
find . -name 'test*.log' -delete #apaga todos os arquivos test
find . -name 'test*.log' -mtime +1 #procura arquivos test criados a um dia. 
cp [-ir]: #copiar arquivos.
mv [-i]: #mover ou renomear arquivos.
rm [--]: #deletar arquivos.
mkdir/rmdir #cria/deleta diretorios.
ln -s path link #cria links simbolicos (symlinks) para arquivos ou diretorios.

##Outros comandos
file #determina o tipo do arquivo (/etc/magic).
head  #exibe linhas no inicio do arquivo
tail #exibe linhas no fim do arquivo.
less #lista o conteudo do arquivo de forma mais lenta deixando navegar entre as linhas.
more: #lista o conteudo do arquivo.

#usuarios e grupos

adduser user #adiciona usuarios 
addgrou group #adiciona grupos
gpasswd -a / -d #adiciona usuarios ao grupo / remove usuarios do grupo
groups user #Lista os grupos do usuario.
last #ultimos usuarios logados 

w #informacoes gerais sobre usuarios logados e seus processos.
who #informacoes dos usuarios atuais (do utmp)
last #listagem do historico de logins (/var/log/wtmp)
lastlog #retorna informacoes sobre ultimos logins.

top #lista os processos que consomem mais recursos do sistema.
jobs #lista as tarefas rodando em fore/background.
bg/fg #manda processo para o back/foreground.
ps -auxw #lista todos os processos do sistema:
#PID (process id), TTY (terminal ou ? caso seja um daemon), STAT (estado do processo), TIME (tempo de CPU consumido), COMMAND (o comando executado).
du -sh(x) #espaço ocupado pelo diretorio e seus subdiretorios


#Listando processos listening na porta 80 e seus PIDs
ufw allow <porta>/tcp #liberar a porta no firewall
lsof -n -i:80 #(-i4: ipv4 e -n: sem resolver hostnames)
fuser -v 80/tcp #(lista processos que escutam na porta tcp 80 em modo "ps-like")

# Comando Teste de Conexao 
nc -v ip porta

#Comando Pegar o label do disco 
blkid -o list -c /dev/null



