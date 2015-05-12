require_relative '../helper'

class TestDeletingARecommendation < Minitest::Test


    # NOTE: how to do expected part for database listing??
    # For now, hard code results from database
    def test_deleting_a_recommendation_happy_path
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
      pipe.puts "2"
      expected << "Your song recommendation has been deleted."
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

end
