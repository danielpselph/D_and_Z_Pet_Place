require 'rails_helper'

RSpec.describe 'As a visitor to favorites index', method: :feature do
  before(:each) do
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

  it 'should show favorited pets' do
    visit "/pets/#{@pet_1.id}"
    click_on "Favorite Pet"
    visit "/pets/#{@pet_3.id}"
    click_on "Favorite Pet"

    visit "/shelters/#{@shelter_1.id}/pets"
    within "#pet-#{@pet_1.id}" do
      expect(page).to_not have_button("Favorite Pet")
      expect(page).to have_button("Remove from Favorites")
    end

    visit "/pets"
    within "#pet-#{@pet_1.id}" do
      expect(page).to_not have_button("Favorite Pet")
      expect(page).to have_button("Remove from Favorites")
    end

    visit "/pets/#{@pet_1.id}"
    expect(page).to_not have_button("Favorite Pet")
    expect(page).to have_button("Remove from Favorites")

    click_on "Remove from Favorites"
    visit "/favorites"
    expect(page).to_not have_content("Fido")
  end
end
