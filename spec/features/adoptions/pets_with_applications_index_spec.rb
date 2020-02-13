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

    click_on 'Favorites: 2'

    click_link "Adopt!"


    within("div#pet-#{@pet_1.id}") do
      check :adopt_pets_
    end

    within("div#pet-#{@pet_3.id}") do
      check :adopt_pets_
    end

    fill_in :name, with: "Daniels"
    fill_in :address, with: "321 Bca Ave"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: "85048"
    fill_in :phone, with: "(303)867-5309"
    fill_in :qualifications, with: "I'm a good dog mom"

    click_on "Create New Adoption Application"

    expect(current_path).to eq("/favorites")

    within("#pets_with_open_applications") do
      # require "pry"; binding.pry
      expect(page).to have_content("Fido")
      expect(page).to have_content("Boo")
    end
  end

  it 'should not have adopt button if there are no favorites'

  end 
end
