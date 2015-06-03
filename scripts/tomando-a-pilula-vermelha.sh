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

####################################
# Importação para banco PostgreSQL #
####################################
echo 'Criando usuário do banco PostgreSQL: morpheus com a senha "pilulavermelha" ...';
psql -h localhost -p 5432 -U morpheus -c
"CREATE ROLE morpheus LOGIN
   ENCRYPTED PASSWORD 'pilulavermelhar'
   SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;"

echo 'Criando banco de dados: controlesocial ...';
psql -h localhost -p 5432 -U morpheus -c
"CREATE DATABASE controlesocial
  WITH OWNER = morpheus
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Portuguese_Brazil.1252'
       LC_CTYPE = 'Portuguese_Brazil.1252'
       CONNECTION LIMIT = -1;"

echo 'Criando tabela despesas_candidatos ...';
psql -h localhost -p 5432 -U morpheus -c
'
create table despesas_candidatos (
"Cód. Eleição" TEXT, "Desc. Eleição" TEXT, "Data e hora" TEXT, "CNPJ Prestador Conta" TEXT, "Sequencial Candidato" TEXT, "UF" TEXT, "Sigla  Partido" TEXT, "Número candidato" TEXT, "Cargo" TEXT, "Nome candidato" TEXT, "CPF do candidato" TEXT, "Tipo do documento" TEXT, "Número do documento" TEXT, "CPF/CNPJ do fornecedor" TEXT, "Nome do fornecedor" TEXT, "Nome do fornecedor (Receita Federal)" TEXT, "Cod setor econômico do doador" TEXT, "Setor econômico do fornecedor" TEXT, "Data da despesa" TEXT, "Valor despesa" TEXT, "Tipo despesa" TEXT, "Descriçao da despesa" TEXT
);
'

echo 'Iniciando cópia dos arquivos de 2014 ...'
psql -h localhost -p 5432 -U morpheus -c "COPY despesas_candidatos FROM 'C:\Program Files\PostgreSQL\9.4\data\pg_log\prestacao_final_2014\despesas_candidatos_2014_PB.txt' WITH CSV HEADER DELIMITER ';';"
