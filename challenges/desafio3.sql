SELECT 
    u.nome_pessoa_usuaria AS `pessoa_usuaria`,
    COUNT(h.cancao_id) AS `musicas_ouvidas`,
    ROUND(SUM(s.duracao_segundos) / 60, 2) AS `total_minutos`
FROM
    SpotifyClone.users AS `u`
INNER JOIN SpotifyClone.history AS `h` ON u.pessoa_usuaria_id = h.pessoa_usuaria_id
INNER JOIN SpotifyClone.songs AS `s` ON h.cancao_id = s.cancao_id
GROUP BY
    u.nome_pessoa_usuaria
ORDER BY
    u.nome_pessoa_usuaria;
