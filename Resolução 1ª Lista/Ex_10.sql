SET SERVEROUTPUT ON;
DECLARE
    dolares NUMBER := 110;
    taxa_cambio NUMBER := 5.88;
    reais NUMBER;
BEGIN
    reais := dolares * taxa_cambio;
    DBMS_OUTPUT.PUT_LINE(dolares || ' d�lares equivalem a R$ ' || reais);
END;
/