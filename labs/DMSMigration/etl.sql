CREATE TABLE migration SELECT A.artist_name, A.id, A.title, A.year, A.format, A.price, T.track_information FROM ( SELECT artist.name AS 'artist_name', album.id AS 'id', album.title AS 'title', album.year AS 'year', album.format AS 'format', album.price AS 'price' FROM artist JOIN album ON album.artist_id=artist.id) as A JOIN ( select album_id, CONCAT("[",GROUP_CONCAT(CONCAT( "{name: ", name, ", length: ",length,", number: ", number,"}")),"]") as "track_information" from track group by album_id) as T on A.id=T.album_id GROUP BY A.id;