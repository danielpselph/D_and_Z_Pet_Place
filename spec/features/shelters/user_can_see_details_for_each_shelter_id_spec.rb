
# User Story 14, Shelter Delete From Shelter Index Page

# As a visitor
# When I visit the shelter index page
# Next to every shelter, I see a link to delete that shelter
# When I click the link
# I am returned to the Shelter Index Page where I no longer see that shelter

require 'rails_helper'

RSpec.describe "shelter id page", type: :feature do
  context "as a visitor" do
    before :each do
      @shelter_1 = Shelter.create(name: "Shelter 1",
                                  address: "42 Wallaby Way",
                                  city: "Sydney",
                                  state: "OZ",
                                  zip: "12345"
                                )
      @review_1 = Review.create(title: "Broken Dog",
                                rating: 1,
                                content: "The dog you sold me sucks")
    end

    it "can see shelter attributes" do
 
      visit "/shelters/#{@shelter_1.id}"

      expect(page).to have_link("Back to Shelters")
      expect(page).to have_link("Back to Pets")

      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_1.address)
      expect(page).to have_content(@shelter_1.city)
      expect(page).to have_content(@shelter_1.state)
      expect(page).to have_content(@shelter_1.zip)
      expect(page).to have_button("Pets")
      expect(page).to have_button("Edit")
      expect(page).to have_button("Delete")
      expect(page).to have_link("Add Review")  
    end

    it "I see a list of reviews for that shelter" do
   
    visit "/shelters/#{@shelter_1.id}"

    expect(page).to have_content(@review_1.title)
    expect(page).to have_content(@review_1.rating)
    expect(page).to have_content(@review_1.content)
    end
  end
end
