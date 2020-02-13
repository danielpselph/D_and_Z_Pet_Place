class Shelter < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip
  has_many :pets, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def pet_count
    pets.count
  end

  def average_rating
    reviews.average(:rating)
  end

  def has_pending_pets?
    require "pry"; binding.pry
    if self.pets.find {|pet| pet.status.include?("Pending")}
      return true
    else
      return false
    end
  end

end
