CREATE TABLE "users" (
  "user_id" integer PRIMARY KEY,
  "name" String,
  "surname" string,
  "email" String,
  "password_hash" String,
  "date_of_birth" Date,
  "registration_date" Date
);

CREATE TABLE "musics" (
  "music_id" integer PRIMARY KEY,
  "name" String,
  "artist_id" integer,
  "album_id" integer,
  "style" String,
  "duration" Number,
  "add_date" Date
);

CREATE TABLE "playlists" (
  "playlist_id" integer PRIMARY KEY,
  "description" String,
  "creation_data" Date,
  "user_id" ObjectId,
  "music_id" integer
);

CREATE TABLE "albums" (
  "album_id" integer PRIMARY KEY,
  "album_name" String,
  "Order" Number,
  "artist_id" integer
);

CREATE TABLE "artists" (
  "artist_id" integer PRIMARY KEY,
  "name" String,
  "description" String
);

ALTER TABLE "musics" ADD FOREIGN KEY ("artist_id") REFERENCES "artists" ("artist_id");

ALTER TABLE "albums" ADD FOREIGN KEY ("album_id") REFERENCES "musics" ("album_id");

ALTER TABLE "musics" ADD FOREIGN KEY ("music_id") REFERENCES "playlists" ("music_id");

ALTER TABLE "playlists" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "artists" ADD FOREIGN KEY ("artist_id") REFERENCES "albums" ("artist_id");
