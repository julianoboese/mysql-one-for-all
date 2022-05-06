SELECT
  COUNT(DISTINCT s.song_id) AS 'cancoes',
  COUNT(DISTINCT ar.artist_id) AS "artistas",
  COUNT(DISTINCT al.album_id) AS "albuns"
FROM SpotifyClone.songs s
INNER JOIN SpotifyClone.albums al ON s.album_id = al.album_id
INNER JOIN SpotifyClone.artists ar ON al.artist_id = ar.artist_id;
