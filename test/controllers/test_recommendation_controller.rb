require_relative '../helper'

describe RecommendationsController do

  # .index is instance method - need an instance of class to use
  # #index is a class method - don't need an instance to use method
  describe ".index" do
    let(:controller) {RecommendationController.new}
    it "should say no scenarios found when empty" do
      actual = controller.index
      expected = "No recommendations found.\n"
      assert_equal expected, actual
    end
  end

  describe ".add" do
    let(:controller) {RecommendationController.new}
    describe "" do
      it "should add a recommendation to the database" do

      end
    end
  end

end
