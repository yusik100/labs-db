INSERT INTO Artist (stage_name, country, genre) VALUES
('Imagine Dragons', 'USA', 'Rock'),
('Adele', 'UK', 'Pop'),
('The Weeknd', 'Canada', 'R&B'),
('Daft Punk', 'France', 'Electronic');

INSERT INTO Album (title, release_year) VALUES
('Evolve', 2017),
('25', 2015),
('After Hours', 2020),
('Discovery', 2001);

INSERT INTO AlbumArtist (album_id, artist_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4);

INSERT INTO Track (title, duration_seconds, release_date, album_id) VALUES
('Believer', 204, '2017-02-01', 1),
('Thunder', 187, '2017-04-27', 1),
('Hello', 295, '2015-10-23', 2),
('Blinding Lights', 200, '2019-11-29', 3),
('One More Time', 320, '2000-11-13', 4),
('Harder, Better, Faster, Stronger', 224, '2001-10-13', 4);

INSERT INTO TrackArtist (track_id, artist_id) VALUES
(1, 1), (2, 1), (3, 2), (4, 3), (5, 4), (6, 4);

INSERT INTO "User" (name, email, password_hash, registration_date) VALUES
('Alice', 'alice@example.com', 'hash123', '2023-01-10'),
('Bob', 'bob@example.com', 'hash456', '2023-03-15'),
('Charlie', 'charlie@example.com', 'hash789', '2023-05-20'),
('Diana', 'diana@test.com', 'hash000', '2024-01-05');

INSERT INTO SubscriptionType (name, price) VALUES
('No Ads', 4.99),
('Premium', 9.99),

INSERT INTO Subscription (type_id, start_date, end_date, user_id) VALUES
(1, '2024-01-01', NULL, 1), 
(2, '2024-03-01', '2025-03-01', 2), 
(1, '2024-02-01', NULL, 4);

INSERT INTO Playlist (title, created_at, user_id) VALUES
('Workout Mix', '2024-02-10', 1),
('Chill Vibes', '2024-04-15', 2),
('Old School', '2024-05-01', 3);

INSERT INTO PlaylistTrack (playlist_id, track_id) VALUES
(1, 1), (1, 2), (1, 6),
(2, 3), (2, 4);