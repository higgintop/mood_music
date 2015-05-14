require 'sqlite3'

# TO DO: make mood table
# id, corresponding mood category

class Database

  def self.load_structure
    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS recommendations (
      id integer PRIMARY KEY AUTOINCREMENT,
      song_title varchar(255) NOT NULL,
      artist varchar(255) NOT NULL,
      mood_category integer NOT NULL
    );
    SQL
    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS moods (
      id integer PRIMARY KEY AUTOINCREMENT,
      category varchar (150) NOT NULL
    );
    SQL
  end

  def self.execute(*args)
    initialize_database unless defined?(@@db)
    @@db.execute(*args)
  end

  def self.initialize_database
    environment = ENV["TEST"] ? "test" : "production"
    database = "db/mood_music_#{environment}.sqlite"
    @@db = SQLite3::Database.new(database)
    @@db.results_as_hash = true
  end

end
