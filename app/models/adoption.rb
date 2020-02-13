class Adoption < ApplicationRecord
  validates_presence_of :name, :address, :city, :state, :zip, :phone, :qualifications
  has_many :adoption_pets
  has_many :pets, through: :adoption_pets
end
