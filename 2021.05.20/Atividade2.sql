CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produto (
	id_produto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255),
    marca VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_produto)
);

INSERT INTO tb_produto (nome, descricao, marca, preco) VALUES
	("Bolacha", "Bolacha recheada sabor limão", "Adria", 2.49),
    ("Bolacha", "Bolacha recheada sabor chocolate", "Bauducco", 2.49),
    ("Arroz", "Arroz branco", "Tio João", 22.90),
    ("TV", "TV LED 58 polegadas", "Samsung", 2975.99),
    ("Xbox Series X", "Console Xbox Series X", "Microsoft", 6080.00),
    ("Geladeira", "Geladeira Frost Free", "Electrolux", 3419.10),
    ("Margarina", "Margarina sem sal", "Qualy", 6.79),
    ("Macarrão", "Macarrão espaguete", "Adria", 3.79);
    
SELECT * FROM tb_produto WHERE preco >= 500
ORDER BY preco DESC;

SELECT * FROM tb_produto WHERE preco <= 500
ORDER BY preco DESC;

UPDATE tb_produto
SET preco = 8.00
WHERE id_produto = 7;