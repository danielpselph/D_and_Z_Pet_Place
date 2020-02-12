class Adoption < ApplicationRecord
  has_many :adoption_pets
  has_many :pets, through: :adoption_pets
end
