require 'rails_helper'

RSpec.describe AdoptionPet, type: :model do
  describe "relationships" do
    it {should belong_to :adoption}
    it {should belong_to :pet}
  end
end
