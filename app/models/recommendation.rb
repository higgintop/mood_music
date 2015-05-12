

# this is the model

class Recommendation
  # class method count
  def self.count
    Database.execute("SELECT count(*) FROM recommendations")[0][0]
  end

end
