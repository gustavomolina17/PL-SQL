CREATE TABLE filmes (
    id      NUMBER PRIMARY KEY,
    nome    VARCHAR2(100),
    genero  VARCHAR2(50),
    preco   NUMBER(6,2)
);

INSERT INTO filmes VALUES (1, 'Matrix', 'Ficção Científica', 25.00);
INSERT INTO filmes VALUES (2, 'Titanic', 'Romance', 19.90);
INSERT INTO filmes VALUES (3, 'Gladiador', 'Ação', 21.50);
INSERT INTO filmes VALUES (4, 'O Poderoso Chefão', 'Drama', 18.00);
INSERT INTO filmes VALUES (5, 'Avatar', 'Ficção Científica', 27.00);
INSERT INTO filmes VALUES (6, 'Vingadores', 'Ação', 23.90);
INSERT INTO filmes VALUES (7, 'Coringa', 'Drama', 22.00);
INSERT INTO filmes VALUES (8, 'Toy Story', 'Animação', 17.90);
INSERT INTO filmes VALUES (9, 'Shrek', 'Animação', 15.00);
INSERT INTO filmes VALUES (10, 'Interestelar', 'Ficção Científica', 28.00);


--- Exercício 1: Crie um cursor que percorra a tabela FILMES e exiba o nome e o gênero de todos os filmes.

DECLARE
    CURSOR c_filmes IS
        SELECT nome, genero FROM filmes;
    
    v_nome   filmes.nome%TYPE;
    v_genero filmes.genero%TYPE;
BEGIN
    OPEN c_filmes;
    LOOP
        FETCH c_filmes INTO v_nome, v_genero;
        EXIT WHEN c_filmes%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Nome: ' || v_nome || ' | Gênero: ' || v_genero);
    END LOOP;
    CLOSE c_filmes;
END;


--- Exercício 2: Crie um cursor que traga apenas os filmes com preço maior que 20. Use um FOR LOOP.

DECLARE
    CURSOR c_filmes_caros IS
        SELECT nome, preco FROM filmes WHERE preco > 20;
BEGIN
    FOR filme IN c_filmes_caros LOOP
        DBMS_OUTPUT.PUT_LINE('Filme: ' || filme.nome || ' | Preço: R$ ' || filme.preco);
    END LOOP;
END;

--- Exercício 3: Receba um número de departamento como parâmetro e
--- exiba os nomes dos funcionários desse departamento.

CREATE TABLE funcionarios (
    id              NUMBER PRIMARY KEY,
    nome            VARCHAR2(100),
    departamento_id NUMBER
);

INSERT INTO funcionarios VALUES (1, 'Ana Paula', 10);
INSERT INTO funcionarios VALUES (2, 'Carlos Eduardo', 20);
INSERT INTO funcionarios VALUES (3, 'Fernanda Lima', 10);
INSERT INTO funcionarios VALUES (4, 'João Pedro', 30);
INSERT INTO funcionarios VALUES (5, 'Marina Silva', 20);
INSERT INTO funcionarios VALUES (6, 'Roberto Carlos', 30);
INSERT INTO funcionarios VALUES (7, 'Juliana Alves', 10);
INSERT INTO funcionarios VALUES (8, 'Luiz Gustavo', 20);
INSERT INTO funcionarios VALUES (9, 'Sofia Costa', 10);
INSERT INTO funcionarios VALUES (10, 'Bruno Henrique', 30);

DECLARE
    CURSOR c_funcionarios(p_dept_id NUMBER) IS
        SELECT nome FROM funcionarios WHERE departamento_id = p_dept_id;
BEGIN
    FOR func IN c_funcionarios(10) LOOP  -- Substitua 10 pelo ID desejado
        DBMS_OUTPUT.PUT_LINE('Funcionário: ' || func.nome);
    END LOOP;
END;

--- Exercício 4: Percorra os pedidos de um cliente e calcule o total gasto por ele. Use um cursor com parâmetro cliente_id.

CREATE TABLE clientes (
    id    NUMBER PRIMARY KEY,
    nome  VARCHAR2(100)
);

INSERT INTO clientes VALUES (1, 'João Silva');
INSERT INTO clientes VALUES (2, 'Maria Oliveira');
INSERT INTO clientes VALUES (3, 'Pedro Souza');
INSERT INTO clientes VALUES (4, 'Lucas Mendes');
INSERT INTO clientes VALUES (5, 'Ana Costa');
INSERT INTO clientes VALUES (6, 'Felipe Rocha');
INSERT INTO clientes VALUES (7, 'Beatriz Martins');
INSERT INTO clientes VALUES (8, 'Rafael Dias');
INSERT INTO clientes VALUES (9, 'Juliana Ramos');
INSERT INTO clientes VALUES (10, 'Marcos Lima');

CREATE TABLE pedidos (
    id          NUMBER PRIMARY KEY,
    cliente_id  NUMBER,
    valor_total NUMBER(8,2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

INSERT INTO pedidos VALUES (1, 1, 150.00);
INSERT INTO pedidos VALUES (2, 2, 220.50);
INSERT INTO pedidos VALUES (3, 1, 75.00);
INSERT INTO pedidos VALUES (4, 3, 99.90);
INSERT INTO pedidos VALUES (5, 2, 49.90);
INSERT INTO pedidos VALUES (6, 4, 120.00);
INSERT INTO pedidos VALUES (7, 5, 300.00);
INSERT INTO pedidos VALUES (8, 1, 50.00);
INSERT INTO pedidos VALUES (9, 6, 200.00);
INSERT INTO pedidos VALUES (10, 1, 80.00);

DECLARE
    CURSOR c_pedidos(p_cliente_id NUMBER) IS
        SELECT valor_total FROM pedidos WHERE cliente_id = p_cliente_id;

    v_total NUMBER := 0;
BEGIN
    FOR pedido IN c_pedidos(1) LOOP  -- Substitua 1 pelo ID do cliente
        v_total := v_total + pedido.valor_total;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total gasto pelo cliente: R$ ' || v_total);
END;

--- Exercício 5: Para cada cliente, exiba os pedidos feitos por ele.
---  Use um cursor externo para clientes e um cursor interno para pedidos.

DECLARE
    CURSOR c_clientes IS
        SELECT id, nome FROM clientes;

    CURSOR c_pedidos(p_cliente_id NUMBER) IS
        SELECT id, valor_total FROM pedidos WHERE cliente_id = p_cliente_id;
BEGIN
    FOR cliente IN c_clientes LOOP
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || cliente.nome);

        FOR pedido IN c_pedidos(cliente.id) LOOP
            DBMS_OUTPUT.PUT_LINE('   Pedido ID: ' || pedido.id || ' | Valor: R$ ' || pedido.valor_total);
        END LOOP;
    END LOOP;
END;
