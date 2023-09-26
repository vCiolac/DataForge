SELECT
    COUNT(DISTINCT SpotifyClone.songs.cancao_id) AS cancoes,
    COUNT(DISTINCT SpotifyClone.artists.artista_id) AS artistas,
    COUNT(DISTINCT SpotifyClone.albums.album_id) AS albuns
FROM SpotifyClone.songs, SpotifyClone.artists, SpotifyClone.albums;