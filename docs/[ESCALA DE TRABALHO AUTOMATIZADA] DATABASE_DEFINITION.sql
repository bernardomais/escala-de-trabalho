/* 

Modelo de dados do projeto Escala de Trabalho Automatizada.

Implementa��o de tabelas, triggers, sequences, indexes e constraints em uma 
base de dados Oracle 21c XE.

Vers�o: 1.0

*/

-- Definindo Sequences:
-- Ser� criada uma sequence para cada tabela que a chave prim�ria � gerada automaticamente. 
-- Isso substitui a opera��o de buscar o ID do �ltimo registro da tabela e incrementar 
-- em 1 unidade, pois essa solu��o pode degradar muito a performance do sistema.
-- O padr�o de nome utilizado para cada sequence deve conter o nome da tabela que 
-- receber� valores a sua chave prim�ria seguida do sufixo SEQ.
CREATE SEQUENCE [prefixo_tabela]_[nome_tabela]_SEQ MINVALUE 1 MAXVALUE 99999999 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

-- Definindo Triggers:
-- Para utilizar as sequences criadas, devermos criar triggers que ser�o respons�veis por, 
-- antes da inclus�o de cada registro na tabela, buscar o NEXTVAL da sequence passando seu 
-- valor para a chave prim�ria da tabela em quest�o.
-- O nome da trigger receber� o nome da tabela associada procedido do sufixo BI (BEFORE INSERT).
CREATE OR REPLACE TRIGGER [nome_tabela]_BI BEFORE INSERT
  ON [nome_tabela]
  FOR EACH ROW

 DECLARE

 BEGIN
   SELECT [nome_sequence].NEXTVAL
     INTO :NEW.[chave_prim�ria]
     FROM DUAL;

 END [nome_tabela]_BI;

-- Definindo Unique Index:
-- Para garantir a integridade do modelo de dados, devemos em alguns momentos utilizar unique index. 
-- O nome dos �ndices deve conter o prefixo UK seguido do nome da coluna e o nome da tabela.
-- Se o nome passar de 30 caracteres, o nome da coluna e o nome da tabela devem ser resumidos.
CREATE UNIQUE INDEX UK_[nome_coluna]_[nome_tabela] ON [nome_tabela] TABLESPACE [nome_tablespace];

-- Definindo Check Constraints:
-- Essa verifica��o de restri��es � utilizada quando necessitamos validar a informa��o de uma determinada coluna. 
-- O nome das check constraints ser�o iniciandos com CK precedido do nome da coluna e nome da tabela.
-- Por exemplo: Na tabela TB_FUNCIONARIO uma check constraint garante que o conte�do do campo perfil_funcionario
-- seja limitado as op��es "D - Diretor", "G - Gestor" e etc.


-- Identificando as Tabelas do Modelo:
-- Como regra, os nomes das tabelas dever�o ser escritos no singular, ser precedidos pelo 
-- identificador TB_ e n�o dever�o ultrapassar 26 caracteres. 
-- Al�m disso, a tabela dever� estar na tablespace referente � sua sub�rea.
-- Tablespace TSD_ESCALA para Dados.
-- Tablespace TSI_ESCALA para Indexes.
-- Al�m disso, a boa pr�tica diz que todas as tabelas devem ter uma breve descri��o 
-- sobre sua fun��o em seus coment�rios. Desta forma, qualquer pessoa que fizer um 
-- describe na estrutura da tabela, saber� qual sua fun��o.






