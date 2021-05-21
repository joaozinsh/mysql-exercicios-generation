CREATE DATABASE db_construindo_a_nossa_vida;

USE db_construindo_a_nossa_vida;

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
	('Blocos', 'Blocos para construção'),
    ('Cimento, Area e Pedra', 'Argamassas em geral'),
    ('Telhas', 'Telhas em geral');
    
INSERT INTO tb_produto (nome, descricao, fk_categoria, preco)
VALUES
	('Bloco cerâmico', '09x19x19cm', 1, 1.09),
    ('Bloco de vidro', '19x19cm', 1, 13.99),
    ('Cimento', 'Saco 50kgs', 2, 29.99),
    ('Gesso', 'Saco 20Kg', 2, 22.90),
    ('Telha ondulada de fibrocimento', '244x110cm 6mm', 3, 59.90),
    ('Telha de cerâmica', '40x23cm', 3, 1.69);
    

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
WHERE tb_categoria.nome LIKE '%Blocos%'; 