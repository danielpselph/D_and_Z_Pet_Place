require 'rails_helper'

RSpec.describe "shelter pet index page", type: :feature do
  context "as a visitor" do
    it "can see all pets names" do
      shelter_3 = Shelter.create(name: "Puppy Love",
        address: "1600 Pennsylvania Avenue",
        city: "Washington",
        state: "DC",
        zip: "98765"
      )
      pet_1 = Pet.create(name: "Fido",
        age: "6 weeks",
        sex: "M",
        description: "Absolute unit.",
        image: "https://nationalpostcom.files.wordpress.com/2019/12/tarzan-2.jpg?quality=80&strip=all&w=780&zoom=2",
        shelter_id: "#{shelter_3.id}",
        status: "It's complicated"
        )

      visit "/shelters/#{shelter_3.id}/pets"

      expect(page).to have_button("Back to Shelters")
      expect(page).to have_button("Back to Pets")

      expect(page).to have_content(shelter_3.name)
      expect(page).to have_content("Fido")
      expect(page).to have_content("6 weeks")
    end
  end
end
