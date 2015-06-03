
DO $$
DECLARE
    pg_data VARCHAR := 'C:\Program Files\PostgreSQL\9.4\data\pg_log\';
    uf VARCHAR(2);
    arrayUFs VARCHAR(2)[] := ARRAY['AC', 'AL', 'AM', 'AP', 'BA', 'BR', 'CE', 'DF', 'ES', 'GO', 'MA', 'MG', 'MS', 'MT', 'PA', 'PB', 'PE', 'PI', 'PR', 'RJ', 'RN', 'RO', 'RR', 'RS', 'SC', 'SE', 'SP', 'TO'];
BEGIN

    RAISE NOTICE '%', arrayUFs;

    FOREACH uf IN ARRAY arrayUFs
    LOOP
        RAISE NOTICE '%', uf;
        EXECUTE 'COPY despesas_candidatos FROM '''||pg_data||'prestacao_final_2014\despesas_candidatos_2014_'||uf||'.txt'' WITH CSV HEADER DELIMITER '';'';';
    END LOOP;
END; $$
