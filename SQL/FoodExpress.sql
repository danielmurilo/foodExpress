CREATE DATABASE foodExpress;
USE foodexpress;

-- DDL -> DATA DEFINITION LANGUAGE
CREATE TABLE endereco (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	logradouro VARCHAR(30) NOT NULL,
	numero VARCHAR(5) NOT NULL,
	bairro VARCHAR(30) NOT NULL,
	cidade VARCHAR(30) NOT NULL,
	uf CHAR(2) NOT NULL,
	complemento VARCHAR(20),
	referencia VARCHAR(60) NOT NULL,
	cep VARCHAR(10) NOT NULL
);

CREATE TABLE cliente (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	telefone VARCHAR(15),
	data_cadastro DATE NOT NULL,
    senha VARCHAR(12) NOT NULL,
	id_endereco INTEGER, -- CLIENTE PODE SE CADASTRAR E ADICIONAR ENDEREÇO POSTERIORMENTE
	FOREIGN KEY(id_endereco) REFERENCES endereco(id)
);

CREATE TABLE produto (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	descricao VARCHAR(200), -- DESCRIÇÕES NÃO SÃO OBRIGATÓRIAS!
	preco DECIMAL(10,2) NOT NULL,
	ativo BOOLEAN DEFAULT(0)
);

CREATE TABLE funcionario (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	cargo VARCHAR(20) NOT NULL,
    senha VARCHAR(12) NOT NULL
);

CREATE TABLE pedido (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	hora_pedido DATETIME NOT NULL,
	id_cliente INTEGER NOT NULL,
	FOREIGN KEY(id_cliente) REFERENCES cliente(id),
    id_funcionario INTEGER NOT NULL,
    FOREIGN KEY(id_funcionario) REFERENCES funcionario(id)
);

CREATE TABLE item_pedido (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	id_pedido INTEGER NOT NULL,
	id_produto INTEGER NOT NULL,
	quantidade INTEGER NOT NULL,
	observacao VARCHAR(50), -- OBERVAÇÕES NÃO SÃO OBRIGATÓRIAS!
	valor_venda DECIMAL(10,2) NOT NULL,
	FOREIGN KEY(id_pedido) REFERENCES pedido(id),
	FOREIGN KEY(id_produto) REFERENCES produto(id)
);

