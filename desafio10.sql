SELECT
	s.song_name AS 'nome',
	COUNT(*) AS 'reproducoes'
FROM
	SpotifyClone.songs s
	INNER JOIN SpotifyClone.plays p ON s.song_id = p.song_id
	INNER JOIN SpotifyClone.users u ON p.user_id = u.user_id
	INNER JOIN SpotifyClone.subscriptions sub ON u.subscription_id = sub.subscription_id
WHERE
	sub.subscription_name IN ('gratuito', 'pessoal')
GROUP BY
	s.song_id
ORDER BY
	s.song_name;