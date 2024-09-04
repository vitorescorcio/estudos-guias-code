
#comandos basicos
cd .. #retorna ao diretorio anterior
du -hs * | sort -h #lista os arquivos do menor para maior 
du -hs * #lista o tamanho das partição  
ll -rths #lista arquivos 
ls #lista aquivos e diretorios
ls -rths #lista os arquivos e diretorios com mais detalhes
df -hTP  #lista os diretorios montado
lsblk    #lista os discos 
less "nome do arquivo" #visualizar arquivo  sem editar 
cat "arquivo" #visualiza o conteudo do arquivo na tela
touch "nome do arquivo" #cria arquivos vazios
find . -name 'test*.log' -delete #apaga todos os arquivos test
find . -name 'test*.log' -mtime +1 #procura arquivos test criados a um dia. 
adduser user #adiciona usuarios 
addgrou group #adiciona grupos
gpasswd -a / -d #adiciona usuarios ao grupo / remove usuarios do grupo
groups user #Lista os grupos do usuario.
last #ultimos usuarios logados 
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

