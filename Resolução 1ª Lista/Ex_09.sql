SET SERVEROUTPUT ON;
DECLARE
    nota1 NUMBER := &nota1;
    nota2 NUMBER := &nota2;
    peso1 NUMBER := 2;
    peso2 NUMBER := 3;
    media NUMBER;
BEGIN
    media := (nota1 * peso1 + nota2 * peso2) / (peso1 + peso2);
    DBMS_OUTPUT.PUT_LINE('Média Ponderada: ' || media);
END;
/