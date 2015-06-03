----------------------
-- Total por Cargo  --
----------------------
SELECT "Cargo", sum("Valor despesa")::MONEY total
  FROM despesas_candidatos
 WHERE "UF" = 'PB'
 GROUP BY "Cargo"
 ORDER BY total DESC;
-- "Governador";R$ 40.549.387,61
-- "Deputado Estadual";R$ 17.221.360,22
-- "Deputado Federal";R$ 14.099.397,88
-- "Senador";R$ 8.376.426,01