-- DML -> DATA MANIPULATION LANGUAGE
-- INSERINDO BEBIDAS ID - NOME, OBS, PREÇO, STATUS (1 ATIVO - 2 INATIVO)
INSERT INTO produto VALUES(NULL, "Coca-Cola Lata 350ml", "", 5.00, 1);
INSERT INTO produto VALUES(NULL, "Coca-Cola Zero Lata 350ml", "", 5.00, 1);
INSERT INTO produto VALUES(NULL, "Fanta Laranja Lata 350ml", "", 4.50, 1);
INSERT INTO produto VALUES(NULL, "Fanta Guaraná Lata 350ml", "", 4.50, 1);
INSERT INTO produto VALUES(NULL, "Sprite Lata 350ml", "", 4.50, 1);
INSERT INTO produto VALUES(NULL, "Guaraná Antarctica Lata 350ml", "", 4.50, 1);
INSERT INTO produto VALUES(NULL, "Pepsi-Cola Lata 350ml", "", 4.50, 1);
INSERT INTO produto VALUES(NULL, "Coca-Cola Garrafa 500ml", "", 7.50, 1);
INSERT INTO produto VALUES(NULL, "Fanta Laranja Garrafa 500ml", "", 7.50, 1);
INSERT INTO produto VALUES(NULL, "Guaraná Antarctica 500ml", "", 7.50, 1);
INSERT INTO produto VALUES(NULL, "Coca-Cola Garrafa 2 litros", "", 14.50, 1);
INSERT INTO produto VALUES(NULL, "Coca-Cola Zero 2 litros", "", 14.50, 1);
INSERT INTO produto VALUES(NULL, "Fanta Laranja Garrafa 2 litros", "", 12.50, 1);
INSERT INTO produto VALUES(NULL, "Água Mineral Sem Gás 500ml", "", 2.00, 1);
INSERT INTO produto VALUES(NULL, "Água Mineral Com Gás 500ml", "", 2.50, 1);
INSERT INTO produto VALUES(NULL, "H2O Garrafa 500ml", "", 6.50, 1);
-- INSERINDO SANDUÍCHES
INSERT INTO produto VALUES(NULL, "Zen", "Pão gergelim, burguer fraldinha 160G, queijo, bacon e molho especial.", 22.90, 1);
INSERT INTO produto VALUES(NULL, "Seu Zé", "Pão gergelim, 2 carnes angus de 130G, queijo prato duplo, bacon, cebola chapeada e molho especial.", 23.90, 1);
INSERT INTO produto VALUES(NULL, "O Famoso Cupim", "Pão gergelim, carne cupim 180G, queijo prato derretido, bacon, cebola chapeada, tomate, alface e molho especial.", 23.90, 1);
INSERT INTO produto VALUES(NULL, "Costela Angus", "Pão brioche, burguer costela de 200G, queijo prato, bacon, cebola chapeada e molho especial.", 23.90, 1);
INSERT INTO produto VALUES(NULL, "O Famoso Quarteirão", "Pão, burguer angus 130G, queijo prato, picles, cebola, ketchup, mostarda e molho especial.", 16.90, 1);
INSERT INTO produto VALUES(NULL, "Gran Picanha", "Pão brioche, carne picanha 180G, queijo emental, bacon, maionese temperada e alho maçaricado.", 25.90, 1);
INSERT INTO produto VALUES(NULL, "Angus Super Especial", "Pão brioche, hambúrguer angus bovino, 120g, queijo, presunto, hambúrguer artesanal de frango 120g, bacon, ovo e molho especial.", 25.90, 1);
INSERT INTO produto VALUES(NULL, "Maminha Grill", "Pão brioche, burguer maminha 180g , queijo prato, bacon, picles e maionese de bacon.", 22.90, 1);
INSERT INTO produto VALUES(NULL, "Cheese picanha suína", "Pão bola , picanha suína , queijo prato derretido, bacon, alface, tomates e molho especial.", 18.90, 1);
INSERT INTO produto VALUES(NULL, "Cheese Picanha", "Pão bola, picanha bovino 120G, queijo, bacon,tomate, alface e molho da casa.", 19.90, 1);
INSERT INTO produto VALUES(NULL, "Zé Burguer Especial", "Pão bola, 2 hambúrgueres aurora 90g, queijo, presunto, ovo, tomate, alface, milho verde e molho da casa.", 16.90, 1);
INSERT INTO produto VALUES(NULL, "Zé Burguer", "Pão bola, hambúrguer aurora 90G, queijo, presunto, ovo, tomate, alface, milho verde e molho da casa.", 15.50, 1);
INSERT INTO produto VALUES(NULL, "Chicken Burguer", "Pão bola, burguer artesanal de frango 120G, queijo, presunto, ovo, milho verde, tomate, alface e molho da casa.", 18.90, 1);
INSERT INTO produto VALUES(NULL, "Chicken Crock", "Pão bola, filé de frango empanado 140G, queijo, tomate, alface e molho da casa.", 13.90, 1);
INSERT INTO produto VALUES(NULL, "Cheese Leitão", "Pão bola, filé suíno de 120G, queijo, bacon, tomate, alface, molho barbecue e molho da casa.", 18.90, 1);
INSERT INTO produto VALUES(NULL, "Duplo Cheese Burguer", "Pão bola, 2 hambúrgueres Aurora 90G, queijo, tomate, alface e molho da casa.", 15.90, 1);
INSERT INTO produto VALUES(NULL, "Cheese Egg Bacon", "Pão bola, hambúrguer aurora 90G, queijo, bacon, ovo, tomate, alface e molho da casa.", 15.50, 1);
INSERT INTO produto VALUES(NULL, "Cheese Bacon", "Pão bola, hambúrguer aurora 90G, queijo, bacon, tomate, alface e molho da casa.", 14.50, 1);
INSERT INTO produto VALUES(NULL, "Cheese Egg", "Pão bola, hambúrguer aurora 90G, queijo, ovo, tomate, alface e molho da casa.", 12.50, 1);
INSERT INTO produto VALUES(NULL, "Cheddar Burguer", "Pão bola, hambúrguer aurora 90G, queijo cheddar, tomate, alface e molho da casa.", 11.50, 1);
INSERT INTO produto VALUES(NULL, "Cheese Burguer", "Pão bola, hambúrguer aurora 90G, queijo, tomate, alface e molho da casa.", 11.50, 1);
INSERT INTO produto VALUES(NULL, "Americano", "Pão bola, queijo, presunto, 2 ovos, bacon tomate, alface e molho da casa.", 11.50, 1);
INSERT INTO produto VALUES(NULL, "Fritas Pequena", "Batatas Fritas em porção pequena (84 gramas)", 8.00, 1);
INSERT INTO produto VALUES(NULL, "Fritas Grande", "Batatas Fritas em porção grande (128 gramas)", 13.0, 1);

