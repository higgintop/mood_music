

class Database
  def self.execute(*args)
    initialize_database unless defined?(@@db)
    @@db.execute(*args)
  end

  def self.initialize_database
    # NOTE: currently looking at test DB, but will want to change to actual DB for
    # running the program
    @@db = SQLite3::Database.new("db/mood_music_test.sqlite")
  end

end
