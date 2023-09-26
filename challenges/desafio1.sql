DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
CREATE TABLE SpotifyClone.artists
(
    artista_id	INT PRIMARY KEY AUTO_INCREMENT,
    artista	VARCHAR(512) NOT NULL
);
INSERT INTO SpotifyClone.artists (artista_id, artista)
VALUES 
    ('1', 'Beyoncé'),
    ('2', 'Queen'),
    ('3', 'Elis Regina'),
    ('4', 'Baco Exu do Blues'),
    ('5', 'Blind Guardian'),
    ('6', 'Nina Simone');

CREATE TABLE SpotifyClone.albums
(
    album_id	INT PRIMARY KEY AUTO_INCREMENT,
    album_name	VARCHAR(512) NOT NULL,
    artista_id	INT NOT NULL,
    ano_lancamento	INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artists(artista_id)
);
INSERT INTO SpotifyClone.albums (album_id, album_name, artista_id, ano_lancamento)
VALUES 
    ('1', 'Renaissance', '1', '2022'),
    ('2', 'Jazz', '2', '1978'),
    ('3', 'Hot Space', '2', '1982'),
    ('4', 'Falso Brilhante', '3', '1998'),
    ('5', 'Vento de Maio', '3', '2001'),
    ('6', 'QVVJFA?', '4', '2003'),
    ('7', 'Somewhere Far Beyond', '5', '2007'),
    ('8', 'I Put A Spell On You', '6', '2012');

CREATE TABLE SpotifyClone.plans
(
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(512) NOT NULL,
    valor_plano DECIMAL(10, 2) NOT NULL
);
INSERT INTO SpotifyClone.plans (plano_id, nome_plano, valor_plano)
VALUES 
    (1, 'gratuito', 0.00),
    (2, 'familiar', 7.99),
    (3, 'universitário', 5.99),
    (4, 'pessoal', 6.99);

CREATE TABLE SpotifyClone.users 
(
    pessoa_usuaria_id	INT PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa_usuaria	VARCHAR(512) NOT NULL,
    idade	INT NOT NULL,
    plano_id	INT,
    data_assinatura	VARCHAR(512) NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plans(plano_id)
);
INSERT INTO SpotifyClone.users (pessoa_usuaria_id, nome_pessoa_usuaria, idade, plano_id, data_assinatura)
VALUES 
    ('1', 'Barbara Liskov', '82', '1', '2019-10-20'),
    ('2', 'Robert Cecil Martin', '58', '1', '2017-01-06'),
    ('3', 'Ada Lovelace', '37', '2', '2017-12-30'),
    ('4', 'Martin Fowler', '46', '2', '2017-01-17'),
    ('5', 'Sandi Metz', '58', '2', '2018-04-29'),
    ('6', 'Paulo Freire', '19', '3', '2018-02-14'),
    ('7', 'Bell Hooks', '26', '3', '2018-01-05'),
    ('8', 'Christopher Alexander', '85', '4', '2019-06-05'),
    ('9', 'Judith Butler', '45', '4', '2020-05-13'),
    ('10', 'Jorge Amado', '58', '4', '2017-02-17');

CREATE TABLE SpotifyClone.songs (
    cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    cancao VARCHAR(512) NOT NULL,
    duracao_segundos INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(album_id)
);
INSERT INTO SpotifyClone.songs (cancao_id, cancao, duracao_segundos, album_id) 
VALUES 
    (1, 'BREAK MY SOUL', 279, 1),
    (2, 'VIRGO''S GROOVE', 369, 1),
    (3, 'ALIEN SUPERSTAR', 116, 1),
    (4, 'Don''t Stop Me Now', 203, 2),
    (5, 'Under Pressure', 152, 3),
    (6, 'Como Nossos Pais', 105, 4),
    (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
    (8, 'Samba em Paris', 267, 6),
    (9, 'The Bard''s Song', 244, 7),
    (10, 'Feeling Good', 100, 8);

CREATE TABLE SpotifyClone.history (
    cancao_id INT,
    pessoa_usuaria_id INT,
    data_reproducao DATETIME,
    PRIMARY KEY (cancao_id, pessoa_usuaria_id),
    FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.songs(cancao_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.users(pessoa_usuaria_id)
);
INSERT INTO SpotifyClone.history (cancao_id, pessoa_usuaria_id, data_reproducao)
VALUES 
  ( 8, 1, '2022-02-28 10:45:55'),
  ( 2, 1, '2020-05-02 05:30:35'),
  ( 10, 1, '2020-03-06 11:22:33'),
  ( 10, 2, '2022-08-05 08:05:17'),
  ( 7, 2, '2020-01-02 07:40:33'),
  ( 10, 3, '2020-11-13 16:55:13'),
  ( 2, 3, '2020-12-05 18:38:30'),
  ( 8, 4, '2021-08-15 17:10:10'),
  ( 8, 5, '2022-01-09 01:44:33'),
  ( 5, 5, '2020-08-06 15:23:43'),
  ( 7, 6, '2017-01-24 00:31:17'),
  ( 1, 6, '2017-10-12 12:35:20'),
  ( 4, 7, '2011-12-15 22:30:49'),
  ( 4, 8, '2012-03-17 14:56:41'),
  ( 9, 9, '2022-02-24 21:14:22'),
  ( 3, 10, '2015-12-13 08:30:22');

CREATE TABLE SpotifyClone.following (
    pessoa_usuaria_id INT,
    artista_id INT,
    PRIMARY KEY (pessoa_usuaria_id, artista_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.users(pessoa_usuaria_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artists(artista_id)
);
INSERT INTO SpotifyClone.following (pessoa_usuaria_id, artista_id)
VALUES 
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 1),
    (6, 6),
    (7, 6),
    (9, 3),
    (10, 2);