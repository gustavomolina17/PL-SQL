SET SERVEROUTPUT ON;

DECLARE
    nota1 NUMBER := &nota1;
    nota2 NUMBER := &nota2;
    nota3 NUMBER := &nota3;
    nota4 NUMBER := &nota4;
    media NUMBER;
BEGIN
    media := (nota1 + nota2 + nota3 + nota4) / 4;
    IF media >= 6 THEN
        DBMS_OUTPUT.PUT_LINE('Aprovado. Média: ' || media);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Reprovado. Média: ' || media);
    END IF;
END;
/