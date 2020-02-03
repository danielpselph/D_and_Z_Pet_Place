require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
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
        image: "https://nationalpostcom.files.wordpress.com/2019/12/tarzan-2.jpg?quality=80&strip=all&w=780&zoom=2",
        shelter_id: "#{shelter_3.id}"
        )

      visit "/pets"

      expect(page).to have_content(pet_1.name)
      # expect(page).to have_link("New Shelter", :href=>"/shelters/new")
    end
  end
end
