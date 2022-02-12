WITH top_genres AS
  (SELECT g.Name AS Genre,
          SUM(il.UnitPrice * il.Quantity) AS "Total Sales"
   FROM Invoice i
   JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
   JOIN Track t ON t.TrackId = il.TrackId
   JOIN Album a ON a.AlbumId = t.AlbumId
   JOIN Artist ar ON ar.ArtistId = a.ArtistId
   JOIN Genre g ON g.GenreId = t.GenreId
   GROUP BY 1
   ORDER BY 2 DESC
   LIMIT 5)
   
SELECT g.Name AS Genre,
       strftime('%Y', i.InvoiceDate) AS YEAR,
       sum(il.UnitPrice * il.Quantity) AS "Annual Sales"
FROM Invoice i
JOIN InvoiceLine il ON il.InvoiceId = i.InvoiceId
JOIN Track t ON t.TrackId = il.TrackId
JOIN Album a ON a.AlbumId = t.AlbumId
JOIN Artist ar ON ar.ArtistId = a.ArtistId
JOIN Genre g ON g.GenreId = t.GenreId
AND g.name in
  (SELECT Genre
   FROM top_genres)
GROUP BY 1, 2
ORDER BY 1, 2