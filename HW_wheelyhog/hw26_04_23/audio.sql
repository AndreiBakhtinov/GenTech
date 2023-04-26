// Разработать схему БД для проекта "платформа 
// онлайн-прослушивания музыкальных треков"

  table users {
    user_id int [pk, increment]
    created_at timestamp
    user_name varchar
    email varchar
    password varchar
    is_blocked false
  }

  table audio_tracks{
    trackId int [pk, increment]
    created_at timestamp
    artist_id int
    album_id int
    duration_s int
  }

  table artists {
    artist_id int [pk, increment]
    artist_name varchar
    created_at timestamp
  }

  table albums {
    album_id int [pk, increment]
    created_at timestamp
    album_title varchar
    artist_id int
    price int
  }

  table playlists {
    playlist_id int [pk, increment]
    created_at timestamp
    playlist_author_id int
    track_list array
  }

Ref: "users"."user_id" < "playlists"."playlist_id"

Ref: "playlists"."track_list" < "audio_tracks"."trackId"

Ref: "albums"."album_id" < "audio_tracks"."album_id"

Ref: "artists"."artist_id" < "audio_tracks"."artist_id"

Ref: "artists"."artist_id" < "albums"."artist_id"