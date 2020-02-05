require 'rails_helper'

RSpec.describe "new shelter page", type: :feature do
  context "as a visitor" do
    it "create shelter show up on index page" do
      visit "/shelters/new"

      expect(page).to have_content("Name")
      expect(page).to have_content("Address")
      expect(page).to have_content("City")
      expect(page).to have_content("State")
      expect(page).to have_content("Zip")
      fill_in :name, with: "Daniels"
      fill_in :address, with: "321 Bca Ave"
      fill_in :city, with: "Denver"
      fill_in :state, with: "CO"
      fill_in :zip, with: "85048"
      click_on "New Shelter"
      expect(current_path).to eq('/shelters')
      expect(page).to have_content("Daniels")
    end
  end
  describe 'form submission' do
    it 'can create a new shelter' do
      shelter_1 = Shelter.create(name: "STANKY dawgs",
        address: "42 Wallaby Ave",
        city: "Sydney",
        state: "OZ",
        zip: "12345"
      )

      visit "/shelters/#{shelter_1.id}"
      expect(page).to have_content("STANKY dawgs")
      expect(page).to have_content("42 Wallaby Ave")
      expect(page).to have_content("Sydney")
      expect(page).to have_content("OZ")
      expect(page).to have_content("12345")

    end
  end
end
