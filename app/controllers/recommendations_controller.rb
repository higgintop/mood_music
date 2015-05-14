#!/usr/bin/env ruby


class RecommendationsController
  def index(category_index)
    if Recommendation.count > 0
      recommendations = Recommendation.by_mood(category_index)
      rec_str = ""
      recommendations.each_with_index do |rec, index|
        rec_str << "#{index + 1}. #{rec[0]} by #{rec[1]}\n"
      end
      rec_str
    else
      "No recommendations found.\n"
    end
  end


  def add_row(song_title, artist, mood_category)
    song_title_clean = song_title.strip
    artist_clean = artist.strip

    rec = Recommendation.new
    rec.song_title = song_title_clean
    rec.artist = artist_clean
    rec.mood_category = mood_category.to_i

    if rec.save
      return "valid"
    else
      rec.errors
    end
  end

  def add_song_title(title)
    title_clean = title.strip
    rec = Recommendation.new
    rec.song_title = title_clean
    return rec.song_title_valid?
  end

  def add_artist(artist)
    artist_clean = artist.strip
    rec = Recommendation.new
    rec.artist = artist_clean
    return rec.artist_valid?
  end

  def add_mood_category(mood_category)
    rec = Recommendation.new
    rec.mood_category = mood_category.to_i
    return rec.mood_category_valid?
  end
end


