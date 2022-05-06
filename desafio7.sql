SELECT
	ar.artist_name AS 'artista',
	al.album_name AS 'album',
	COUNT(*) AS 'seguidores'
FROM
	SpotifyClone.artists ar
	INNER JOIN SpotifyClone.albums al ON ar.artist_id = al.artist_id
	INNER JOIN SpotifyClone.followers f ON ar.artist_id = f.artist_id
GROUP BY
	al.album_id
ORDER BY
	seguidores DESC,
	ar.artist_name,
	al.album_name;