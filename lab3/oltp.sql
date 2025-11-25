SELECT * FROM "User";

SELECT title, duration_seconds FROM Track;

SELECT * FROM Track WHERE duration_seconds > 240;

SELECT * FROM Artist WHERE country = 'USA';

UPDATE "User"
SET email = 'alice.new@gmail.com'
WHERE name = 'Alice';

UPDATE SubscriptionType
SET price = 10.99
WHERE name = 'Premium';

DELETE FROM PlaylistTrack
WHERE playlist_id = 1 AND track_id = 1;

DELETE FROM "User"
WHERE name = 'Diana';

INSERT INTO "User" (name, email, password_hash) VALUES
('Evan', 'evan@gmail.com', 'hash0214');

INSERT INTO Track (title, duration_seconds, release_date, album_id) 
VALUES ('Flowers', 200, '2023-01-12', NULL);