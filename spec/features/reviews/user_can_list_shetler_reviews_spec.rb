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

    it "I see a list of reviews for that shelter" do
   
        visit "/shelters/#{@shelter_1.id}"
  # binding.pry
            within "#review-#{@review_1.id}" do
    
            expect(page).to have_content(@review_1.title)
            expect(page).to have_content(@review_1.rating)
            expect(page).to have_content(@review_1.content)
            end
    
            within "#review-#{@review_2.id}" do
            expect(page).to have_content(@review_2.title)
            expect(page).to have_content(@review_2.rating)
            expect(page).to have_content(@review_2.content)
            end
        end
    end
end