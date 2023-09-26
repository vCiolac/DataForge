DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
CREATE TABLE SpotifyClone.albums
(
    album_id	INT PRIMARY KEY,
    album_name	VARCHAR(512) NOT NULL,
    artista_id	INT,
    ano_lancamento	INT,
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id)
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
