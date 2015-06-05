#!/bin/sh
#########################################################
## INSTALAÇÃO DO POSTGRES A PARTIR DA VERSÃO INFORMADA ##
#########################################################

VERSION=$1

echo "******************************************";
echo "Por favor confirme os dados da instação...";
echo "******************************************";
echo "PostgreSQL Versão: "$VERSION;
echo # linha para separação...

echo "Tem certeza que deseja iniciar a instalação da versão acima? [y/n]";
read REPLY
echo # linha para separação...

if [ $REPLY = "y" ]
then

    cd /usr/local/src | wget https://ftp.postgresql.org/pub/source/v$VERSION/postgresql-$VERSION.tar.gz

    tar -xzvf postgresql-$VERSION.tar.gz

    apt-get install make gcc g++ libreadline6-dev zlib1g-dev libxml2 libssl-dev libxml2-dev libperl-dev libxslt1-dev python-dev python-sphinx

    cd /usr/local/src/postgresql-$VERSION

    ./configure --prefix=/usr/local/postgresql-$VERSION --with-libxml --with-libxslt --with-python --with-perl

    make
    make install # opcionalmente rodar o make check antes para conferir se o make deu certo

    # criar link simbólico em /usr/local/ para a versão do postgres que será utilizada facilitando a migração entre versões
    cd /usr/local/
    ln -s ./postgresql-$VERSION pgsql

    #--------------------------------#
    # criar as variáveis de ambiente #
    #--------------------------------#
    vim /etc/profile.d/postgresql.sh
    export PATH=/usr/local/pgsql/bin:$PATH
    export LD_LIBRARY_PATH=/usr/local/pgsql/lib:$LD_LIBRARY_PATH
    export PGDATA=/usr/local/pgsql/data

    cd /usr/local/src/postgresql-$VERSION/contrib/start-scripts/
    cp linux /etc/init.d/postgresql
    chmod +x /etc/init.d/postgresql
    update-rc.d postgresql defaults

    # criar usuário do postgres
    adduser postgres
    mkdir /usr/local/pgsql/data
    chown postgres -Rf /usr/local/pgsql/data # dar permissão no diretório pgdata para o usuário postgres

    su - postgres

    initdb -E utf8 --locale=pt_BR.utf8 -D $PGDATA
else
    echo "Operação cancelada pelo usuário!";
    exit
fi
