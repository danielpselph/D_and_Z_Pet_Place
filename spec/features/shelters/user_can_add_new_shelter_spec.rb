require 'rails_helper'

RSpec.describe "new shelter page", type: :feature do
  context "as a visitor" do
    it "can add a new shelter" do
      visit "/shelters/new"

      expect(page).to have_css("input", :count=>5)
    end
  end
  describe 'form submission' do
    it 'can submit a new shelter' do
      visit '/shelters/new'


    end
  end
end
