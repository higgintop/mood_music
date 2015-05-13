#!/usr/bin/env ruby
require 'highline/import'

class RecommendationsController
  def index
    if Recommendation.count > 0
      recommendations = Recommendation.all # all of the recs in an array
      rec_str = ""
      recommendations.each_with_index do |rec, index|
        rec_str << "#{index + 1}. #{rec.name}\n"
      end
      rec_str
    else
      "No recommendations found.\n"
    end
  end
end

