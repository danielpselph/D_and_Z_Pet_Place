require 'rails_helper'

RSpec.describe 'Pet Update Page', type: :feature do
  context 'as a user' do
    it 'can see a form to edit the pet data' do
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

      visit "/pets/#{pet_1.id}/edit"

      expect(page).to have_button("Back to Shelters")
      expect(page).to have_button("Back to Pets")

      fill_in 'name', with: "Newman"
      fill_in 'image', with: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ23jP_NPlSrtXbMTm-GW7LH3-isvLy5pWrMRfbE_8-thYC1Iz9"
      fill_in 'description', with: "Newmaaan"
      fill_in 'age', with: "10 weeks"
      fill_in 'sex', with: "MTF"

      click_on "Update Pet"

      expect(current_path).to eq("/pets/#{pet_1.id}")
      expect(page).to have_content("Newman")
      expect(page).to_not have_content("frisky")
    end

    it "will display error message if fields missing" do
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

      click_on "Edit"

      fill_in 'name', with: ""
      fill_in 'image', with: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ23jP_NPlSrtXbMTm-GW7LH3-isvLy5pWrMRfbE_8-thYC1Iz9"
      fill_in 'description', with: "Newmaaan"
      fill_in 'age', with: ""
      fill_in 'sex', with: "MTF"   
      
      click_on "Update Pet"

      expect(page).to have_content("Name can't be blank and Age can't be blank")
    end
    
  end
end
