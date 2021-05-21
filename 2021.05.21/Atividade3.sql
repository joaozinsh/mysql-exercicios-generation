CREATE DATABASE db_farmacia_do_bem;

USE db_farmacia_do_bem;

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
	('Medicamentos', 'Medicamentos em geral'),
    ('Cosméticos', 'Cosméticos em geral'),
    ('Higiene', 'Higiene em geral');
    
INSERT INTO tb_produto (nome, descricao, fk_categoria, preco)
VALUES
	('Dorflex', 'Dorflex age na dor e relaxa a tensão muscular', 1, 5.89),
    ('Dipirona', 'A Dipirona é indicada para combater a febre, baixar a temperatura do corpo e aliviar a dor', 1, 4.99),
    ('Demaquilante', 'Remove as impurezas da pele sem agredi-la', 2, 85.99),
    ('Batom', 'Proporciona alta fixação, longa duração e hidratação imediata', 2, 21.99),
    ('Refil Sabonete Líquido', 'Sabonete líquido corporal em refil', 3, 2.95),
    ('Desororante Aerosol', 'Desodorante antitranspirante aerossol 48H', 3, 11.99);
    
    
-- select que retorne os Produtos com o valor maior do que 50 reais.
SELECT nome, descricao, preco FROM tb_produto WHERE preco >= 50;


-- select trazendo os Produtos com valor entre 3 e 60 reais.
SELECT nome, descricao, preco FROM tb_produto WHERE preco BETWEEN 3 and 60;


-- select utilizando LIKE buscando os Produtos com a letra B.
SELECT nome, descricao, preco FROM tb_produto WHERE nome LIKE '%B%';
    

-- select com Inner join entre tabela categoria e produto.
SELECT tb_produto.nome, tb_produto.descricao, tb_categoria.nome AS categoria, tb_produto.preco 
FROM tb_produto
INNER JOIN tb_categoria on tb_produto.fk_categoria = tb_categoria.id_categoria;
    

-- select onde traga todos os Produtos de uma categoria específica
 SELECT tb_produto.nome, tb_produto.descricao, tb_categoria.nome AS categoria, tb_produto.preco 
FROM tb_produto
INNER JOIN tb_categoria on tb_produto.fk_categoria = tb_categoria.id_categoria
WHERE tb_categoria.nome LIKE '%Higiene%';  