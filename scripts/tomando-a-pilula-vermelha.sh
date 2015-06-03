#!/bin/bash
# file: tomando-a-pilula-vermelha.sh
# Os scripts abaixo irão realizar o download de dados ...
# Você poderá criar combinações de dados oriundos de diferentes órgãos dos três poderes ...
# Certifique-se de possuir espaço suficiente em disco antes de realizar o download ...
# Iremos procurar informar o tamanho aproximado de cada download ...

# Verificando se os programas necessários estão disponíveis
apt-get install unzip

echo 'Os scripts abaixo irão realizar o download de dados ...';
echo 'Você poderá criar combinações de dados oriundos de diferentes órgãos dos três poderes ...';
echo 'Certifique-se de possuir espaço suficiente em disco antes de realizar o download ...';
echo 'Iremos procurar informar o tamanho aproximado de cada download ...';
echo '';
echo '######################################################';
echo '# [Judiciário] TSE - Prestação de contas de campanha #';
echo '######################################################';
echo '...';
echo '# [2014] Prestação de Contas - Final #';
mkdir /home/$USER/tse;
mkdir /home/$USER/tse/prestacao-contas;
mkdir /home/$USER/tse/prestacao-contas/2014;

# Realizando download
echo 'Iniciando download em: /home/$USER/tse/prestacao-contas/2014/';
cd /home/$USER/tse/prestacao-contas/2014
wget http://agencia.tse.jus.br/estatistica/sead/odsele/prestacao_contas/prestacao_final_2014.zip
##########################
# descompactando arquivo #
##########################
echo '#> descompactando...';
unzip prestacao_final_2014.zip
