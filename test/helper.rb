require 'rubygems'
require 'bundler/setup'
require "minitest/reporters"
require "sqlite3"

Dir["./app/**/*.rb"].each {|f| require f}
Dir["./lib/**/*.rb"].each {|f| require f}

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

require 'minitest/autorun'

def main_menu
  "1. Add song recommendation\n2. List song recommendations\n3. Exit\n"
end

# This is database for testing
# Prepares database for a test to be run
def setup_database
  Database.execute <<-SQL
  CREATE TABLE IF NOT EXISTS recommendations (
    id integer PRIMARY KEY AUTOINCREMENT,
    name varchar(150) NOT NULL
  );
SQL
  Database.execute("DELETE FROM recommendations;")
end

def create_recommendation(name)
  Database.execute("INSERT INTO recommendations (name) VALUES (?)", name)
end



