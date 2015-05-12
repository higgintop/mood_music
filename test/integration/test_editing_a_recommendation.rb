require_relative '../helper'

class TestEditingARecommendation < Minitest::Test

  def test_deleting_a_recommendation_happy_path_a
    shell_output = ""
    expected = ""
    IO.popen('./mood_music manage', 'r+') do |pipe|
      expected = <<EOS
1. Add song recommendation
2. List song recommendations
3. Exit
EOS
      pipe.puts "2"
      expected << <<EOS
What category would you like to see?
1. happy
2. sad
3. mellow
4. angry
EOS
      pipe.puts "1"
      expected << <<EOS
1. Elephant by Tame Impala
2. Tangerine by Led Zeppelin
EOS
      pipe.puts "1"
      expected << <<EOS
What would you like to do:
1. Edit recommendation
2. Delete recommendation
EOS
      pipe.puts "1"
      expected << "Update song title? [y/n]\n"
      pipe.puts "n"
      expected << "Update song's artist? [y/n]\n"
      pipe.puts "n"
      expected << "Update mood category? [y/n]\n"
      pipe.puts "y"
      expected << <<EOS
How would you classify the feel of this song?
1. happy
2. sad
3. mellow
4. angry
EOS
      pipe.puts "3"
      expected << "Your song recommendation has been saved."
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end



  def test_deleting_a_recommendation_happy_path_b
    shell_output = ""
    expected = ""
    IO.popen('./mood_music manage', 'r+') do |pipe|
      expected = <<EOS
1. Add song recommendation
2. List song recommendations
3. Exit
EOS
      pipe.puts "2"
      expected << <<EOS
What category would you like to see?
1. happy
2. sad
3. mellow
4. angry
EOS
      pipe.puts "1"
      expected << <<EOS
1. Elephant by Tame Impala
2. Tangerine by Led Zeppelin
EOS
      pipe.puts "1"
      expected << <<EOS
What would you like to do:
1. Edit recommendation
2. Delete recommendation
EOS
      pipe.puts "1"
      expected << "Update song title? [y/n]\n"
      pipe.puts "y"
      expected << "Enter updated song title:\n"
      pipe.puts "Cause I'm A Man"
      expected << "Update song's artist? [y/n]\n"
      pipe.puts "n"
      expected << "Update mood category? [y/n]\n"
      pipe.puts "n"
      expected << "Your song recommendation has been saved."
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end


  def test_deleting_a_recommendation_happy_path_c
    shell_output = ""
    expected = ""
    IO.popen('./mood_music manage', 'r+') do |pipe|
      expected = <<EOS
1. Add song recommendation
2. List song recommendations
3. Exit
EOS
      pipe.puts "2"
      expected << <<EOS
What category would you like to see?
1. happy
2. sad
3. mellow
4. angry
EOS
      pipe.puts "1"
      expected << <<EOS
1. Elephant by Tame Impala
2. Tangerine by Led Zeppelin
EOS
      pipe.puts "1"
      expected << <<EOS
What would you like to do:
1. Edit recommendation
2. Delete recommendation
EOS
      pipe.puts "1"
      expected << "Update song title? [y/n]\n"
      pipe.puts "n"
      expected << "Update song's artist? [y/n]\n"
      pipe.puts "y"
      expected << "Enter updated artist:\n"
      pipe.puts "Lady Gaga"
      expected << "Update mood category? [y/n]\n"
      pipe.puts "n"
      expected << "Your song recommendation has been saved."
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_deleting_a_recommendation_happy_path_d
    shell_output = ""
    expected = ""
    IO.popen('./mood_music manage', 'r+') do |pipe|
      expected = <<EOS
1. Add song recommendation
2. List song recommendations
3. Exit
EOS
      pipe.puts "2"
      expected << <<EOS
What category would you like to see?
1. happy
2. sad
3. mellow
4. angry
EOS
      pipe.puts "1"
      expected << <<EOS
1. Elephant by Tame Impala
2. Tangerine by Led Zeppelin
EOS
      pipe.puts "1"
      expected << <<EOS
What would you like to do:
1. Edit recommendation
2. Delete recommendation
EOS
      pipe.puts "1"
      expected << "Update song title? [y/n]\n"
      pipe.puts "y"
      expected << "Enter updated song title:\n"
      pipe.puts "Bad Romance"
      expected << "Update song's artist? [y/n]\n"
      pipe.puts "y"
      expected << "Enter updated artist:\n"
      pipe.puts "Lady Gaga"
      expected << "Update mood category? [y/n]\n"
      pipe.puts "n"
      expected << "Your song recommendation has been saved."
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

end