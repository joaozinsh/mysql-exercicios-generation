CREATE DATABASE db_cidade_das_frutas;

USE db_cidade_das_frutas;

CREATE TABLE tb_categoria (
	id_categoria INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_categoria)
);

CREATE TABLE tb_produto (
	id_produto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    fk_categoria INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_produto),
    FOREIGN KEY (fk_categoria) REFERENCES tb_categoria(id_categoria)
);

INSERT INTO tb_categoria (nome, descricao)
VALUES
	('Frutas', 'Frutas frescas'),
    ('Verduras', 'Verduras frescas'),
    ('Legumes', 'Legumes frescos');
    
INSERT INTO tb_produto (nome, descricao, fk_categoria, preco)
VALUES
	('Maça', 'Saco de Maçã 1Kg', 1, 5.67),
    ('Banana', 'Cacho de Banana', 1, 3.19),
    ('Alface', 'Alface por unidade', 2, 1.20),
    ('Brocólis', 'Brocólis por unidade', 2, 7.50),
    ('Tomate', 'Tomate por Kg', 3, 3.70),
    ('Kit de Legumes', 'Kit de legumes com 14 diferentes legumes', 3, 55.00);
    
    
-- select que retorne os Produtos com o valor maior do que 50 reais.
SELECT nome, descricao, preco FROM tb_produto WHERE preco >= 50;


-- select trazendo os Produtos com valor entre 3 e 60 reais.
SELECT nome, descricao, preco FROM tb_produto WHERE preco BETWEEN 3 and 60;


-- select utilizando LIKE buscando os Produtos com a letra B.
SELECT nome, descricao, preco FROM tb_produto WHERE nome LIKE '%C%';
    

-- select com Inner join entre tabela categoria e produto.
SELECT tb_produto.nome, tb_produto.descricao, tb_categoria.nome AS categoria, tb_produto.preco 
FROM tb_produto
INNER JOIN tb_categoria on tb_produto.fk_categoria = tb_categoria.id_categoria;
    

-- select onde traga todos os Produtos de uma categoria específica
SELECT tb_produto.nome, tb_produto.descricao, tb_categoria.nome AS categoria, tb_produto.preco 
FROM tb_produto
INNER JOIN tb_categoria on tb_produto.fk_categoria = tb_categoria.id_categoria
WHERE tb_categoria.nome LIKE '%Verduras%'; 