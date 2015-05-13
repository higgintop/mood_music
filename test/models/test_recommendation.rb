require_relative '../helper'

describe Recommendation do

  # Rec#all
  describe "all" do
    describe "if there are no recs in database" do
      it "should return an empty array" do
        assert_equal [], Recommendation.all
      end
    end

    describe "if there are recs in database" do
      before do
        create_recommendation("Bob")
        create_recommendation("Sally")
        create_recommendation("Allison")
      end
      it "should return an array" do
        assert_equal Array, Recommendation.all.class
      end
      it "should return the recs in alpha order" do
        actual = Recommendation.all.map{|rec| rec.name}
        expected = ["Allison", "Bob", "Sally"]
        assert_equal expected, actual
      end
    end
  end
  
  # Rec#count
  describe "count" do
    describe "if there are no recs in database" do
      it "should return 0" do
        assert_equal 0, Recommendation.count
      end
    end

    describe "if there are recs in database" do
      before do
        create_recommendation("Bob")
        create_recommendation("Sally")
        create_recommendation("Allison")
      end

      it "should return the correct count" do
        assert_equal 3, Recommendation.count
      end
    end
  end
end
