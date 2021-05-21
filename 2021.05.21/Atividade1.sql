CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classe (
	id_classe INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_classe)
);

CREATE TABLE tb_personagem (
	id_personagem INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    fk_classe INT NOT NULL,
    poder_atk INT NOT NULL,
    poder_def INT NOT NULL,
    PRIMARY KEY (id_personagem),
    FOREIGN KEY (fk_classe) REFERENCES tb_classe(id_classe)
);

INSERT INTO tb_classe (nome, descricao)
VALUES
	('Guerreiro', 'Guerreiro destimido'),
    ('Ladrão', 'Ladrão com passos silenciosos'),
    ('Caçador', 'Caçador experiente'),
    ('Feitiçeiro', 'Feiticeiro de Vinheim'),
    ('Piromante', 'Piromante do grande pantano');

INSERT INTO tb_personagem (nome, fk_classe, poder_atk, poder_def)
VALUES
	('Buiuia', 1, 5000, 5000),
    ('Dimbinha', 3, 1600, 500),
    ('Tonho Macumba', 5, 1600, 500),
    ('Mauro Mandinga', 4, 2800, 1500),
    ('Janiscreide', 5, 2800, 1000),
    ('Gata Lindalva', 1, 3000, 2900),
    ('Trombadinha', 2, 1000, 1000),
    ('Cuiuia', 1, 3000, 2900);

-- select que retorne os personagens com o poder de ataque maior do que 2000.
SELECT nome, fk_classe, poder_atk, poder_def FROM tb_personagem WHERE poder_atk >= 2000;


-- select trazendo os personagens com poder de defesa entre 1000 e 2000.
SELECT nome, fk_classe, poder_atk, poder_def FROM tb_personagem WHERE poder_def BETWEEN 1000 and 2000;


-- select utilizando LIKE buscando os personagens com a letra C.
SELECT nome, fk_classe, poder_atk, poder_def FROM tb_personagem WHERE nome LIKE '%C%';


-- select com Inner join entre tabela classe e personagem.
SELECT tb_personagem.nome, tb_classe.nome AS classe, tb_classe.descricao, tb_personagem.poder_atk, tb_personagem.poder_def
FROM tb_personagem
INNER JOIN tb_classe ON tb_personagem.fk_classe = tb_classe.id_classe;


-- select onde traga todos os personagem de uma classe específica
SELECT tb_personagem.nome, tb_classe.nome AS classe, tb_classe.descricao, tb_personagem.poder_atk, tb_personagem.poder_def
FROM tb_personagem
INNER JOIN tb_classe ON tb_personagem.fk_classe = tb_classe.id_classe
WHERE tb_classe.nome LIKE '%Guerreiro%';