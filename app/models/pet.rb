class Pet < ApplicationRecord
  validates_presence_of :image, :name, :age, :description, :sex, :shelter_id, :status
  belongs_to :shelter
  has_many :adoption_pets, dependent: :destroy
  has_many :adoptions, through: :adoption_pets

end
