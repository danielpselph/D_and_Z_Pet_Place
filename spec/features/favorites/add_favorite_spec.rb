require 'rails_helper'

RSpec.describe "When a user adds pets to their favorite" do
  context 'When I favorite a pet' do
    before :each do
      @shelter_1 = Shelter.create(name: "STANKY dawgs",
        address: "42 Wallaby Way",
        city: "Sydney",
        state: "OZ",
        zip: "12345",
      )
      @pet_1 = Pet.create(name: "Fido",
        age: "6 weeks",
        sex: "M",
        description: "Absolute unit.",
        image: "https://nationalpostcom.files.wordpress.com/2019/12/tarzan-2.jpg?quality=80&strip=all&w=780&zoom=2",
        shelter_id: "#{@shelter_1.id}",
        status: "It's complicated"
      )
      @pet_3 = Pet.create(name: "Boo",
        age: "10 months",
        sex: "F",
        description: "Cuddle monster",
        image: "https://www.pets4homes.co.uk/images/articles/686/large/1cd87f6bfb8e33796dbba267173798fa.jpg",
        shelter_id: "#{@shelter_1.id}",
        status: "Available"
      )
    end

    it "displays a message" do
      # require "pry"; binding.pry
      visit "/pets"

      within("#pet-#{@pet_1.id}") do
        click_button "Favorite Pet"
      end

      expect(page).to have_content("#{@pet_1.name} is now in your Favorites.")
    end

    it "correctly adds up favorited pets" do
      visit "/pets"


      expect(page).to have_button("Favorites: 0")

      within("#pet-#{@pet_1.id}") do
        click_button "Favorite Pet"
      end
      # save_and_open_page

      expect(page).to have_button("Favorites: 1")

      click_button "Back to Pets"

      within("#pet-#{@pet_3.id}") do
        click_button "Favorite Pet"
      end

      expect(page).to have_button("Favorites: 2")
    end
  end
end
