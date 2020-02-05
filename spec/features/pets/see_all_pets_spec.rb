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
        description: "Absolute unit.",
        image: "https://nationalpostcom.files.wordpress.com/2019/12/tarzan-2.jpg?quality=80&strip=all&w=780&zoom=2",
        shelter_id: "#{shelter_3.id}",
        status: "It's complicated"
        )

      visit "/pets"

      expect(page).to have_content(pet_1.name)
      # expect(page).to have_link("New Shelter", :href=>"/shelters/new")
    end

    it "can update and delete pet from pets index page" do

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

      visit '/pets'

      within "#pet-#{pet_1.id}" do
        expect(page).to have_button("Edit")
        click_on "Edit"
      end

      expect(current_path).to eq("/pets/#{pet_1.id}/edit")
      
      visit '/pets'

      within "#pet-#{pet_1.id}" do
        expect(page).to have_button("Delete")
        click_on "Delete"
      end

      expect(current_path).to eq("/pets")
    end
  end
end
