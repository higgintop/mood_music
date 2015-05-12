#!/usr/bin/env ruby

class RecommendationsController
  def index
    if Recommendation.count > 0
      recommendations = Recommendation.all # all of the recs in an array
      recommendations.each_with_index do |rec, index|
        say "#{index + 1}. #{rec.name}"
      end
    else
      say("No recommendations found.\n")
    end
  end
end
