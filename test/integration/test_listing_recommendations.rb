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
    expected << "No recommendations found.  Add a recommendation.\n"
    pipe.close_write
    shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end
end