-- CADASTRANDO FUNCIONÁRIOS - NOME - FUNÇÃO - SENHA
INSERT INTO funcionario VALUES(NULL, "Marcos Paulo", "Garçom/Garçonete", "******");
INSERT INTO funcionario VALUES(NULL, "José Francisco", "Garçom/Garçonete", "******");
INSERT INTO funcionario VALUES(NULL, "Matias Ferreira", "Garçom/Garçonete", "******");
INSERT INTO funcionario VALUES(NULL, "Danilo José", "Garçom/Garçonete", "******");
INSERT INTO funcionario VALUES(NULL, "Paulo da Silva", "Garçom/Garçonete", "******");
INSERT INTO funcionario VALUES(NULL, "Bernadete Oliveira", "Caixa", "******");
INSERT INTO funcionario VALUES(NULL, "Marcio Paixão", "Caixa", "******");
INSERT INTO funcionario VALUES(NULL, "José Firmino", "Cozinheiro(a)", "******");
INSERT INTO funcionariO VALUES(NULL, "Alexandre Estevão", "Cozinheiro(a)", "******");
INSERT INTO funcionario VALUES(NULL, "Antônio Pugliesi", "Gerente", "******");
INSERT INTO funcionario VALUES(NULL, "Sebastião Nogueira", "Proprietário", "******");
INSERT INTO funcionario VALUES(NULL, "Daniel Guedes", "TI", "******");

-- CADASTRANDO ENDERECO RUA, NUMERO, BAIRRO, CIDADE, UF, COMPLEMENTO, PONTO DE REFERÊNCIA E CEP
INSERT INTO endereco VALUES(NULL, "Rua Sá e Souza", "192", "Boa Viagem", "Recife", "PE", "Apto 523", "Próximo Colégio Madre de Deus", "51.698-232");
INSERT INTO endereco VALUES(NULL, "Av. Jean Emille de Favre", "3698", "Ipsep", "Recife", "PE", "Casa", "Posto BR", "52.956-612");
INSERT INTO endereco VALUES(NULL, "Rua Paes Cabral", "333", "Cordeiro", "Recife", "PE", "Casa", "Próximo a Padaria Doce Pão", "50.630-170");
INSERT INTO endereco VALUES(NULL, "Rua Baltazar Passos", "1025", "Boa Viagem", "Recife", "PE", "Apto 1402", "Próximo Academia Maysa", "51.130-290");
INSERT INTO endereco VALUES(NULL, "Av Boa Viagem", "4880", "Boa Viagem", "Recife", "PE", "Apto 1805", "Próximo ao Parque Dona Lindu", "51.020-001");
INSERT INTO endereco VALUES(NULL, "Rua Renascença", "168", "Cajueiro Seco", "Jaboatão dos Guararapes", "PE", "Casa", "Prox. Oficina do Arlindo", "54.330-510");
INSERT INTO endereco VALUES(NULL, "Rua Gen. Abreu e Lima", "426", "Piedade", "Jaboatão dos Guararapes", "PE", "Suíte 53", "Lemon Motel Piedade", "54400-410");
INSERT INTO endereco VALUES(NULL, "Av Boa Viagem", "3500", "Boa Viagem", "Recife", "PE", "Portaria", "Edf Portugal", "51.020-001");
INSERT INTO endereco VALUES(NULL, "Rua Cárceres", "2314", "Candeias", "Jaboatão dos Guararapes", "PE", "Apto 101 - Bloco Z", "Praia de Piedade Condomínio Clube", "54.420-310");
INSERT INTO endereco VALUES(NULL, "Rua Baltazar Passos", "1300", "Boa Viagem", "Recife", "PE", "Casa", "Próximo ao Colégio Dourado", "51.130-290");

