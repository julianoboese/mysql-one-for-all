SELECT
	s.song_name AS 'cancao',
	COUNT(*) AS 'reproducoes'
FROM
	SpotifyClone.songs s
	INNER JOIN SpotifyClone.plays p ON s.song_id = p.song_id
GROUP BY
	s.song_id
ORDER BY
	reproducoes DESC,
	s.song_name
LIMIT
	2;