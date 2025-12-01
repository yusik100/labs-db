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


SELECT T.title AS track_title, AL.title AS album_title
FROM Track T
LEFT JOIN Album AL ON T.album_id = AL.album_id;


SELECT U.name AS user_name, S.name AS subscription_plan
FROM "User" U
CROSS JOIN SubscriptionType S;


SELECT title, duration_seconds
FROM Track
WHERE duration_seconds > (SELECT AVG(duration_seconds) FROM Track);


SELECT name, 
    (SELECT COUNT(*) FROM Playlist WHERE Playlist.user_id = "User".user_id) AS playlist_count
FROM "User";


SELECT stage_name 
FROM Artist 
WHERE artist_id IN (
    SELECT artist_id 
    FROM AlbumArtist 
    WHERE album_id IN (
         SELECT album_id FROM Album WHERE release_year < 2016
    )
);


SELECT ST.name AS plan_name, 
       COUNT(S.subscription_id) AS total_subscribers,
       SUM(ST.price) AS total_revenue
FROM SubscriptionType ST
JOIN Subscription S ON ST.type_id = S.type_id
GROUP BY ST.name;


SELECT U.name AS user_name, 
       SUM(T.duration_seconds) AS total_music_seconds
FROM "User" U
JOIN Playlist P ON U.user_id = P.user_id
JOIN PlaylistTrack PT ON P.playlist_id = PT.playlist_id
JOIN Track T ON PT.track_id = T.track_id
GROUP BY U.name
ORDER BY total_music_seconds DESC;
