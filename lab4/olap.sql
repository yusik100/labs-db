SELECT 
    COUNT(*) AS total_tracks,
    AVG(duration_seconds) AS avg_duration_sec,
    MIN(duration_seconds) AS min_duration_sec,
    MAX(duration_seconds) AS max_duration_sec
FROM Track;


SELECT country, COUNT(*) AS artist_count
FROM Artist
GROUP BY country
ORDER BY artist_count DESC;


SELECT type_id, COUNT(*) AS subscribers_count
FROM Subscription
GROUP BY type_id
ORDER BY subscribers_count ASC;


SELECT album_id, COUNT(*) AS track_count
FROM Track
WHERE album_id IS NOT NULL
GROUP BY album_id
HAVING COUNT(*) < 4;


SELECT T.title AS track_title, A.stage_name AS artist_name
FROM Track T
INNER JOIN TrackArtist TA ON T.track_id = TA.track_id
INNER JOIN Artist A ON TA.artist_id = A.artist_id
ORDER BY T.title;


