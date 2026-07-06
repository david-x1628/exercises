SELECT * FROM Track WHERE GenreId = 2;

SELECT TrackId, Name, GenreId FROM Track WHERE GenreId = 3;

SELECT * FROM Album WHERE ArtistId = (SELECT ArtistId FROM Artist WHERE Name = 'Nirvana');

SELECT * FROM Track
INNER JOIN Album ON Track.AlbumId = Album.AlbumId
INNER JOIN Artist ON Album.ArtistId = Artist.ArtistId
WHERE Track.Name = 'Intro';




