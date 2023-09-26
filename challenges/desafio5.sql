SELECT 
    s.cancao AS `cancao`,
   COUNT(h.pessoa_usuaria_id) AS `reproducoes`
FROM
    SpotifyClone.songs AS `s`
INNER JOIN
    SpotifyClone.history AS `h` ON s.cancao_id = h.cancao_id
GROUP BY s.cancao
ORDER BY reproducoes DESC, s.cancao ASC
LIMIT 2;
