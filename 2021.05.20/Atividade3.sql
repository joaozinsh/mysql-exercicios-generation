CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_aluno (
	id_aluno INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    turma VARCHAR(255) NOT NULL,
    nota DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_aluno)
);

INSERT INTO tb_aluno (nome, email, turma, nota) VALUES
	("Helena", "helena@email.com", "18", 8),
    ("Arthur", "arthur@email.com", "18", 7),
    ("Manuela", "manuela@email.com", "18", 9),
    ("Helena", "helena@email.com", "22", 8),
    ("Pedro", "pedro@email.com", "22", 6),
    ("Henrique", "henrique@email.com", "22", 2),
    ("Daniela", "daniela@email.com", "22", 10),
    ("Lucas", "lucas@email.com", "21", 7);
    
SELECT * FROM tb_aluno WHERE nota >= 7
ORDER BY nota DESC;

SELECT * FROM tb_aluno WHERE nota <= 7
ORDER BY nota DESC;

UPDATE tb_aluno
SET nota = 4
WHERE id_produto = 6;