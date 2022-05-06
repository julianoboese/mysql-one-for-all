DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE subscriptions(
  subscription_id INT AUTO_INCREMENT PRIMARY KEY,
  subscription_name VARCHAR(50) NOT NULL,
  subscription_price DOUBLE NOT NULL
);

CREATE TABLE users(
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(50) NOT NULL,
  user_age SMALLINT NOT NULL,
  subscription_id INT NOT NULL,
  subscription_date DATE NOT NULL,
  CONSTRAINT FK_users_subscriptions FOREIGN KEY (subscription_id) REFERENCES subscriptions(subscription_id)
);

CREATE TABLE artists(
  artist_id INT AUTO_INCREMENT PRIMARY KEY,
  artist_name VARCHAR(50) NOT NULL
);

CREATE TABLE followers(
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  CONSTRAINT PK_followers PRIMARY KEY (user_id, artist_id),
  CONSTRAINT FK_followers_users FOREIGN KEY (user_id) REFERENCES users(user_id),
  CONSTRAINT FK_followers_artists FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE albums(
  album_id INT AUTO_INCREMENT PRIMARY KEY,
  album_name VARCHAR(50) NOT NULL,
  artist_id INT NOT NULL,
  release_year SMALLINT NOT NULL,
  CONSTRAINT FK_albums_artists FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE songs(
  song_id INT AUTO_INCREMENT PRIMARY KEY,
  song_name VARCHAR(50) NOT NULL,
  song_length SMALLINT NOT NULL,
  album_id INT NOT NULL,
  CONSTRAINT FK_songs_albums FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

CREATE TABLE plays(
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  play_date DATETIME NOT NULL,
  CONSTRAINT PK_plays PRIMARY KEY (user_id, song_id, play_date),
  CONSTRAINT FK_plays_users FOREIGN KEY (user_id) REFERENCES users(user_id),
  CONSTRAINT FK_plays_songs FOREIGN KEY (song_id) REFERENCES songs(song_id)
);
