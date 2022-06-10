CREATE TABLE TB_CARGO_FUNCIONARIO (
    ID NUMBER(8) GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
    NOME VARCHAR2(125) NOT NULL,
    SIGLA VARCHAR2(10) NOT NULL,
    PERMISSAO_ACESSO VARCHAR2(10) NOT NULL,
    HORAS_EXTRAS_PERMITIDAS NUMBER(3,0),
    CONSTRAINT CARGO_FUNCIONARIO_PK PRIMARY KEY (ID)
);