require 'rubygems'
require 'bundler/setup'
require "minitest/reporters"
require "sqlite3"

Dir["./app/**/*.rb"].each {|f| require f}

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

require 'minitest/autorun'

def main_menu
  "1. Add song recommendation\n2. List song recommendations\n3. Exit\n"
end

# This is database for tes ting
def setup_database
  @db = SQLite3::Database.new("db/mood_music_test.sqlite")
  @db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS recommendations (
    id integer PRIMARY KEY AUTOINCREMENT,
    name varchar(150) NOT NULL
  );
SQL
end

def create_recommendation(name)
  @db.execute("INSERT INTO recommendations (name) VALUES (?)", name)
end
