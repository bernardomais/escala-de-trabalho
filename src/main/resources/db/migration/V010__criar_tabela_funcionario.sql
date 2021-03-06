CREATE TABLE TB_FUNCIONARIO (
    ID NUMBER(8) GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT BY 1),
    CARGO_FUNCIONARIO_ID NUMBER(8) NOT NULL,
    EQUIPE_FUNCIONARIO_ID NUMBER(8) NOT NULL,
    TURNO_ID NUMBER(8) NOT NULL,
    MATRICULA VARCHAR2(8) NOT NULL, -- RE
    NOME VARCHAR2(125) NOT NULL,
    LOCALIDADE CHAR(1) NOT NULL,
    CODIGO VARCHAR2(14),
    EMAIL VARCHAR2(255) NOT NULL,
    SENHA VARCHAR2(255) NOT NULL,
    CONSTRAINT FUNCIONARIO_PK PRIMARY KEY (ID),
    CONSTRAINT FK_CARGO_FUNCIONARIO FOREIGN KEY(CARGO_FUNCIONARIO_ID) REFERENCES TB_CARGO_FUNCIONARIO(ID),
    CONSTRAINT FK_EQUIPE_FUNCIONARIO FOREIGN KEY(EQUIPE_FUNCIONARIO_ID) REFERENCES TB_EQUIPE_FUNCIONARIO(ID),
    CONSTRAINT FK_TURNO FOREIGN KEY(TURNO_ID) REFERENCES TB_TURNO(ID)
);
