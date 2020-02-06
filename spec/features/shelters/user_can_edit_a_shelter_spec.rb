# User Story 13, Shelter Update From Shelter Index Page

# As a visitor
# When I visit the shelter index page
# Next to every shelter, I see a link to edit that shelter's info
# When I click the link
# I should be taken to that shelters edit page where I can update its information just like in User Story 5

require 'rails_helper'

describe 'As a visitor' do
    describe 'When I visit shelter show page' do
        before :each do
            @shelter1 = Shelter.create!(name: 'Sebastians',
                                        address: '123 Abc St',
                                        city: 'Denver',
                                        state: 'CO',
                                        zip: '90210')
            @shelter2 = Shelter.create!(name: 'bob',
                                        address: '1111 Ash St',
                                        city: 'Denver',
                                        state: 'CO',
                                        zip: '80220')

        end

    it 'I should see a link to "Edit"' do

        visit "/shelters/#{@shelter2.id}"

        expect(page).to have_link("Back to Shelters")
        expect(page).to have_link("Back to Pets")

            expect(current_path).to eq("/shelters/#{@shelter2.id}")

            expect(page).to have_button("Edit")

            click_on "Edit"

            expect(current_path).to eq("/shelters/#{@shelter2.id}/edit")

            expect(page).to have_content("Name")
            expect(page).to have_content("Address")
            expect(page).to have_content("City")
            expect(page).to have_content("State")
            expect(page).to have_content("Zip")

            fill_in "Name", with: "Sarahs Pet Sanctuary"
            fill_in "Address", with: "678 Cactus Dr"
            fill_in "City", with: "Phoenix"
            fill_in "State", with: "AZ"
            fill_in "Zip", with: "85371"

            click_on "Update Shelter"

            expect(current_path).to eq("/shelters/#{@shelter2.id}")

            expect(page).to have_content("Sarahs Pet Sanctuary")
            expect(page).to have_content("678 Cactus Dr")
            expect(page).to have_content("Phoenix")
            expect(page).to have_content("AZ")
            expect(page).to have_content("85371")

            expect(page).not_to have_content("bob")
            expect(page).not_to have_content("1111 Ash St")
            expect(page).not_to have_content("Denver")
            expect(page).not_to have_content("CO")
            expect(page).not_to have_content("80220")
        end
    end
end
