--------------------------------
-- TOTAL GERAL POR UF em 2014 --
--------------------------------
SELECT sum("Valor despesa")::MONEY total
  FROM despesas_candidatos
 WHERE "UF" = 'PB'
   AND to_char("Data da despesa", 'YYYY') = '2014';
-- R$ 80.246.571,72
