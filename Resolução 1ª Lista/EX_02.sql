SET SERVEROUTPUT ON;
DECLARE
    peso NUMBER;
    altura NUMBER;
    imc NUMBER;
BEGIN
    peso := &peso;
    altura := &altura;
    imc := peso / (altura * altura);
    
    IF imc < 18.5 THEN
        DBMS_OUTPUT.PUT_LINE('Classifica��o: Abaixo do Peso');
    ELSIF imc < 24.9 THEN
        DBMS_OUTPUT.PUT_LINE('Classifica��o: Peso Normal');
    ELSIF imc < 29.9 THEN
        DBMS_OUTPUT.PUT_LINE('Classifica��o: Sobrepeso');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Classifica��o: Obesidade');
    END IF;
END;
/