Instalação

root@server:~# aptitude install bind9 bind9-doc dnsutils

Configuração
A resolução de nomes converte nomes de sistemas no seu endereço IP e vice-versa. Assim, a configuração consiste, 
basicamente na criação de 2 zonas, uma (zone “home.lan”) que converte nomes em endereços IP 
e outra (zone “1.168.192.in-addr.arpa”) que converte endereços IP no respectivo nome de sistema.

Zonas
As zonas são declaradas no ficheiro /etc/bind/named.conf.local:

/etc/bind/named.conf.local
//
// Do any local configuration here
//

zone "home.lan" {
    type master;
    file "/etc/bind/db.home.lan";
};

zone "1.168.192.in-addr.arpa" {
    type master;
    file "/etc/bind/db.1.168.192";
};

// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";
Verificar que o ficheiro de configuração não contém erros:

root@server:~# named-checkconf
root@server:~#
Resolução de nomes
A resolução de nomes transforma os nomes dos sistemas nos endereços IP correspondentes.

Para a zona “home.lan”, os nomes “server”, “virtual”, “ns” e “router” são associados aos respectivos endereços. 
A base de dados para a resolução de nomes na zona home.lan é guardada no ficheiro /etc/bind/db.home.lan:

/etc/bind/db.home.lan
;
; BIND zone file for home.lan
;

$TTL    3D
@       IN      SOA     ns.home.lan.    root.home.lan. (
                        2010111101      ; serial
                        8H              ; refresh
                        2H              ; retry
                        4W              ; expire
                        1D )            ; minimum
;
                NS      ns              ; Inet address of name server
                MX      10 mail         ; Primary mail exchanger

ns              A       192.168.1.100
mail            A       192.168.1.100

home.lan.       A       192.168.1.100
server          A       192.168.1.100

virtual         A       192.168.1.101

router          A       192.168.1.1     ; router ADSL
gateway         CNAME   router
gw              CNAME   router

O protocolo DNS permite também a criação de aliases, ou canonical names, identificados pelo tipo de registo CNAME. 
Um alias é um nome alternativo de um sistema.

No final do ficheiro poderão ser declarados alguns aliases: o sistema “server” passará também a ser conhecido 
(CNAME ou canonical name) como “proxy” e o servidor “virtual” responderá também pelos nomes “www” e “ftp”:

/etc/bind/db.home.lan
// [...]
proxy           CNAME   server
www             CNAME   virtual
ftp             CNAME   virtual
// [...]

Verificar que o ficheiro de configuração da zona home.lan não contém erros:

root@server:~# named-checkzone home.lan /etc/bind/db.home.lan
zone home.lan/IN: loaded serial 2010111101
OK

Resolução Inversa
A resolução de inversa transforma endereços IP nos correspondentes nomes dos sistemas.

A resolução inversa é implementada no ficheiro /etc/bind/db.1.168.192:

/etc/bind/db.1.168.192
;
; BIND zone file for 192.168.1.xxx
;

$TTL    3D
@       IN      SOA     ns.home.lan.    root.home.lan. (
                        2010111101      ; serial
                        8H              ; refresh
                        2H              ; retry
                        4W              ; expire
                        1D )            ; minimum
;
                NS      ns.home.lan.    ; Nameserver address

100             PTR     server.home.lan.
100             PTR     ns.home.lan.
100             PTR     mail.home.lan.
101             PTR     virtual.home.lan.
1               PTR     router.home.lan.

Verificar que o ficheiro de configuração da zona 1.168.192.in-addr.arpa não contém erros:

root@server:~#  named-checkzone 1.168.192.in-addr.arpa /etc/bind/db.1.168.192
zone 1.168.192.in-addr.arpa/IN: loaded serial 2008121701
OK

Reiniciar o serviço:

root@server:~# /etc/init.d/bind9 restart

Acrescentar o domínio home.lan no ficheiro /etc/resolv.conf:

/etc/resolv.conf
# [...]
domain home.lan
search home.lan
nameserver 127.0.0.1
# [...]

Assim, quando nos referirmos ao sistema “server”, este será procurado no domínio “home.lan”, resultando no nome “server.home.lan”.

Verificação
Verificar a resolução de nomes:

root@server:~# nslookup server
Server:         127.0.0.1
Address:        127.0.0.1#53

Name:   server.home.lan
Address: 192.168.1.100

Verificar que os aliases também são resolvidos:

root@server:~# nslookup gateway
Server:         127.0.0.1
Address:        127.0.0.1#53

gateway.home.lan        canonical name = router.home.lan.
Name:   router.home.lan
Address: 192.168.1.1

Finalmente, verificar que a resolução inversa:

root@server:~# nslookup 192.168.1.101
Server:         127.0.0.1
Address:        127.0.0.1#53

101.1.168.192.in-addr.arpa    name = virtual.home.lan.