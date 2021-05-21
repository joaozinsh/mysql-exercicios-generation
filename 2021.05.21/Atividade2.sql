CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categoria (
	id_categoria INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_categoria)
);

CREATE TABLE tb_pizza (
	id_pizza INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    ingrediente VARCHAR(255) NOT NULL,
    fk_categoria INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_pizza),
    FOREIGN KEY (fk_categoria) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_categoria (nome, descricao)
VALUES
	('Salgada', 'Pizza do tipo salgada'),
    ('Doce', 'Pizza do tipo doce');

INSERT INTO tb_pizza (nome, ingrediente, fk_categoria, preco)
VALUES
	('Baru', 'Presunto, mussarela e rodelas de tomate', 1, 36.90),
    ('Entulho', 'Calabresa, presunto, frango, bacon, milho, ovos, cebola, catupiry, cheddar e mussarela', 1, 46.90),
    ('Frango Catupiry', 'Frango desfiado, catupiry e azeitonas', 1, 36.90),
    ('Brigadeiro', 'Chocolate e granulado', 2, 36.90),
    ('Romeu e Julieta', 'Mussarela e goiabada', 2, 36.90);


-- select que retorne os Produtos com o valor maior do que 45 reais.
SELECT nome, ingrediente, preco FROM tb_pizza WHERE preco >= 45;


-- select trazendo os Produtos com valor entre 29 e 60 reais.
SELECT nome, ingrediente, preco FROM tb_pizza WHERE preco BETWEEN 29 and 60;


-- select select utilizando LIKE buscando os Produtos com a letra C.
SELECT nome, ingrediente, preco FROM tb_pizza WHERE nome LIKE '%C%';


-- select com Inner join entre tabela categoria e pizza.
SELECT tb_pizza.nome, tb_pizza.ingrediente, tb_categoria.nome AS categoria, tb_pizza.preco
FROM tb_pizza
INNER JOIN tb_categoria ON tb_pizza.fk_categoria = tb_categoria.id_categoria;


-- select onde traga todos os Produtos de uma categoria específica
SELECT tb_pizza.nome, tb_pizza.ingrediente, tb_categoria.nome AS categoria, tb_pizza.preco
FROM tb_pizza
INNER JOIN tb_categoria ON tb_pizza.fk_categoria = tb_categoria.id_categoria
WHERE tb_categoria.nome LIKE '%Doce%';