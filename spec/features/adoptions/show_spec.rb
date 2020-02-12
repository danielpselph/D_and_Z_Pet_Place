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
    @app_1 = Adoption.create(name: "Sandy",
      address: "4040 Main St.",
      city: "Birmingham",
      state: "AL",
      zip: "20400",
      phone: "6669407322",
      qualifications: "I like dogs",
      pets: [@pet_1, @pet_3]
      )
  end

  it 'should show favorited pets' do
    visit "/adoptions/#{@app_1.id}"

    expect(page).to have_content(@app_1.name)
    expect(page).to have_content(@app_1.address)
    expect(page).to have_content(@app_1.city)
    expect(page).to have_content(@app_1.state)
    expect(page).to have_content(@app_1.zip)
    expect(page).to have_content(@app_1.phone)
    expect(page).to have_content(@app_1.qualifications)
    expect(page).to have_content("Fido")
    expect(page).to have_content("Boo")
  end
end
