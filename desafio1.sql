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

INSERT INTO subscriptions(subscription_name, subscription_price)
VALUES ('gratuito',0.00),
('universitário',5.99),
('pessoal',6.99),
('familiar',7.99);

INSERT INTO users(user_name, user_age, subscription_id, subscription_date)
VALUES ('Thati',23,1,'2019-10-20'),
('Cintia',35,4,'2017-12-30'),
('Bill',20,2,'2019-06-05'),
('Roger',45,3,'2020-05-13'),
('Norman',58,3,'2017-02-17'),
('Patrick',33,4,'2017-01-06'),
('Vivian',26,2,'2018-01-05'),
('Carol',19,2,'2018-02-14'),
('Angelina',42,4,'2018-04-29'),
('Paul',46,4,'2017-01-17');

INSERT INTO artists(artist_name)
VALUES ('Fog'),
('Freedie Shannon'),
('Lance Day'),
('Peter Strong'),
('Tyler Isle'),
('Walter Phoenix');

INSERT INTO followers(user_id, artist_id)
VALUES (1,2),
(1,3),
(1,6),
(2,3),
(2,6),
(3,4),
(3,6),
(4,2),
(5,1),
(5,5),
(6,1),
(6,3),
(6,6),
(7,4),
(7,5),
(8,5),
(8,6),
(9,1),
(9,2),
(9,3),
(10,1),
(10,4);

INSERT INTO albums(album_name, artist_id, release_year)
VALUES ('Envious',6,1990),
('Exuberant',6,1993),
('Hallowed Steam',4,1995),
('Incandescent',3,1998),
('Temporary Culture',2,2001),
('Library of liberty',2,2003),
('Chained Down',5,2007),
('Cabinet of fools',5,2012),
('No guarantees',5,2015),
('Apparatus',1,2015);

INSERT INTO songs(song_name, song_length, album_id)
VALUES ('Baby',136,10),
('Celebration Of More',146,4),
('Dance With Her Own',116,1),
('Diamond Power',241,6),
('Fantasy For Me',100,4),
('Finding My Traditions',179,7),
('Hard And Time',135,7),
('He Heard You''re Bad For Me',154,8),
('He Hopes We Can''t Stay',210,8),
('He''s Trouble',138,9),
('He''s Walking Away',159,9),
('History Of My Roses',222,6),
('Home Forever',231,4),
('Honey',79,10),
('Honey, I''m A Lone Wolf',150,7),
('Honey, So Do I',207,3),
('I Heard I Want To Bo Alone',120,9),
('I Know I Know',117,8),
('I Ride Alone',151,9),
('Let''s Be Silly',132,8),
('Magic Circus',105,3),
('Need Of The Evening',190,6),
('Reflections Of Magic',163,1),
('Rock His Everything',223,4),
('She Knows',244,3),
('She Thinks I Won''t Stay Tonight',166,8),
('Soul For Us',200,1),
('Sweetie, Let''s Go Wild',139,3),
('Thang Of Thunder',240,5),
('Time Fireworks',152,2),
('Troubles Of My Inner Fire',203,2),
('Walking And Game',123,6),
('Walking And Man',229,7),
('Without My Love',111,6),
('Without My Streets',176,5),
('Words Of Her Life',185,5),
('Wouldn''t It Be Nice',213,10),
('You Cheated On Me',95,10),
('You Make Me Feel So..',83,2),
('Young And Father',197,5);

INSERT INTO plays(user_id, song_id, play_date)
VALUES (6,8,'2017-01-24 00:31:17'),
(10,12,'2017-02-06 08:21:34'),
(5,24,'2017-02-24 21:14:22'),
(10,24,'2017-07-27 05:24:49'),
(6,9,'2017-10-12 12:35:20'),
(10,34,'2017-12-04 05:33:43'),
(10,13,'2017-12-25 01:03:57'),
(7,2,'2018-01-16 18:40:43'),
(8,1,'2018-03-21 16:56:40'),
(7,30,'2018-05-09 22:30:49'),
(6,32,'2018-05-29 14:56:41'),
(9,36,'2018-12-07 22:48:52'),
(6,37,'2019-02-07 20:33:48'),
(8,11,'2019-05-25 08:14:03'),
(2,17,'2020-01-02 07:40:33'),
(1,14,'020-02-28 10:45:55'),
(1,40,'2020-03-06 11:22:33'),
(9,25,'2020-04-01 03:36:00'),
(1,33,'2020-05-02 05:30:35'),
(2,6,'2020-05-16 06:16:22'),
(5,16,'2020-07-03 19:33:28'),
(7,31,'2020-07-27 12:52:58'),
(3,7,'2020-07-30 10:00:00'),
(1,4,'2020-08-05 08:05:17'),
(5,4,'2020-08-06 15:23:43'),
(1,20,'2020-09-14 16:32:22'),
(2,1,'2020-09-21 13:14:46'),
(2,34,'2020-10-09 12:27:48'),
(8,39,'2020-10-18 13:38:05'),
(5,27,'2020-11-10 13:52:27'),
(3,21,'2020-11-13 16:55:13'),
(3,3,'2020-12-05 18:38:30'),
(4,15,'2021-01-09 01:44:33'),
(9,28,'2021-03-14 06:14:26'),
(9,29,'2021-05-24 17:23:45'),
(4,19,'2021-07-10 15:20:30'),
(4,23,'2021-08-15 17:10:10'),
(8,10,'2021-08-15 21:37:09');
