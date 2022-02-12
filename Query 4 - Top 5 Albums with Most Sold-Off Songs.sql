WITH album_tracks
AS (SELECT
  a.title AS Album,
  COUNT(t.name) "Total Tracks"
FROM Track t
JOIN Album a
  ON a.AlbumId = t.AlbumId
GROUP BY 1
ORDER BY 2 DESC)

SELECT
  a.Title AS "Album Title",
  COUNT(DISTINCT t.Name) AS "Tracks Sold",
  (at."Total Tracks" - COUNT(DISTINCT t.Name)) AS "Tracks Unsold"
FROM Invoice i
JOIN InvoiceLine il
  ON i.InvoiceId = il.InvoiceId
JOIN Track t
  ON t.TrackId = il.TrackId
JOIN Album a
  ON a.AlbumId = t.AlbumId
JOIN album_tracks at
  ON at.Album = a.Title
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5