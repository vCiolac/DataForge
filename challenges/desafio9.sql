SELECT
	COUNT(h.cancao_id) AS `musicas_no_historico`
FROM
    SpotifyClone.users AS `u`
INNER JOIN
    SpotifyClone.history AS `h` ON u.pessoa_usuaria_id = h.pessoa_usuaria_id
WHERE 
	u.nome_pessoa_usuaria = 'Barbara Liskov'
GROUP BY
    u.nome_pessoa_usuaria;