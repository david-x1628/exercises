SELECT * FROM Track WHERE GenreId = 2;

SELECT TrackId, Name, GenreId FROM Track WHERE GenreId = 3;

SELECT * FROM Album WHERE ArtistId = (SELECT ArtistId FROM Artist WHERE Name = 'Nirvana');

SELECT * FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
INNER JOIN Artist ON Album.ArtistId = Artist.ArtistId
WHERE Track.Name = 'Intro';

SELECT count(m.MediaTypeId), m.Name FROM Track as t
LEFT JOIN Mediatype as m
ON t.MediaTypeId = m.MediaTypeId
GROUP BY m.Name;

SELECT COUNT(t.Name) as c, t.Name FROM track as t
GROUP BY t.Name
having c > 1
order by c desc;
