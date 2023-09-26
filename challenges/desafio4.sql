SELECT 
    nome_pessoa_usuaria AS `pessoa_usuaria`,
    IF(MAX(h.data_reproducao) >= '2021-01-01',
        'Ativa',
        'Inativa') AS `status_pessoa_usuaria`
FROM
    SpotifyClone.users AS `u`
        INNER JOIN
    SpotifyClone.history AS `h` ON u.pessoa_usuaria_id = h.pessoa_usuaria_id
GROUP BY u.nome_pessoa_usuaria
ORDER BY u.nome_pessoa_usuaria
