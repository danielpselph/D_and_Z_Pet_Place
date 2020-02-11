require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  context "as a visitor" do
    it "can see all shelters names" do
      shelter_1 = Shelter.create(name: "Shelter 1", address: "Place", city: "Metropolis", state: "Denial", zip: "90000")

      visit "/shelters"

      expect(page).to have_button("Back to Shelters")
      expect(page).to have_button("Back to Pets")

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_button("New Shelter")
    end
  end

  it 'When I visit the shelter index page, next to every shelter I see a link to edit that shelters info' do

    shelter_1 = Shelter.create(name: "Shelter 1", address: "Place", city: "Metropolis", state: "Denial", zip: "90000")

    visit '/shelters'

    expect(page).to have_button("Back to Shelters")
    expect(page).to have_button("Back to Pets")

    within "#shelter-#{shelter_1.id}" do
      expect(page).to have_button("Edit")
      click_on "Edit"
    end

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    visit '/shelters'

    expect(page).to have_button("Back to Shelters")
    expect(page).to have_button("Back to Pets")

    within "#shelter-#{shelter_1.id}" do
      expect(page).to have_button("Delete")
      click_on "Delete"
    end

    expect(current_path).to eq("/shelters")

  end
end
