CREATE TABLE IF NOT EXISTS Artist (
    artist_id SERIAL PRIMARY KEY,
    stage_name VARCHAR(50) NOT NULL UNIQUE,
    country VARCHAR(50),
    genre VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Album (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT NOT NULL CHECK (release_year >= 1900)
);

CREATE TABLE IF NOT EXISTS Track (
    track_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    duration_seconds INT NOT NULL CHECK (duration_seconds > 0),
    release_date DATE NOT NULL,
    album_id INT REFERENCES Album(album_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "User" (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
	password_hash VARCHAR(255) NOT NULL,
    registration_date DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE IF NOT EXISTS Playlist (
    playlist_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    created_at DATE NOT NULL DEFAULT CURRENT_DATE,
    user_id INT NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PlaylistTrack (
    playlist_id INT NOT NULL REFERENCES Playlist(playlist_id) ON DELETE CASCADE,
    track_id INT NOT NULL REFERENCES Track(track_id) ON DELETE CASCADE,
    PRIMARY KEY (playlist_id, track_id)
); 

CREATE TABLE IF NOT EXISTS SubscriptionType (
    type_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    price DECIMAL(6,2) NOT NULL CHECK (price >= 0)
);

CREATE TABLE IF NOT EXISTS Subscription (
	subscription_id SERIAL PRIMARY KEY,
    type_id INT NOT NULL REFERENCES SubscriptionType(type_id) ON DELETE RESTRICT,
    start_date DATE NOT NULL,
    end_date DATE CHECK (end_date IS NULL OR end_date >= start_date),
    user_id INT NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS TrackArtist (
    track_id INT NOT NULL REFERENCES Track(track_id) ON DELETE CASCADE,
    artist_id INT NOT NULL REFERENCES Artist(artist_id) ON DELETE CASCADE,
    PRIMARY KEY (track_id, artist_id)
);

CREATE TABLE IF NOT EXISTS AlbumArtist (
    album_id INT NOT NULL REFERENCES Album(album_id) ON DELETE CASCADE,
    artist_id INT NOT NULL REFERENCES Artist(artist_id) ON DELETE CASCADE,
    PRIMARY KEY (album_id, artist_id)
);