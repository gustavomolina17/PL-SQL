SET SERVEROUTPUT ON;
DECLARE
    valor_compra NUMBER := &valor_compra;
    percentual_desconto NUMBER := 10; 
    valor_desconto NUMBER;
    valor_final NUMBER;
BEGIN
    valor_desconto := valor_compra * (percentual_desconto / 100);
    valor_final := valor_compra - valor_desconto;
    DBMS_OUTPUT.PUT_LINE('Valor do desconto: R$ ' || valor_desconto);
    DBMS_OUTPUT.PUT_LINE('Valor final após desconto: R$ ' || valor_final);
END;
/