SET SERVEROUTPUT ON;
DECLARE
    cpf CHAR(11) := '&cpf'; 
BEGIN
    -- Verifica se o CPF tem 11 caracteres
    IF LENGTH(TRIM(cpf)) = 11 THEN
        DBMS_OUTPUT.PUT_LINE('CPF v�lido.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('CPF inv�lido.');
    END IF;
END;
/