CREATE TABLE TB_TURNO_ALTERNADO (
    ID NUMBER(8) GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1),
    QUANT_DIAS_CONSECUTIVOS_TRABALHO NUMBER(2) NOT NULL,
    QUANT_DIAS_FOLGA NUMBER(2) NOT NULL,
    CONSTRAINT TURNO_ALTERNADO_PK PRIMARY KEY (ID)
);
