require 'rails_helper'

RSpec.describe "shelter id page", type: :feature do
  context "as a visitor" do
    it "can see shelter attributes" do
      shelter_1 = Shelter.create(name: "Shelter 1",
        address: "42 Wallaby Way",
        city: "Sydney",
        state: "OZ",
        zip: "12345"
      )

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_1.address)
      expect(page).to have_content(shelter_1.city)
      expect(page).to have_content(shelter_1.state)
      expect(page).to have_content(shelter_1.zip)
    end
  end
end
