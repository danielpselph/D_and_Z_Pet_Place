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

            expect(page).to have_content("All fields must be completed to submit review.")

            fill_in :title, with: "Ugly Dog"
            fill_in :rating, with: 2
            fill_in :content, with: "The dog you sold is ugly"
            fill_in :image, with: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTkoYC686pLn-B0Dtd21trr4iO0yL3zih-UfkeVI0lGgpU5EDmp"

            click_on "Add Review"

            expect(current_path).to eq("/shelters/#{@shelter_1.id}")
        end
    end
end
