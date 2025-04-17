 /* Cursor: é um mecanismo em Pl / SQL  usado para processar varias linhas de uma
 consulta SQL. Ele permite que você percorra os resultados linha a linha facilitando
 a manipulação dos dados
 Existe 2 tipos de cursores: Implicitos e Explicitos.
 Implicitos - Criados pelo próprio SGBD
 Explicitos - Criados pelos programadores
 Etapas de Criação:
 1 - Declaração - Select (Associar)
 2 - Abertura (OPEN)
 3 - Leitura (FETCH)
 4 - Fechamento (CLOSE)
 */
 
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
 
 Select * from funcionarios;
 
 drop table pedidos;
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
 
 Select * from pedidos;
 
 SET SERVEROUTPUT ON;
 
 -- Exemplo 01 - Cursor Explicito
 DECLARE
       CURSOR c_funcionarios IS
          Select nome from funcionarios where departamento_id = 10;
          v_nome funcionarios.nome%TYPE;
BEGIN
  OPEN c_funcionarios;
  LOOP
    FETCH c_funcionarios INTO v_nome;
    Exit when c_funcionarios%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Funcionario: ' || v_nome);
    END LOOP;
    CLOSE c_funcionarios;
END;
/

-- Exemplo 02 - Cursor com parâmetro

DECLARE
    CURSOR c_pedidos(v_cliente_id NUMBER)IS
       Select id, valor From pedidos  WHERE  cliente_id = v_cliente_id; 
       v_pedido_id  pedidos.id%TYPE;
       v_valor pedidos.valor%TYPE;
       
BEGIN
  OPEN c_pedidos(4);
  LOOP
   FETCH c_pedidos INTO v_pedido_id, v_valor;
    Exit when c_pedidos%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Pedido ID: ' || v_pedido_id || ' Valor: ' || v_valor);
    END LOOP;
    Close c_pedidos;
END;
/
 
-- Exemplo 03 - Cursor  FOR LOOP
BEGIN
   FOR r_pedido IN(Select id, valor From pedidos WHERE valor >700)LOOP
   DBMS_OUTPUT.PUT_LINE('Pedido ID: ' || r_pedido.id || ' Valor: ' || r_pedido.valor);
   END LOOP;
   END;
   /