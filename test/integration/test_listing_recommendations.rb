require_relative '../helper'


class TestListingRecommendations < Minitest::Test
  def test_listing_of_no_recommendations
    shell_output = ""
    expected = ""
    IO.popen('./mood_music manage', 'r+') do |pipe|
      expected = <<EOS
1. Add song recommendation
2. List song recommendations
3. Exit
EOS
    pipe.puts "2"
    expected << "No recommendations found.\n"
    pipe.close_write
    shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

    def test_listing_of_recommendations_happy_path
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
    pipe.close_write
    shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end


  def test_listing_of_recommendations_invalid_choice
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
    pipe.puts "6"
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
    pipe.close_write
    shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

end
