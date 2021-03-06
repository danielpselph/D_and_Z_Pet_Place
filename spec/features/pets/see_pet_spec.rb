require 'rails_helper'

RSpec.describe 'Pet Show Page', type: :feature do
  context 'as a visitor' do
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

    it "can show pet info" do
      visit "/pets/#{@pet_1.id}"

      expect(page).to have_button("Back to Shelters")
      expect(page).to have_button("Back to Pets")

      expect(page).to have_css("img[src*='#{@pet_1.image}']")
      expect(page).to have_content(@pet_1.name)
      expect(page).to have_content(@pet_1.description)
      expect(page).to have_content(@pet_1.age)
      expect(page).to have_content(@pet_1.sex)
      expect(page).to have_content(@pet_1.status)
      expect(page).to have_no_content("Boo")
    end

    it 'should show applications on a pet show page' do
      @app_1 = Adoption.create(name: "Sandy",
        address: "4040 Main St.",
        city: "Birmingham",
        state: "AL",
        zip: "20400",
        phone: "6669407322",
        qualifications: "I like dogs",
        pets: [@pet_1, @pet_3]
        )

      visit "/pets/#{@pet_1.id}"
      click_on "View All Applications"

      expect(page).to have_content("Open Applications")
      expect(page).to have_link("Sandy")
    end

    it 'should' do
      visit "/pets/#{@pet_1.id}"
      expect(page).to have_content("No Open Applications")
    end
  end
end
