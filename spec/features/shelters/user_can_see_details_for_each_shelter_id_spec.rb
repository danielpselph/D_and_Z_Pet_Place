
# User Story 14, Shelter Delete From Shelter Index Page

# As a visitor
# When I visit the shelter index page
# Next to every shelter, I see a link to delete that shelter
# When I click the link
# I am returned to the Shelter Index Page where I no longer see that shelter

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

    it "can see shelter attributes" do

      visit "/shelters/#{@shelter_1.id}"

      expect(page).to have_button("Back to Shelters")
      expect(page).to have_button("Back to Pets")

      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_1.address)
      expect(page).to have_content(@shelter_1.city)
      expect(page).to have_content(@shelter_1.state)
      expect(page).to have_content(@shelter_1.zip)
      expect(page).to have_button("Pets")
      expect(page).to have_button("Edit")
      expect(page).to have_button("Delete")
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
  end
end
