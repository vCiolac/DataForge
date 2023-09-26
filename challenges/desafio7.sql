SELECT
    ar.artista AS `artista`,
    al.album_name AS `album`,
    COUNT(f.pessoa_usuaria_id) AS `pessoas_seguidoras`
FROM
    SpotifyClone.artists AS `ar`
INNER JOIN
    SpotifyClone.albums AS `al` ON ar.artista_id = al.artista_id
INNER JOIN
    SpotifyClone.following AS `f` ON ar.artista_id = f.artista_id
GROUP BY
    ar.artista, al.album_name
ORDER BY
    COUNT(f.pessoa_usuaria_id) DESC,
    ar.artista,
    al.album_name;