--- Exercício 1 – Exceção Simples

DECLARE
    v_num NUMBER := 10;
    v_resultado NUMBER;
BEGIN
    v_resultado := v_num / 0;
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Erro: divisão por zero não é permitida.');
END;


--- Exercício 2 – NO DATA FOUND
DECLARE
    v_nome funcionarios.nome%TYPE;
BEGIN
    SELECT nome INTO v_nome FROM funcionarios WHERE id = 999; -- ID que não existe
    DBMS_OUTPUT.PUT_LINE('Funcionário: ' || v_nome);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Funcionário não encontrado.');
END;


--- Exercício 3 - Exceção com Cursor
DECLARE
    CURSOR c_filmes IS
        SELECT nome, preco FROM filmes;

    v_nome  filmes.nome%TYPE;
    v_preco filmes.preco%TYPE;
BEGIN
    OPEN c_filmes;
    LOOP
        FETCH c_filmes INTO v_nome, v_preco;
        EXIT WHEN c_filmes%NOTFOUND;

        IF v_preco > 100 THEN
            RAISE_APPLICATION_ERROR(-20002, 'Erro: filme ' || v_nome || ' com preço acima do permitido!');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Filme: ' || v_nome || ' - Preço: ' || v_preco);
        END IF;
    END LOOP;
    CLOSE c_filmes;
END;


