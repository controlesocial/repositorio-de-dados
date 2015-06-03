ALTER TABLE despesas_candidatos ALTER COLUMN "Cód. Eleição" TYPE INTEGER USING (("Cód. Eleição")::INTEGER);
ALTER TABLE despesas_candidatos ALTER COLUMN "Data e hora" TYPE TIMESTAMP WITHOUT TIME ZONE USING (("Data e hora")::TIMESTAMP WITHOUT TIME ZONE);
ALTER TABLE despesas_candidatos ALTER COLUMN "Número candidato" TYPE INTEGER USING (("Número candidato")::INTEGER);

UPDATE despesas_candidatos SET "Data da despesa" = REPLACE( "Data da despesa", '00:00:00', '');
ALTER TABLE despesas_candidatos ALTER COLUMN "Data da despesa" TYPE DATE USING (("Data da despesa")::DATE);

UPDATE despesas_candidatos SET "Valor despesa" = REPLACE( "Valor despesa", ',', '.');
ALTER TABLE despesas_candidatos ALTER COLUMN "Valor despesa" TYPE NUMERIC(12,2) USING (("Valor despesa")::NUMERIC(12,2));
