SELECT
    a.artista AS `artista`,
    CASE
        WHEN COUNT(f.cancao_id) >= 5 THEN 'A'
        WHEN COUNT(f.cancao_id) >= 3 THEN 'B'
        WHEN COUNT(f.cancao_id) >= 1 THEN 'C'
        ELSE '-'
    END AS `ranking`
FROM
    SpotifyClone.artists AS `a`
INNER JOIN
    SpotifyClone.albums AS `al` ON a.artista_id = al.artista_id
INNER JOIN
    SpotifyClone.songs AS `s` ON al.album_id = s.album_id
LEFT JOIN
    SpotifyClone.favorite_songs AS `f` ON f.cancao_id = s.cancao_id
GROUP BY
    `artista`
ORDER BY
    CASE
        WHEN `ranking` = '-' THEN 1
        ELSE 0
    END ASC,
    `ranking` ASC,
    `artista` ASC;
