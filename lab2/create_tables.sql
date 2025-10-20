CREATE TABLE IF NOT EXISTS Artist (
    artist_id SERIAL PRIMARY KEY,
    stage_name VARCHAR(64) NOT NULL UNIQUE,
    country VARCHAR(32),
    genre VARCHAR(32)
);

CREATE TABLE IF NOT EXISTS Album (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(64) NOT NULL,
    release_year INT NOT NULL CHECK (release_year >= 1900),
    artist_id INT NOT NULL REFERENCES Artist(artist_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Track (
    track_id SERIAL PRIMARY KEY,
    title VARCHAR(64) NOT NULL,
    duration INT NOT NULL,
    release_date DATE NOT NULL,
    album_id INT NOT NULL REFERENCES Album(album_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS "User" (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    email VARCHAR(32) NOT NULL UNIQUE,
	password_hash VARCHAR(255) NOT NULL,
    registration_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Playlist (
    playlist_id SERIAL PRIMARY KEY,
    title VARCHAR(64) NOT NULL,
    created_at DATE NOT NULL,
    user_id INT NOT NULL REFERENCES "User"(user_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS PlaylistTrack (
    playlist_id INT NOT NULL REFERENCES Playlist(playlist_id) ON DELETE CASCADE,
    track_id INT NOT NULL REFERENCES Track(track_id) ON DELETE CASCADE,
    PRIMARY KEY (playlist_id, track_id)
); 

CREATE TABLE IF NOT EXISTS SubscriptionType (
    type_id SERIAL PRIMARY KEY,
    name VARCHAR(32) UNIQUE NOT NULL,
    price DECIMAL(6,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Subscription (
	subscription_id SERIAL PRIMARY KEY,
    type_id INT NOT NULL REFERENCES SubscriptionType(type_id),
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