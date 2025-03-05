SET SERVEROUTPUT ON;
DECLARE
    valor_emprestimo NUMBER := 5000;
    taxa_juros NUMBER := 0.05;
    anos NUMBER := 3;
    montante NUMBER;
    juros_total NUMBER;
BEGIN
    montante := valor_emprestimo * (1 + (taxa_juros * anos));
    juros_total := montante - valor_emprestimo;

    DBMS_OUTPUT.PUT_LINE('Montante total: R$ ' || montante);
    DBMS_OUTPUT.PUT_LINE('Juros total: R$ ' || juros_total);
END;
/