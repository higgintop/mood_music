#!/usr/bin/env ruby

# this is the model

class Recommendation

  attr_accessor :name

  def self.all
    # retrieve things in database and populate into an array
    db = Database.execute("SELECT name FROM recommendations order by name ASC")
    db.map do |row|
      recommendation = Recommendation.new
      recommendation.name = row[0]
      recommendation
    end
  end

  # class method count
  def self.count
    Database.execute("SELECT count(id) FROM recommendations")[0][0]
  end

end
