Set SERVEROUTPUT ON;

--- Exceção 01: DIVISÃO por ZERO

Begin
   Declare
   v_resultado Number;
   Begin -- Bloco da exception
   v_resultado :=10/0; --- Exceção
   DBMS_Output.put_line('Resultado: ' || v_resultado);
   EXCEPTION
     WHEN ZERO_DIVIDE THEN
     DBMS_Output.put_line('Erro divisão por zero');
END; -- End da exception
END;
/

--- Exceção 02: Nenhum dado encontrado (NO_DATA_FOUND)

drop table funcionarios2
-- Tabela Funcionarios
 Create table funcionarios2(
 id NUMBER primary key,
 nome varchar(20),
 departamento_id Number
 );
 
 --- Inserindo dados
 INSERT INTO funcionarios2 VALUES(1,'Carlos Silva',10);
 INSERT INTO funcionarios2 VALUES(2,'Ana Souza',10);
 INSERT INTO funcionarios2 VALUES(3,'Marcos Lima',20);
 INSERT INTO funcionarios2 VALUES(4,'Silas Malafia',20);
 INSERT INTO funcionarios2 VALUES(5,'Anakin Skywalker',10);
 INSERT INTO funcionarios2 VALUES(7,'Anakin Skywalker',20);
 
 Create table pedidos2(
 id Number primary key,
 cliente_id number,
 valor number(10,2)
 );
 
 INSERT INTO pedidos2 VALUES(101,5,450.00);
 INSERT INTO pedidos2 VALUES(102,4,600.00);
 INSERT INTO pedidos2 VALUES(103,3,700.00);
 INSERT INTO pedidos2 VALUES(104,2,850.00);
 INSERT INTO pedidos2 VALUES(105,1,999.00);
 
 --- Exceção
 Begin
 Declare
 v_nome FUNCIONARIOS2.nome%type;
 Begin
  --Busca por um id que não existe
  Select nome INTO v_nome
  from funcionarios2
  where id = 6;
  DBMS_Output.put_line('Nome do funcionário: ' || v_nome);
  
  EXCEPTION 
  When NO_DATA_FOUND THEN
  DBMS_Output.put_line('Funcionário não encontrado');
  
  End;
  End;
  /
 
 --- Exceção 03: Select com mais de um resultado (TOO_MANY_ROWS)

Begin
 Declare
 v_nome FUNCIONARIOS2.nome%type;
 Begin
  --Busca por um id que não existe
  Select nome INTO v_nome
  from funcionarios2; --- Temos 2 ANAKINS
 DBMS_Output.put_line('Nome do funcionário: ' || v_nome);
  
  EXCEPTION 
  When TOO_MANY_ROWS THEN
  DBMS_Output.put_line('Erro: existem muitos resultados encontrados');
  
  End;
  End;
  /
  
   --- Exceção 04: Erro de valor (VALUE_ERROR)
   BEGIN
   Declare
   v_nome VARCHAR2(30):= 'Ricardo';
   Begin
   DBMS_Output.put_line('Nome: ' || v_nome);
  EXCEPTION 
  When Value_ERROR THEN
  DBMS_Output.put_line('Erro: Valor muito grande para a variável');
  End;
  End;
  /
   
 --- Exceção 05 - Criando sua Própria exception
 Begin
 Declare
 v_idade NUMBER := 19;
 ex_menor_idade EXCEPTION;
 BEGIN
 IF v_idade < 18 THEN
 RAISE ex_menor_idade; -- Dispara a exceção que vocÊ criou
 END IF;
 DBMS_Output.put_line('Parabéns você é DI MAIOR');
 EXCEPTION 
  When ex_menor_idade THEN
  DBMS_Output.put_line('Erro: Você é DI MENOR');
  End;
  End;
  /
 
 
 
   
   
   
   
