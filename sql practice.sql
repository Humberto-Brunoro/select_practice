CREATE DATABASE DDL_DML_DQL;
DROP DATABASE DDL_DML_DQL;
USE DDL_DML_DQL;
SHOW TABLES;
DROP TABLE usuarios;

CREATE TABLE IF NOT EXISTS livros (
	livro_id INT NOT NULL AUTO_INCREMENT 
,	titulo VARCHAR(255) NOT NULL
,	autor VARCHAR(255) NOT NULL
,	ano_publicacao INT NOT NULL
,	disponibilidade BOOLEAN DEFAULT TRUE NOT NULL
,	PRIMARY KEY (livro_id)
);

CREATE TABLE IF NOT EXISTS usuarios (
	usuario_id INT NOT NULL AUTO_INCREMENT 
,	nome VARCHAR(255)
,	email VARCHAR(255)
,	telefone VARCHAR(15)
,	PRIMARY KEY (usuario_id)
);

CREATE TABLE IF NOT EXISTS emprestimos (
	emprestimo_id INT NOT NULL AUTO_INCREMENT
,	data_emprestimo DATE NOT NULL
,	data_devolucao_prevista DATE NOT NULL
,	devolucao BOOLEAN DEFAULT TRUE NOT NULL
,	livro_id INT NOT NULL
,	usuario_id INT NOT NULL
,	PRIMARY KEY (emprestimo_id)
,	CONSTRAINT livros_emprestimos FOREIGN KEY (livro_id) REFERENCES livros(livro_id)
,	CONSTRAINT usuarios_emprestimos FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
); 

INSERT INTO livros (livro_id, titulo, autor, ano_publicacao, disponibilidade)
VALUES (1, 'A Revolta de Atlas', 'Ayn Rand', 1957, TRUE) 
,	   (2, 'Dom 	Quixote', 'Miguel de Cervantes', 1605, TRUE)
,	   (3, '1984', 'George Orwell', 1949, TRUE)
;

INSERT INTO usuarios (usuario_id, nome, email, telefone)
VALUES (1, 'Bigo', 'humbertobrunoro@terra.com.br', '99810-7777')
,	   (2, 'Ayehro', 'hunbertobrunoro@gmail.com', '99810-2000')
,	   (3, 'Humberto', 'humberto.hbro@gmail.com', '99810-3333')
;

INSERT INTO emprestimos (emprestimo_id, data_emprestimo, data_devolucao_prevista, livro_id, usuario_id)
VALUES (1, '2023-08-29', '2023-09-13', 1, 1)
,	   (2, '2023-09-01', '2023-09-16', 2, 2)
,	   (3, '2023-09-17', '2023-09-30', 2, 1)
;

UPDATE livros 
SET disponibilidade = FALSE 
WHERE livro_id = 1
; 

UPDATE livros AS l
SET l.disponibilidade = TRUE 
WHERE l.livro_id = 2
;

UPDATE emprestimos AS e
SET e.devolucao = TRUE
WHERE e.livro_id = 2
;

UPDATE livros 
SET disponibilidade = FALSE
WHERE livro_id = 2
;

-- 1. Liste todos os livros disponíveis na biblioteca, incluindo título e autor.

SELECT titulo, autor
FROM livros
WHERE dispobinilidade = TRUE
;

-- 2. Liste todos os usuários da biblioteca, incluindo nome e endereço de e-mail.

SELECT nome, email
FROM usuarios
;

-- 3. Liste os livros que nunca foram emprestados.

SELECT titulo, data_emprestimo
FROM 

-- 4. Encontre o livro mais emprestado da biblioteca (aquele com o maior número de empréstimos registrados).
-- 5. Encontre o usuário que mais empresta livros.
-- 6. Encontre os usuários que têm livros atrasados (a data de devolução prevista já passou).
-- 7. Calcule a quantidade total de livros emprestados no momento.
-- 8. Calcule o número médio de dias que um livro é emprestado.
-- 9. Liste todos os livros emprestados por um usuário específico, incluindo o título do livro e a data de empréstimo.
-- 10. Liste todos os usuários que têm livros emprestados no momento, incluindo o nome do usuário e o título do
-- livro.
-- 11. Liste os usuários que nunca emprestaram um livro.
-- 12. Liste o autor que teve o maior número de livros emprestados, juntamente com o número de empréstimos
-- para cada autor.

