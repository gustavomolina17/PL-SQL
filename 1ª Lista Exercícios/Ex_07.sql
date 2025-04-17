SET SERVEROUTPUT ON;
DECLARE
    numero NUMBER := &numero;
BEGIN
    IF MOD(numero, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('O número ' || numero || ' é PAR');
    ELSE
        DBMS_OUTPUT.PUT_LINE('O número ' || numero || ' é ÍMPAR');
    END IF;
END;
/