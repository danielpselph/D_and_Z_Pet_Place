require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  context "as a visitor" do
    it "can see all shelters names" do
      shelter_1 = Shelter.create(name: "Shelter 1", address: "Place", city: "Metropolis", state: "Denial", zip: "90000")

      visit "/shelters"

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_button("New Shelter")
    end
  end

# User Story 13, Shelter Update From Shelter Index Page

# As a visitor
# When I visit the shelter index page
# Next to every shelter, I see a link to edit that shelter's info
# When I click the link
# I should be taken to that shelters edit page where I can update its information just like in User Story 5


  it 'When I visit the shelter index page, next to every shelter I see a link to edit that shelters info' do

    shelter_1 = Shelter.create(name: "Shelter 1", address: "Place", city: "Metropolis", state: "Denial", zip: "90000")

    visit '/shelters'

    within "#shelter-#{shelter_1.id}" do
      expect(page).to have_button("Edit")
      click_on "Edit"
    end

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

  end 
end

