class Pet < ApplicationRecord
  validates_presence_of :image, :name, :age, :description, :sex, :shelter_id, :status
  belongs_to :shelter
  has_many :application_pets
  has_many :applications, through: :application_pets
end
