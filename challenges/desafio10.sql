CREATE TABLE SpotifyClone.favorite_songs (
    favorite_id INT PRIMARY KEY AUTO_INCREMENT,
    pessoa_usuaria_id INT,
    cancao_id INT,
    UNIQUE (pessoa_usuaria_id, cancao_id),
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES SpotifyClone.users(pessoa_usuaria_id),
    FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.songs(cancao_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.favorite_songs (pessoa_usuaria_id, cancao_id)
VALUES 
    ('1', '3'),
    ('1', '6'),
    ('1', '10'),
    ('2', '4'),
    ('3', '1'),
    ('3', '3'),
    ('4', '7'),
    ('4', '4'),
    ('5', '10'),
    ('5', '2'),
    ('8', '4'),
    ('9', '7'),
    ('10', '3');
