require 'rails_helper'

describe Shelter, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
  end

  describe 'relationships' do
    it { should have_many :pets }
    it { should have_many :reviews}
  end

  describe "shelter methods" do
    before :each do
      @shelter_1 = Shelter.create(name: 'Sebastians',
                                address: '123 Abc St',
                                city: 'Denver',
                                state: 'CO',
                                zip: '90210')
      @shelter_2 = Shelter.create(name: 'bob',
                                address: '1111 Ash St',
                                city: 'Denver',
                                state: 'CO',
                                zip: '80220')
      @shelter_3 = Shelter.create(name: 'Martha Stewart',
                                address: '1300 Metropolitan',
                                city: 'Leavenworth',
                                state: 'KS',
                                zip: '66048')
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
      @review_3 = Review.create(title: "Smart Dog",
                                rating: 3,
                                content: "This dog knows Spanish!",
                                shelter_id: "#{@shelter_1.id}",
                                image: " ")
      @pet_1 = Pet.create(name: "Fido",
                          age: "6 weeks",
                          sex: "M",
                          description: "Absolute unit.",
                          image: "https://nationalpostcom.files.wordpress.com/2019/12/tarzan-2.jpg?quality=80&strip=all&w=780&zoom=2",
                          shelter_id: "#{@shelter_3.id}",
                          status: "pending"
                          )
      @pet_2 = Pet.create(name: "Peter",
                          age: "8 years",
                          sex: "M",
                          description: "Big doofus",
                          image: "https://media4.s-nbcnews.com/i/newscms/2016_52/1184388/rescue-group-old-dog-haven-today-161226-tease-01_00bac92f7fa6330b327ff47cdd4acdf2.jpg",
                          shelter_id: "#{@shelter_3.id}",
                          status: "Single af"
                          )
      @pet_3 = Pet.create(name: "Boo",
                          age: "10 months",
                          sex: "F",
                          description: "Cuddle monster",
                          image: "https://www.pets4homes.co.uk/images/articles/686/large/1cd87f6bfb8e33796dbba267173798fa.jpg",
                          shelter_id: "#{@shelter_3.id}",
                          status: "Available"
                          )
    end

    it "can count number of pets at the shelter" do
      expect(@shelter_3.pet_count).to eq(3)
    end

    it "can return average rating" do
      expect(@shelter_1.average_rating).to eq(2)
    end

    it ".has_pending_pets?" do
      expect(@shelter_3.has_pending_pets?).to eq(false)
    end


  end
end