-- CADASTRANDO CLIENTES
INSERT INTO CLIENTE (nome, email, telefone, data_cadastro, senha, id_endereco) VALUES("Fabiano Assis","fabiano@gmail.com", "(81)98989-7895", CURRENT_DATE(), "******", 1);
INSERT INTO CLIENTE (nome, email, telefone, data_cadastro, senha, id_endereco) VALUES("Maria Auxiliadora","maria.aux@hotmail.com", "(81)95447-1328", CURRENT_DATE(), "******", 2);
INSERT INTO CLIENTE (nome, email, telefone, data_cadastro, senha, id_endereco) VALUES("Josefa Arabiana","josefa.arabiana@ig.com.br", "(81)97845-9633", CURRENT_DATE(), "******", 3);
INSERT INTO CLIENTE (nome, email, telefone, data_cadastro, senha, id_endereco) VALUES("Aline Perez","alineperez@gmail.com", "(81)92579-7744", CURRENT_DATE(), "******", 4);
INSERT INTO CLIENTE (nome, email, telefone, data_cadastro, senha, id_endereco) VALUES("Alba Guimarães", "alba.guimaraes@gmail.com", "(81)92145-9863", CURRENT_DATE(), "******", 5);
INSERT INTO CLIENTE (nome, email, telefone, data_cadastro, senha, id_endereco) VALUES("Fernando Marques", "fernando_marques@parkhotel.com.br", "(81)99658-7863", CURRENT_DATE(), "******", 6);
INSERT INTO CLIENTE (nome, email, telefone, data_cadastro, senha, id_endereco) VALUES("Carlos Tevez","carlos_tevez@yahoo.com.de", "(81)96655-8745", CURRENT_DATE(), "******", 7);
INSERT INTO CLIENTE (nome, email, telefone, data_cadastro, senha, id_endereco) VALUES("João Carlos Oliveira", "joaocarlos@vilarica.com.br", "(81)93669-8552", CURRENT_DATE(), "******", 8);
INSERT INTO CLIENTE (nome, email, telefone, data_cadastro, senha, id_endereco) VALUES("Neide Costa","neide.costa@borna.com", "(81)98989-7412", CURRENT_DATE(), "******", 9);
INSERT INTO CLIENTE (nome, email, telefone, data_cadastro, senha, id_endereco) VALUES("Edmilson Silva", "edmilson@ted.com", "(81)93669-8557", CURRENT_DATE(), "******", 10);

-- INSERINDO PEDIDOS
INSERT INTO pedido VALUES(NULL, "2022-10-27 13:45:56",1, 3);
INSERT INTO pedido VALUES(NULL, "2022-10-27 14:25:38",2, 3);
INSERT INTO pedido VALUES(NULL, "2022-10-27 14:36:51",3, 3);
INSERT INTO pedido VALUES(NULL, "2022-10-27 14:52:28",4, 3);
INSERT INTO pedido VALUES(NULL, "2022-10-27 14:58:22",5, 3);
INSERT INTO pedido VALUES(NULL, "2022-10-27 15:02:17",6, 3);
INSERT INTO pedido VALUES(NULL, "2022-10-27 15:09:11",7, 3);
INSERT INTO pedido VALUES(NULL, "2022-10-27 15:16:19",8, 3);
INSERT INTO pedido VALUES(NULL, "2022-10-27 15:26:31",9, 3);
INSERT INTO pedido VALUES(NULL, "2022-10-27 16:03:19",10, 3);
INSERT INTO pedido VALUES(NULL, "2022-10-29 11:49:12",1, 4);

-- INSERINDO ITENS AOS PEDIDOS (null, PEDIDO, PRODUTO, QTD, OBS E VALOR_VENDA)
INSERT INTO item_pedido VALUES(NULL, 1, 4, 1, "Obs: Fanta gelada!", 4.50);
INSERT INTO item_pedido VALUES(NULL, 1, 3, 2, "", 4.50);
INSERT INTO item_pedido VALUES(NULL, 1, 23, 1, "Sem Maionese/molho", 22.90);
INSERT INTO item_pedido VALUES(NULL, 1, 20, 1, "Bem passado e sem verdura", 23.90);
INSERT INTO item_pedido VALUES(NULL, 2, 2, 1, "favor enviar gelo a parte", 5.00);
INSERT INTO item_pedido VALUES(NULL, 2, 28, 1, "mal passado e com bastante molho especial", 22.90);
INSERT INTO item_pedido VALUES(NULL, 3, 1, 2, "", 5.00);
INSERT INTO item_pedido VALUES(NULL, 4, 6, 1, "", 4.50);
INSERT INTO item_pedido VALUES(NULL, 4, 33, 1, "NO CAPRICHO!", 15.90);
INSERT INTO item_pedido VALUES(NULL, 4, 39, 1, "", 8.00);
INSERT INTO item_pedido VALUES(NULL, 5, 37, 2, "catchup e maionese para viagem", 11.50);
INSERT INTO item_pedido VALUES(NULL, 6, 31, 1, "", 18.90);
INSERT INTO item_pedido VALUES(NULL, 7, 27, 1, "VIAGEM", 4.50);
INSERT INTO item_pedido VALUES(NULL, 7, 1, 1, "VIAGEM", 5.00);
INSERT INTO item_pedido VALUES(NULL, 8, 23, 1, "MAL PASSADO", 25.90);
INSERT INTO item_pedido VALUES(NULL, 8, 3, 1, "", 4.50);
INSERT INTO item_pedido VALUES(NULL, 8, 5, 1, "", 4.50);
INSERT INTO item_pedido VALUES(NULL, 9, 3, 1, "IREI RETIRAR NO LOCAL", 4.50);
INSERT INTO item_pedido VALUES(NULL, 10, 30, 1, "com maionese", 13.90);
INSERT INTO item_pedido VALUES(NULL, 10, 28, 1, "com maionese", 15.50);
INSERT INTO item_pedido VALUES(NULL, 10, 31, 1, "com maionese", 18.90);
INSERT INTO item_pedido VALUES(NULL, 10, 33, 1, "com maionese", 15.50);
INSERT INTO item_pedido VALUES(NULL, 10, 3, 2, "", 4.50);
INSERT INTO item_pedido VALUES(NULL, 10, 1, 1, "", 5.00);
INSERT INTO item_pedido VALUES(NULL, 11, 1, 2, "", 5.00);
INSERT INTO item_pedido VALUES(NULL, 11, 28, 1, "", 15.50);
INSERT INTO item_pedido VALUES(NULL, 11, 39, 1, "", 8.00);

