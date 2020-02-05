# User Story 14, Shelter Delete From Shelter Index Page

# As a visitor
# When I visit the shelter index page
# Next to every shelter, I see a link to delete that shelter
# When I click the link
# I am returned to the Shelter Index Page where I no longer see that shelter

require 'rails_helper'
RSpec.describe "shelter delete action", type: :feature do
    context "as a visitor" do
      it "can delete a shelter from index" do
        shelter_3 = Shelter.create(name: "Puppy Love",
          address: "1600 Pennsylvania Avenue",
          city: "Washington",
          state: "DC",
          zip: "98765"
        )
        visit '/shelters'
        expect(current_path).to eq("/shelters")
        expect(page).to have_button("Delete")
        click_on "Delete"
        expect(current_path).to eq("/shelters")
        expect(page).not_to have_content(shelter_3.name)
        expect(page).not_to have_content(shelter_3.address)
        expect(page).not_to have_content(shelter_3.city)
        expect(page).not_to have_content(shelter_3.state)
        expect(page).not_to have_content(shelter_3.zip)
      end
    end
end
