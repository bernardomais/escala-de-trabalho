ALTER TABLE TB_FUNCIONARIO
ADD CONSTRAINT FK_ESCALA_TRABALHO
FOREIGN KEY(ESCALA_TRABALHO_ID)
REFERENCES TB_ESCALA_TRABALHO(ID);