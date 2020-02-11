require 'rails_helper'

RSpec.describe Favorites do
  subject { Favorites.new([1,2,3,4,5])}

  describe "#total_count" do
    it "can calculate the total number of items it holds" do
      expect(subject.total_count).to eq(5)
    end
  end

  describe "#add_pet" do
    it "adds a pet to its contents" do
      favorites = Favorites.new([])
      favorites.add_pet(1)
      favorites.add_pet(2)

      expect(favorites.contents).to eq([1,2])
    end
  end
end
