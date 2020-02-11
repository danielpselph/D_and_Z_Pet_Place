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

        it "has a link to edit review" do

            visit "/shelters/#{@shelter_1.id}"

            expect(page).to have_content(@review_1.title)
            expect(page).to have_content(@review_1.rating)
            expect(page).to have_content(@review_1.content)

            within "#review-#{@review_1.id}" do
                expect(page).to have_link("Edit Review")
                click_on "Edit Review"
            end

            expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews/#{@review_1.id}/edit")
        end  

        it 'will display and error message if user does not enter all required info and returned to edit page' do 

            visit "/shelters/#{@shelter_1.id}/reviews/#{@review_1.id}/edit"
    
            fill_in :title, with: "New Title"
            fill_in :rating, with: 3
            fill_in :content, with: ""

            click_on "Add Review"
    
            # within "#review-#{@review_1.id}" do
            #     expect(page).to have_link("Edit Review")
            #     click_on "Edit Review"
            # end
    
            # expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews/new")
            expect(page).to have_content("All fields must be completed to submit review.")  
            # expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews/new")
            expect(page).to have_button("Add Review") 
        end
    end  
end

# User Story 6, Edit a Shelter Review, cont.

# As a visitor,
# When I fail to enter a title, a rating, and/or content in the edit shelter review form, but still try to submit the form
# I see a flash message indicating that I need to fill in a title, rating, and content in order to edit a shelter review
# And I'm returned to the edit form to edit that review
