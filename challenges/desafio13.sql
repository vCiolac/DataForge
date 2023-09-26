SELECT 
    `faixa_etaria`,
    COUNT(u.pessoa_usuaria_id) AS `total_pessoas_usuarias`,
    CAST(COALESCE(SUM(total_favoritadas), 0) AS UNSIGNED) AS `total_favoritadas`
FROM
    (SELECT
        pessoa_usuaria_id,
        CASE
            WHEN idade <= 30 THEN 'Até 30 anos'
            WHEN idade >= 31 AND idade <= 60 THEN 'Entre 31 e 60 anos'
            WHEN idade >= 61 THEN 'Maior de 60 anos'
        END AS `faixa_etaria`
    FROM
        SpotifyClone.users) AS `rank`
INNER JOIN
    SpotifyClone.users AS `u` ON `rank`.`pessoa_usuaria_id` = u.pessoa_usuaria_id
LEFT JOIN
    (SELECT
        pessoa_usuaria_id,
        COUNT(cancao_id) AS `total_favoritadas`
    FROM
        SpotifyClone.favorite_songs
    GROUP BY
        pessoa_usuaria_id) AS `f` ON u.pessoa_usuaria_id = f.pessoa_usuaria_id
GROUP BY
    `faixa_etaria`
ORDER BY
    `faixa_etaria`;