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

  def get_selection(category_index, user_selection)
    if Recommendation.count > 0
      recommendations = Recommendation.by_mood(category_index)
      recommendations[user_selection-1]
    else
      nil
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

  def update_row(new_song_title, new_artist, new_mood_category, id)
    song_title_clean = new_song_title.strip
    artist_clean = new_artist.strip

    rec = Recommendation.new
    rec.song_title = song_title_clean
    rec.artist = artist_clean
    rec.mood_category = new_mood_category.to_i

    if rec.update(id)
      return "valid"
    else
      rec.errors
    end

  end

  def delete_row(id)
    Recommendation.delete(id)
  end

  def is_song_title_valid?(title)
    rec = Recommendation.new
    rec.song_title = title
    return rec.song_title_valid?
  end

  def is_artist_valid?(artist)
    rec = Recommendation.new
    rec.artist = artist
    return rec.artist_valid?
  end

  def is_mood_category_valid?(mood_category)
    rec = Recommendation.new
    rec.mood_category = mood_category.to_i
    return rec.mood_category_valid?
  end
end


