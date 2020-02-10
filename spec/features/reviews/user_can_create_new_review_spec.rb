require 'rails_helper'

RSpec.describe "shelter id page", type: :feature do
    context "as a visitor" do
        before :each do
            @shelter_1 = Shelter.create(name: "Shelter 1",
                                        address: "42 Wallaby Way",
                                        city: "Sydney",
                                        state: "OZ",
                                        zip: "12345"
                                        )
            @review_1 = Review.create(title: "Broken Dog",
                                        rating: 1,
                                        content: "The dog you sold me sucks",
                                        shelter_id: "#{@shelter_1.id}",
                                        image: " ")
            @review_2 = Review.create(title: "Ugly Dog",
                                        rating: 2,
                                        content: "The dog you sold is ugly",
                                        shelter_id: "#{@shelter_1.id}",
                                        image: " ")
        end

        it "has a link to add new review and take you to a review form to fill out" do

            visit "/shelters/#{@shelter_1.id}"
      
              expect(page).to have_link("Add Review") 
              
              click_on "Add Review"
      
              expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews/new")
      
              expect(page).to have_content("Title")
              expect(page).to have_content("Rating")
              expect(page).to have_content("Content")
              expect(page).to have_content("Image")
      
              fill_in :title, with: "TitleTitle"
              fill_in :rating, with: 1
              fill_in :content, with: "ContentContent"
              # fill_in :image, with: "ImageImage"
      
              click_on "Add Review"
      
              expect(current_path).to eq("/shelters/#{@shelter_1.id}")
      
              expect(page).to have_content("TitleTitle")
              expect(page).to have_content(1)
              expect(page).to have_content("ContentContent")
              # expect(page).to have_content("ImageImage")
            end
      
        it "will display error message if reviews fields are not entered and returned to create form" do
    
        visit "/shelters/#{@shelter_1.id}"
    
            expect(page).to have_link("Add Review") 
            
            click_on "Add Review"
    
            fill_in :title, with: "TitleTitle"
            fill_in :rating, with: 1
            fill_in :content, with: ""
    
            click_on "Add Review"
    
            # expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews/new")
            expect(page).to have_content("All fields must be completed to submit review.")  
            # expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews/new")
            expect(page).to have_button("Add Review") 
    
        end
    end 
end
