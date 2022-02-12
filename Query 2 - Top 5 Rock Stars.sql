SELECT
  ar.name AS Artist,
  COUNT(*) AS Songs
FROM Track t
JOIN Genre g
  ON g.GenreId = t.GenreId
JOIN Album a
  ON a.AlbumId = t.AlbumId
JOIN Artist ar
  ON ar.ArtistId = a.ArtistId
  AND g.name = 'Rock'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5