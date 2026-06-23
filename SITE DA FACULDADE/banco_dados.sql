-- =====================================================
-- BANCO DE DADOS: DESCARTE CONSCIENTE DE RESÍDUOS ELETRÔNICOS
-- =====================================================

CREATE DATABASE descarte_eletronico;

USE descarte_eletronico;

-- =====================================================
-- TABELA DE PONTOS DE COLETA
-- =====================================================

CREATE TABLE Ponto_Coleta (
    id_ponto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    telefone VARCHAR(20),
    horario_funcionamento VARCHAR(100)
);

-- =====================================================
-- TABELA DE TIPOS DE RESÍDUOS
-- =====================================================

CREATE TABLE Tipo_Residuo (
    id_residuo INT AUTO_INCREMENT PRIMARY KEY,
    nome_residuo VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- =====================================================
-- TABELA DE CONTEÚDOS EDUCATIVOS
-- =====================================================

CREATE TABLE Conteudo_Educativo (
    id_conteudo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    data_publicacao DATE
);

-- =====================================================
-- RELACIONAMENTO ENTRE PONTOS E RESÍDUOS
-- =====================================================

CREATE TABLE Ponto_Residuo (
    id_ponto INT,
    id_residuo INT,
    PRIMARY KEY (id_ponto, id_residuo),

    FOREIGN KEY (id_ponto)
    REFERENCES Ponto_Coleta(id_ponto),

    FOREIGN KEY (id_residuo)
    REFERENCES Tipo_Residuo(id_residuo)
);

-- =====================================================
-- INSERÇÃO DE DADOS
-- =====================================================

INSERT INTO Ponto_Coleta
(nome, endereco, telefone, horario_funcionamento)
VALUES
('Ecoponto Central',
'Rua Exemplo, 100 - Tupi Paulista/SP',
'(18) 99999-9999',
'08h às 17h'),

('Prefeitura Municipal',
'Rua Paulista, 500 - Tupi Paulista/SP',
'(18) 3821-0000',
'08h às 16h');

INSERT INTO Tipo_Residuo
(nome_residuo, descricao)
VALUES
('Pilhas e Baterias',
'Pilhas alcalinas, recarregáveis e baterias diversas'),

('Celulares',
'Aparelhos celulares e acessórios'),

('Computadores',
'Computadores, notebooks e periféricos'),

('Televisores',
'TVs e monitores');

INSERT INTO Conteudo_Educativo
(titulo, descricao, data_publicacao)
VALUES
(
'Importância do Descarte Correto',
'Equipamentos eletrônicos contêm substâncias que podem contaminar o meio ambiente.',
'2026-06-22'
),

(
'Reciclagem Eletrônica',
'A reciclagem reduz impactos ambientais e promove a reutilização de materiais.',
'2026-06-22'
);

INSERT INTO Ponto_Residuo
(id_ponto, id_residuo)
VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(2,1),
(2,2);

-- =====================================================
-- CONSULTAS
-- =====================================================

-- Listar todos os pontos de coleta

SELECT * FROM Ponto_Coleta;

-- Listar todos os resíduos

SELECT * FROM Tipo_Residuo;

-- Mostrar quais resíduos cada ponto recebe

SELECT
    p.nome AS Ponto_de_Coleta,
    r.nome_residuo AS Residuo
FROM Ponto_Coleta p
INNER JOIN Ponto_Residuo pr
ON p.id_ponto = pr.id_ponto
INNER JOIN Tipo_Residuo r
ON pr.id_residuo = r.id_residuo;

-- =====================================================
-- ATUALIZAÇÃO DE DADOS
-- =====================================================

UPDATE Ponto_Coleta
SET telefone = '(18) 98888-8888'
WHERE id_ponto = 1;

-- =====================================================
-- EXCLUSÃO DE DADOS
-- =====================================================

DELETE FROM Conteudo_Educativo
WHERE id_conteudo = 2;

-- =====================================================
-- FIM DO PROJETO
-- =====================================================