-- ATUALIZANDO PRECO DE PRODUTO COM ID 16
UPDATE produto SET preco = 8.00 WHERE ID = 16;

-- DQL -> DATA QUERY LANGUAGE
SELECT * FROM funcionario;
SELECT * FROM endereco;
SELECT * FROM cliente;
SELECT * FROM produto;
SELECT * FROM pedido;
SELECT * FROM item_pedido;

select * from pedido where pedido.id_cliente = 1;

-- EXIBINDO CLIENTES COM ENDEREÇO:
SELECT * FROM cliente INNER JOIN endereco on cliente.id_endereco = endereco.id;

-- EXIBINDO HISTÓRICO DE PEDIDOS DO CLIENTE DE ID = 1:
SELECT id_pedido AS Pedido, 
DATE_FORMAT(hora_pedido,'%H:%i:%s %d/%m/%Y') AS Hora_Data, 
cliente.nome AS Cliente,
endereco.bairro AS Entregue_Em, 
produto.nome AS Produto, 
item_pedido.valor_venda, 2 AS Valor_Unitário,
item_pedido.quantidade AS QTD, 
(item_pedido.quantidade * item_pedido.valor_venda) AS Total,
funcionario.nome AS Atendido_Por 
FROM item_pedido 
INNER JOIN pedido ON item_pedido.id_pedido = pedido.id 
INNER JOIN produto ON item_pedido.id_produto = produto.id 
INNER JOIN cliente ON pedido.id_cliente = cliente.id 
INNER JOIN endereco ON cliente.id_endereco = endereco.id 
INNER JOIN funcionario ON pedido.id_funcionario = funcionario.id
WHERE cliente.id = 1 ORDER BY pedido.id;

-- EM QUAIS BAIRROS ESTA LANCHONETE JÁ ENTREGOU?
SELECT endereco.bairro, COUNT(*) AS Entregue_quantas_vezes
FROM pedido 
INNER JOIN cliente ON pedido.id_cliente = cliente.id 
INNER JOIN endereco ON cliente.id_endereco = endereco.id 
GROUP BY endereco.bairro;

-- EXIBINDO TODAS AS CONTAS COM VALOR TOTAL
SELECT pedido.id AS Pedido, 
cliente.nome AS Cliente,
SUM(item_pedido.valor_venda) AS Total_R$ FROM PEDIDO
INNER JOIN item_pedido ON pedido.id = item_pedido.id_pedido
INNER JOIN cliente ON cliente.id = pedido.id_cliente GROUP BY pedido.id ORDER BY pedido.id; 

-- EXIBIR EXTRATO DO PEDIDO DE ID 10
SELECT pedido.id AS Pedido,
produto.nome AS Produto,
item_pedido.valor_venda AS Valor_Unitario,
item_pedido.quantidade AS QTD,
(item_pedido.valor_venda * item_pedido.quantidade) AS Total
 FROM item_pedido
 INNER JOIN pedido ON pedido.id = item_pedido.id_pedido
 INNER JOIN produto ON item_pedido.id_produto = produto.id
 WHERE item_pedido.id_pedido = 10;


