SET SERVEROUTPUT ON;
DECLARE
    numero NUMBER := &numero;
BEGIN
    IF MOD(numero, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('O n�mero ' || numero || ' � PAR');
    ELSE
        DBMS_OUTPUT.PUT_LINE('O n�mero ' || numero || ' � �MPAR');
    END IF;
END;
/