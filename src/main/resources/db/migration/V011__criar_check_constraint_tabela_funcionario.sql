-- P => PRESENCIAL
-- R => REMOTO
ALTER TABLE TB_FUNCIONARIO
ADD CONSTRAINT CK_LOCALIDADE
CHECK (localidade IN ('P', 'R'));
