CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE tb_funcionario (
	id_func INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    telefone INT,
    salario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_func)
);

INSERT INTO tb_funcionario (nome, email, telefone, salario) VALUES 
	("Helena", "helena@email.com", 866310569, 2500.00),
    ("Arthur", "arthur@email.com", 579393298, 1450.00),
	("Manuela", "manuela@email.com", 438537769, 2326.00),
	("Pedro", "pedro@email.com", 527842820, 5200.00),
	("Henrique", "henrique@email.com", 170195716, 3200.00);

SELECT id_func, nome, salario FROM tb_funcionario WHERE salario >= 2000
ORDER BY salario DESC; 

SELECT id_func, nome, salario FROM tb_funcionario WHERE salario <= 2000
ORDER BY salario DESC;

UPDATE tb_funcionario
SET salario = 2000.00
WHERE id_func = 2;

