SELECT
	  ar.artista AS `artista`,
    al.album_name AS `album`
FROM
    SpotifyClone.artists AS `ar`
INNER JOIN
    SpotifyClone.albums AS `al` ON ar.artista_id = al.artista_id
WHERE 
	  ar.artista = "Elis Regina"
ORDER BY 
    album;