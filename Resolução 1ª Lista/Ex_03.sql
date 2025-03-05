SET SERVEROUTPUT ON;
DECLARE
    total_alunos NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_alunos FROM ALUNO;
    DBMS_OUTPUT.PUT_LINE('Total de alunos cadastrados: ' || total_alunos);
END;
/