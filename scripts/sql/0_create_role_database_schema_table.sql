CREATE ROLE morpheus LOGIN
   ENCRYPTED PASSWORD 'pilulavermelhar'
   SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;

CREATE DATABASE controlesocial
  WITH OWNER = morpheus
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Portuguese_Brazil.1252'
       LC_CTYPE = 'Portuguese_Brazil.1252'
       CONNECTION LIMIT = -1;

CREATE SCHEMA tse
  AUTHORIZATION morpheus;

COMMENT ON SCHEMA tse
  IS 'Repositório de dados do Tribunal Superior Eleitoral
- Prestação de contas de campanha;
- Votação nominal por UF e município;
- Filiações partidárias;';

DROP table IF EXISTS despesas_candidatos;
create table despesas_candidatos (
    "Cód. Eleição" TEXT, "Desc. Eleição" TEXT, "Data e hora" TEXT, "CNPJ Prestador Conta" TEXT, "Sequencial Candidato" TEXT, "UF" TEXT, "Sigla  Partido" TEXT, "Número candidato" TEXT, "Cargo" TEXT, "Nome candidato" TEXT, "CPF do candidato" TEXT, "Tipo do documento" TEXT, "Número do documento" TEXT, "CPF/CNPJ do fornecedor" TEXT, "Nome do fornecedor" TEXT, "Nome do fornecedor (Receita Federal)" TEXT, "Cod setor econômico do doador" TEXT, "Setor econômico do fornecedor" TEXT, "Data da despesa" TEXT, "Valor despesa" TEXT, "Tipo despesa" TEXT, "Descriçao da despesa" TEXT
);
