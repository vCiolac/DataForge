SELECT
	  a.album_name AS `album`,
    COUNT(f.cancao_id) AS `favoritadas`
FROM
	  SpotifyClone.albums AS `a`
INNER JOIN
	  SpotifyClone.songs AS `s` ON s.album_id = a.album_id
INNER JOIN
    SpotifyClone.favorite_songs AS `f` ON f.cancao_id = s.cancao_id
GROUP BY
    a.album_name
ORDER BY
    `favoritadas`DESC,
	  `album`
LIMIT 3;