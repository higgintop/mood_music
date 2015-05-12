require_relative '../helper'

class TestGettingARecommendation < Minitest::Test

    def test_getting_a_recommendation_happy_path
    shell_output = ""
    expected = ""
    IO.popen('./mood_music recommend', 'r+') do |pipe|
      expected = <<EOS
What is your mood today?
1. happy
2. sad
3. mellow
4. angry
EOS
    pipe.puts "1"
    expected << "I recommend the song Elephant by Tame Impala based on your happy mood.\n"
    pipe.close_write
    shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end


   def test_getting_a_recommendation_invalid_input
    shell_output = ""
    expected = ""
    IO.popen('./mood_music recommend', 'r+') do |pipe|
      expected = <<EOS
What is your mood today?
1. happy
2. sad
3. mellow
4. angry
EOS
    pipe.puts "6"
      expected << <<EOS
What is your mood today?
1. happy
2. sad
3. mellow
4. angry
EOS
    pipe.puts "1"
    expected << "I recommend the song Elephant by Tame Impala based on your happy mood.\n"
    pipe.close_write
    shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

end
