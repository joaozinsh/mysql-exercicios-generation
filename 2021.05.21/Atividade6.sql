CREATE DATABASE db_cursoDaMinhaVida;

USE db_cursoDaMinhaVida;

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
	('Programação', 'Cursos de TI'),
    ('Design', 'Cursos de Design'),
    ('Negócios', 'Cursos de Negócios');
    
INSERT INTO tb_produto (nome, descricao, fk_categoria, preco)
VALUES
	('Java', 'Linguagem de programação Java', 1, 80.00),
    ('Python', 'Linguagem de programação Python', 1, 80.00),
    ('Plano de negócios', 'Plano de negócios para empreendedores', 2, 69.90),
    ('Blogging', 'Criação de conteudo para Blog', 2, 22.90),
    ('Photoshop', 'Edição de imagens', 3, 69.90),
    ('Illustrator', 'Ilustraçãoes vetoriais', 3, 69.90);
    

-- select que retorne os Produtos com o valor maior do que 50 reais.
SELECT nome, descricao, preco FROM tb_produto WHERE preco >= 50;


-- select trazendo os Produtos com valor entre 3 e 60 reais.
SELECT nome, descricao, preco FROM tb_produto WHERE preco BETWEEN 3 and 60;


-- select utilizando LIKE buscando os Produtos com a letra B.
SELECT nome, descricao, preco FROM tb_produto WHERE nome LIKE '%J%';
    

-- select com Inner join entre tabela categoria e produto.
SELECT tb_produto.nome, tb_produto.descricao, tb_categoria.nome AS categoria, tb_produto.preco 
FROM tb_produto
INNER JOIN tb_categoria on tb_produto.fk_categoria = tb_categoria.id_categoria;
    

-- select onde traga todos os Produtos de uma categoria específica
SELECT tb_produto.nome, tb_produto.descricao, tb_categoria.nome AS categoria, tb_produto.preco 
FROM tb_produto
INNER JOIN tb_categoria on tb_produto.fk_categoria = tb_categoria.id_categoria
WHERE tb_categoria.nome LIKE '%Programação%'; 