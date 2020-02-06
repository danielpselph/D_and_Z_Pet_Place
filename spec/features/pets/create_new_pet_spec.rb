require 'rails_helper'

RSpec.describe "create shelter pet", type: :feature do
  context "as a visitor" do
    it "can create new pet" do
      shelter_1 = Shelter.create(name: "STANKY dawgs",
        address: "42 Wallaby Way",
        city: "Sydney",
        state: "OZ",
        zip: "12345",
      )
      shelter_2 = Shelter.create(name: "KILL SHELTER no. 666",
        address: "11 Pine Street",
        city: "Austin",
        state: "TX",
        zip: "54321"
      )
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
        shelter_id: "#{shelter_1.id}",
        status: "It's complicated"
        )
      pet_2 = Pet.create(name: "Peter",
        age: "8 years",
        sex: "M",
        description: "Big doofus",
        image: "https://media4.s-nbcnews.com/i/newscms/2016_52/1184388/rescue-group-old-dog-haven-today-161226-tease-01_00bac92f7fa6330b327ff47cdd4acdf2.jpg",
        shelter_id: "#{shelter_3.id}",
        status: "Single af"
        )
      pet_3 = Pet.create(name: "Boo",
        age: "10 months",
        sex: "F",
        description: "Cuddle monster",
        image: "https://www.pets4homes.co.uk/images/articles/686/large/1cd87f6bfb8e33796dbba267173798fa.jpg",
        shelter_id: "#{shelter_3.id}",
        status: "Available"
        )
      pet_4 = Pet.create(name: "Brutus",
        age: "2 years",
        sex: "F",
        description: "Chonk",
        image: "https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg",
        shelter_id: "#{shelter_2.id}",
        status: "Claimed"
        )

      visit "/shelters/#{shelter_1.id}/pets"

      expect(page).to have_link("Back to Shelters")
      expect(page).to have_link("Back to Pets")

      click_on "Create Pet"

      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

      fill_in 'image', with: 'https://image.shutterstock.com/image-photo/beagle-running-over-green-meadow-600w-1563583912.jpg'
      fill_in 'name', with: 'Marcus'
      fill_in 'description', with: 'Gross lookin dawg'
      fill_in 'age', with: '3'
      fill_in 'sex', with: 'F'

      click_on "Create Pet"

      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")

      expect(page).to have_content("Marcus")
    end
  end
end
