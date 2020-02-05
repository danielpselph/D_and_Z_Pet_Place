require 'rails_helper'

RSpec.describe 'pet delete', type: :feature do

  context 'as a user' do
    it 'can delete pet' do
      shelter_1 = Shelter.create(name: "STANKY dawgs",
        address: "42 Wallaby Way",
        city: "Sydney",
        state: "OZ",
        zip: "12345",
      )
      pet_1 = Pet.create(name: "Fido",
        age: "6 weeks",
        sex: "M",
        description: "Absolute unit.",
        image: "https://nationalpostcom.files.wordpress.com/2019/12/tarzan-2.jpg?quality=80&strip=all&w=780&zoom=2",
        shelter_id: "#{shelter_1.id}",
        status: "It's complicated"
        )


      visit "/pets/#{pet_1.id}"

      click_on "Delete Pet"

      expect(current_path).to eq('/pets')
      expect(page).to_not have_content("Fido")
    end
  end
end
