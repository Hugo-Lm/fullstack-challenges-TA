require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  query = <<-SQL
    SELECT tracks.name, albums.title, artists.name
    FROM tracks
    INNER JOIN albums ON albums.id = tracks.album_id
    INNER JOIN artists ON artists.id = albums.artist_id
  SQL
  results = db.execute(query)
  # p results

end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  query = <<-SQL
    SELECT COUNT(*), SUM(tracks.milliseconds)
    FROM tracks
    INNER JOIN genres ON genres.id = tracks.genre_id
    WHERE genres.name = "#{genre_name}"
  SQL

  results = db.execute(query).flatten
  moyenne = ((results[1] / results[0]).to_f / 60000).round(2)

  return {
      avg_length: moyenne,
      category: genre_name,
      number_of_songs: results[0]
   }
  # p moyenne
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  query = <<-SQL
    SELECT artists.id, artists.name, COUNT(tracks.id) AS compteur
    FROM tracks
    JOIN albums ON albums.id = tracks.album_id
    JOIN artists ON artists.id = albums.artist_id
    JOIN genres ON genres.id = tracks.genre_id
    WHERE genres.name = '#{genre_name}'
    GROUP BY artists.id
    ORDER BY compteur DESC
    LIMIT 5
  SQL

  results = db.execute(query)
  # p results
end



db = SQLite3::Database.new("lib/db/jukebox.sqlite")

top_five_artists(db, "Rock")
