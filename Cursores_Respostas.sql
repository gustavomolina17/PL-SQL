-- Tabela Funcionarios
 Create table funcionarios(
 id NUMBER primary key,
 nome varchar(20),
 departamento_id Number
 );
 
 --- Inserindo dados
 INSERT INTO funcionarios VALUES(1,'Carlos Silva',10);
 INSERT INTO funcionarios VALUES(2,'Ana Souza',10);
 INSERT INTO funcionarios VALUES(3,'Marcos Lima',20);
 INSERT INTO funcionarios VALUES(4,'Silas Malafia',20);
 INSERT INTO funcionarios VALUES(5,'Anakin Skywalker',10);
 
 Create table pedidos(
 id Number primary key,
 cliente_id number,
 valor number(10,2)
 );
 
 INSERT INTO pedidos VALUES(101,5,450.00);
 INSERT INTO pedidos VALUES(102,4,600.00);
 INSERT INTO pedidos VALUES(103,3,700.00);
 INSERT INTO pedidos VALUES(104,2,850.00);
 INSERT INTO pedidos VALUES(105,1,999.00);

-- ====================================================
-- 1 - Cursor explícito que percorre a tabela FUNCIONARIOS
--     e exibe o ID e Nome dos funcionários do depto 20
-- ====================================================
BEGIN
  DECLARE
    v_id FUNCIONARIOS.ID%TYPE;
    v_nome FUNCIONARIOS.NOME%TYPE;

    CURSOR c_func_depto IS
      SELECT ID, NOME
      FROM FUNCIONARIOS
      WHERE DEPARTAMENTO_ID = 20;

  BEGIN
    OPEN c_func_depto;
    LOOP
      FETCH c_func_depto INTO v_id, v_nome;
      EXIT WHEN c_func_depto%NOTFOUND;

      -- Exibe ID e Nome dos funcionários do departamento 20
      DBMS_OUTPUT.PUT_LINE('ID: ' || v_id || ', Nome: ' || v_nome);
    END LOOP;
    CLOSE c_func_depto;
  END;
END;
/
-- ====================================================


-- ====================================================
-- 2 - Cursor com parâmetro que exibe os pedidos
--     cujo valor seja maior que o valor informado
-- ====================================================
BEGIN
  DECLARE
    CURSOR c_pedidos(valor_min NUMBER) IS
      SELECT ID, VALOR
      FROM PEDIDOS
      WHERE VALOR > valor_min;

  BEGIN
    -- Altere o valor conforme desejar
    FOR pedido IN c_pedidos(1000) LOOP
      DBMS_OUTPUT.PUT_LINE('Pedido ID: ' || pedido.ID || ', Valor: ' || pedido.VALOR);
    END LOOP;
  END;
END;
/
-- ====================================================


-- ====================================================
-- 3 - Versão do exercício 1 usando FOR LOOP
--     (sem open/fetch/close)
-- ====================================================
BEGIN
  DECLARE
    CURSOR c_func_depto IS
      SELECT ID, NOME
      FROM FUNCIONARIOS
      WHERE DEPARTAMENTO_ID = 20;

  BEGIN
    FOR funcionario IN c_func_depto LOOP
      DBMS_OUTPUT.PUT_LINE('ID: ' || funcionario.ID || ', Nome: ' || funcionario.NOME);
    END LOOP;
  END;
END;
/
-- ====================================================


-- ====================================================
-- 4 - Versão do exercício 2 com dois parâmetros:
--     valor mínimo e cliente_id
-- ====================================================
BEGIN
  DECLARE
    -- Cursor com dois parâmetros
    CURSOR c_pedidos(valor_min NUMBER, cliente_id NUMBER) IS
      SELECT ID, VALOR
      FROM PEDIDOS
      WHERE VALOR > valor_min
        AND CLIENTE_ID = cliente_id;

  BEGIN
    -- Altere os valores conforme desejar
    FOR pedido IN c_pedidos(1000, 5) LOOP
      DBMS_OUTPUT.PUT_LINE('Pedido ID: ' || pedido.ID || ', Valor: ' || pedido.VALOR);
    END LOOP;
  END;
END;
/
-- ====================================================



