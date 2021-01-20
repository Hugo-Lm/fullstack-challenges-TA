require 'sqlite3'

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  query = <<-SQL
    SELECT COUNT(*) FROM artists
  SQL

  results = db.execute(query).flatten.first
  # p results
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  query = <<-SQL
    SELECT COUNT(*) FROM #{table_name}
  SQL

  results = db.execute(query).flatten.first
  # p results
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  results = db.execute("SELECT name FROM artists ORDER BY name").flatten
  # p results
end

def love_tracks(db)
  # TODO: return array of love songs' names
  query = <<-SQL
    SELECT name FROM tracks WHERE name LIKE "%love%"
  SQL
  results = db.execute(query).flatten
  # p results
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
  query = <<-SQL
    SELECT name
    FROM tracks
    WHERE milliseconds > #{min_length} * 60000
    ORDER BY milliseconds ASC
  SQL

  results = db.execute(query).flatten
  # p results
end

db = SQLite3::Database.new("lib/db/jukebox.sqlite")
# number_of_rows(db, "albums")

long_tracks(db, 3)
